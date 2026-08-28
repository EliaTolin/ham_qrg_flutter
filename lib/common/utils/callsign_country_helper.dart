/// Resolves the country of origin of an amateur radio callsign, so the UI can
/// show a flag next to a callsign (POTA/SOTA activators, cluster spots,
/// repeater owners, ...).
///
/// ## What this answers — and what it does not
///
/// The prefix of a callsign identifies the administration that **issued** it,
/// not the place the operator is transmitting from. `DL1ABC/I` activating an
/// Italian summit still resolves to Germany. Where the *location* matters and
/// a better source exists (POTA `locationDesc`, SOTA `summitCode`), prefer
/// that source over this helper.
///
/// ## Data sources
///
/// The base table is the ITU Table of International Call Sign Series
/// (Appendix 42 to the Radio Regulations), which is authoritative and covers
/// every allocated series:
/// https://www.itu.int/en/ITU-R/terrestrial/fmd/Pages/call_sign_series.aspx
///
/// On top of it sits a small override table for the cases where the amateur
/// radio world is finer grained than the ITU one: the ITU allocates a whole
/// block to a parent state (F to France, G/M to the UK, A/K/N/W to the USA)
/// while the individual territories inside it have their own flag
/// (Guadeloupe, Jersey, Puerto Rico, ...). Those overrides were cross-checked
/// against the DXCC-style prefix lists at hamdeck.com and on4sh.be.
///
/// ## ISO codes
///
/// Countries are returned as ISO 3166-1 alpha-2 codes, which map 1:1 onto
/// regional-indicator flag emoji. Only officially assigned codes are used, so
/// every result renders as a real flag on iOS and Android. Entities without an
/// official code (Kosovo, S.M.O.M., the Spratlys) and international
/// organisations (4U, 4Y, C7) are recognised but resolve to `null`, so callers
/// simply render no flag rather than an unrelated one.
library;

/// Maps amateur radio callsigns to the country that issued them.
abstract final class CallsignCountryHelper {
  /// First code point of the regional indicator symbols (`A`).
  static const _regionalIndicatorA = 0x1F1E6;

  /// Suffixes that describe *how* a station operates, not *where* it is, and
  /// that must therefore never be treated as a location prefix.
  static const _operationalSuffixes = {
    'P',
    'M',
    'MM',
    'AM',
    'A',
    'B',
    'J',
    'R',
    'T',
    'QRP',
    'LH',
    'BCN',
    'RPT',
  };

  /// Matches a call area digit used as a suffix, such as the `4` in `W1AW/4`.
  static final _callAreaDigits = RegExp(r'^\d{1,2}$');

  /// Captures the leading run of callsign characters in a `/` separated part.
  ///
  /// Spot feeds decorate what they publish: the RBN skimmers behind the POTA
  /// feed append a node marker (`AA0O-#`, `K1RA-4-#`), and comments leak into
  /// the field. Everything from the first foreign character onwards is noise
  /// and gets cut, so the decoration can neither hide a callsign nor outrank
  /// the one next to it.
  static final _callsignCharacters = RegExp('^[A-Z0-9]+');

  /// Longest prefix in the lookup tables, and therefore the longest candidate
  /// worth testing when matching a callsign.
  static const _maxPrefixLength = 4;

  /// Returns the ISO 3166-1 alpha-2 code of the administration that issued
  /// [callsign], or `null` when the prefix is unknown or belongs to an entity
  /// without an official country code.
  ///
  /// Handles the usual modifiers: `IU4VRB/P`, `W1AW/4`, `F/IU4VRB` (French
  /// prefix wins), `W1AW/KH6` (Hawaiian suffix wins).
  static String? isoCodeOf(String callsign) {
    final prefixPart = _locationPart(callsign);
    if (prefixPart == null) return null;

    final maxLength = prefixPart.length < _maxPrefixLength
        ? prefixPart.length
        : _maxPrefixLength;

    for (var length = maxLength; length > 0; length--) {
      final candidate = prefixPart.substring(0, length);
      final match = _dxccOverrides[candidate] ?? _ituCallSignSeries[candidate];
      if (match == null) continue;
      return match.isEmpty ? null : match;
    }

    return null;
  }

  /// Returns the flag emoji of the country that issued [callsign], or `null`
  /// when it cannot be resolved.
  static String? flagOf(String callsign) {
    final isoCode = isoCodeOf(callsign);
    return isoCode == null ? null : flagOfIsoCode(isoCode);
  }

  /// Converts an ISO 3166-1 alpha-2 code into its flag emoji.
  ///
  /// Returns `null` for anything that is not two ASCII letters.
  static String? flagOfIsoCode(String isoCode) {
    final code = isoCode.trim().toUpperCase();
    if (code.length != 2) return null;

    final first = code.codeUnitAt(0);
    final second = code.codeUnitAt(1);
    if (first < 0x41 || first > 0x5A || second < 0x41 || second > 0x5A) {
      return null;
    }

    return String.fromCharCodes([
      _regionalIndicatorA + (first - 0x41),
      _regionalIndicatorA + (second - 0x41),
    ]);
  }

  /// Extracts the portion of [callsign] that carries the location information.
  ///
  /// A callsign can be written as `prefix/call` (European style, the prefix
  /// wins) or `call/suffix` (US style, the suffix wins). In both forms the
  /// location part is the *shorter* of the two, because a base callsign always
  /// carries a suffix of its own on top of its prefix.
  ///
  /// Operational suffixes (`/P`, `/MM`, `/QRP`, ...) and call area digits
  /// (`/4`) are discarded first, since they say nothing about the country.
  /// They are only discarded in trailing position: several of them collide
  /// with real prefixes (`M` is the UK, `R` is Russia), and in leading
  /// position it is the prefix meaning that applies.
  ///
  /// Returns `null` when nothing usable is left.
  static String? _locationPart(String callsign) {
    final normalized = callsign.trim().toUpperCase();
    if (normalized.isEmpty) return null;

    final rawParts = normalized.split('/');
    final parts = <String>[];

    for (var index = 0; index < rawParts.length; index++) {
      final part = _callsignCharacters.stringMatch(rawParts[index]);
      if (part == null || part.isEmpty) continue;
      if (index > 0 &&
          (_operationalSuffixes.contains(part) ||
              _callAreaDigits.hasMatch(part))) {
        continue;
      }
      parts.add(part);
    }

    if (parts.isEmpty) return null;

    return parts.reduce(
      (shortest, part) => part.length < shortest.length ? part : shortest,
    );
  }

  /// Prefixes where the amateur radio world is finer grained than the ITU
  /// table, or where no ITU allocation exists at all. Looked up before
  /// [_ituCallSignSeries], longest prefix first.
  ///
  /// An empty value means "recognised, but there is no flag to show".
  static const _dxccOverrides = <String, String>{
    // French overseas territories (ITU allocates the whole F block to France)
    'FG': 'GP', 'FH': 'YT', 'FJ': 'BL', 'FK': 'NC', 'FM': 'MQ', 'FO': 'PF',
    'FP': 'PM', 'FR': 'RE', 'FS': 'MF', 'FT': 'TF', 'FW': 'WF', 'FY': 'GF',

    // UK crown dependencies (ITU allocates the whole G/M blocks to the UK)
    'GD': 'IM', 'GH': 'JE', 'GJ': 'JE', 'GP': 'GG', 'GT': 'IM', 'GU': 'GG',
    'MD': 'IM', 'MJ': 'JE', 'MT': 'IM', 'MU': 'GG',

    // UK overseas territories (ITU allocates these blocks to the UK)
    'VP2E': 'AI', 'VP2M': 'MS', 'VP2V': 'VG', 'VP5': 'TC', 'VP6': 'PN',
    'VP8': 'FK',
    'VP9': 'BM', 'VQ9': 'IO', 'ZB': 'GI', 'ZD7': 'SH', 'ZD8': 'SH', 'ZD9': 'SH',
    'ZF': 'KY',

    // US territories (ITU allocates the whole A/K/N/W blocks to the USA)
    'AH0': 'MP', 'AH2': 'GU', 'AH8': 'AS', 'KH0': 'MP', 'KH2': 'GU',
    'KH8': 'AS',
    'KP2': 'VI', 'KP3': 'PR', 'KP4': 'PR', 'NH0': 'MP', 'NH2': 'GU',
    'NH8': 'AS',
    'NP2': 'VI', 'NP3': 'PR', 'NP4': 'PR', 'WH0': 'MP', 'WH2': 'GU',
    'WH8': 'AS',
    'WP2': 'VI', 'WP3': 'PR', 'WP4': 'PR',

    // Danish, Norwegian and Finnish dependencies
    'JW': 'SJ', 'JX': 'SJ', 'OH0': 'AX', 'OJ0': 'AX', 'OX': 'GL', 'OY': 'FO',
    'XP': 'GL',

    // Dutch Caribbean: ITU lists three identical PJA-PJZ rows, so the digit is
    // what actually distinguishes the islands
    'PJ': 'CW', 'PJ2': 'CW', 'PJ4': 'BQ', 'PJ5': 'BQ', 'PJ6': 'BQ', 'PJ7': 'SX',
    'PJ8': 'SX', 'PJ9': 'CW',

    // ITU splits 3DA-3DM (Eswatini) from 3DN-3DZ (Fiji), but Fiji actually
    // uses 3D2, so the split has to be resolved on the digit
    '3D': 'SZ', '3D2': 'FJ', '3DA': 'SZ',

    // Pacific dependencies of Australia and New Zealand
    'VK9C': 'CC', 'VK9N': 'NF', 'VK9X': 'CX', 'ZK1': 'CK', 'ZK2': 'NU',
    'ZK3': 'TK',

    // Entities with no ITU allocation of their own
    '1A': '', '1S': '', 'CE9': 'AQ', 'HB0': 'LI', 'S0': 'EH', 'Z6': '',

    // Taiwan: the ITU allocates the whole B block to China, but these are the
    // prefixes actually issued in Taiwan
    'BM': 'TW', 'BN': 'TW', 'BO': 'TW', 'BP': 'TW', 'BQ': 'TW', 'BU': 'TW',
    'BV': 'TW', 'BW': 'TW', 'BX': 'TW',

    // The ITU allocates UA-UI to Russia, UJ-UM to Uzbekistan, UN-UQ to
    // Kazakhstan and UR-UZ to Ukraine, but says nothing about `U` followed by
    // a digit, which is in active use. Those fall back to Russia, except U5,
    // which is Ukrainian. The two-character series above are longer, so they
    // keep winning over this fallback.
    'U': 'RU', 'U5': 'UA',

    // Secondary prefixes that the ITU leaves inside the parent block
    'MH': 'JE', 'MP': 'GG', 'OF0': 'AX', 'OG0': 'AX', 'OI0': 'AX', 'OW': 'FO',
    'PJ0': 'SX', 'TW': 'WF', 'VK9Y': 'CC', 'VQ5': 'TC', 'ZG': 'GI',

    // The UK 2 block carries the same regional letters as the G and M blocks
    '2D': 'IM', '2J': 'JE', '2U': 'GG',

    // Liechtenstein also operates on HE0, next to HB0
    'HE0': 'LI',

    // Argentina also holds L1, which sits outside the ITU LO-LW series
    'L1': 'AR',

    // Prefixes of the former South African homelands, reabsorbed into South
    // Africa and never reallocated by the ITU
    'H5': 'ZA', 'S4': 'ZA', 'V9': 'ZA',
  };

  /// The ITU Table of International Call Sign Series (Appendix 42 to the RR),
  /// collapsed to the shortest prefix that still identifies a single country:
  /// one character where a whole letter block belongs to one administration
  /// (`I`, `F`, `G`, `K`, `R`, ...), two characters otherwise.
  ///
  /// Generated from the ITU table; do not hand-edit. Amateur radio specific
  /// corrections belong in [_dxccOverrides].
  ///
  /// An empty value marks an international organisation, which has no flag.
  static const _ituCallSignSeries = <String, String>{
    '2': 'GB',
    '3A': 'MC',
    '3B': 'MU',
    '3C': 'GQ',
    '3D': 'FJ',
    '3E': 'PA',
    '3F': 'PA',
    '3G': 'CL',
    '3H': 'CN',
    '3I': 'CN',
    '3J': 'CN',
    '3K': 'CN',
    '3L': 'CN',
    '3M': 'CN',
    '3N': 'CN',
    '3O': 'CN',
    '3P': 'CN',
    '3Q': 'CN',
    '3R': 'CN',
    '3S': 'CN',
    '3T': 'CN',
    '3U': 'CN',
    '3V': 'TN',
    '3W': 'VN',
    '3X': 'GN',
    '3Y': 'NO',
    '3Z': 'PL',
    '4A': 'MX',
    '4B': 'MX',
    '4C': 'MX',
    '4D': 'PH',
    '4E': 'PH',
    '4F': 'PH',
    '4G': 'PH',
    '4H': 'PH',
    '4I': 'PH',
    '4J': 'AZ',
    '4K': 'AZ',
    '4L': 'GE',
    '4M': 'VE',
    '4O': 'ME',
    '4P': 'LK',
    '4Q': 'LK',
    '4R': 'LK',
    '4S': 'LK',
    '4T': 'PE',
    '4U': '',
    '4V': 'HT',
    '4W': 'TL',
    '4X': 'IL',
    '4Y': '',
    '4Z': 'IL',
    '5A': 'LY',
    '5B': 'CY',
    '5C': 'MA',
    '5D': 'MA',
    '5E': 'MA',
    '5F': 'MA',
    '5G': 'MA',
    '5H': 'TZ',
    '5I': 'TZ',
    '5J': 'CO',
    '5K': 'CO',
    '5L': 'LR',
    '5M': 'LR',
    '5N': 'NG',
    '5O': 'NG',
    '5P': 'DK',
    '5Q': 'DK',
    '5R': 'MG',
    '5S': 'MG',
    '5T': 'MR',
    '5U': 'NE',
    '5V': 'TG',
    '5W': 'WS',
    '5X': 'UG',
    '5Y': 'KE',
    '5Z': 'KE',
    '6A': 'EG',
    '6B': 'EG',
    '6C': 'SY',
    '6D': 'MX',
    '6E': 'MX',
    '6F': 'MX',
    '6G': 'MX',
    '6H': 'MX',
    '6I': 'MX',
    '6J': 'MX',
    '6K': 'KR',
    '6L': 'KR',
    '6M': 'KR',
    '6N': 'KR',
    '6O': 'SO',
    '6P': 'PK',
    '6Q': 'PK',
    '6R': 'PK',
    '6S': 'PK',
    '6T': 'SD',
    '6U': 'SD',
    '6V': 'SN',
    '6W': 'SN',
    '6X': 'MG',
    '6Y': 'JM',
    '6Z': 'LR',
    '7A': 'ID',
    '7B': 'ID',
    '7C': 'ID',
    '7D': 'ID',
    '7E': 'ID',
    '7F': 'ID',
    '7G': 'ID',
    '7H': 'ID',
    '7I': 'ID',
    '7J': 'JP',
    '7K': 'JP',
    '7L': 'JP',
    '7M': 'JP',
    '7N': 'JP',
    '7O': 'YE',
    '7P': 'LS',
    '7Q': 'MW',
    '7R': 'DZ',
    '7S': 'SE',
    '7T': 'DZ',
    '7U': 'DZ',
    '7V': 'DZ',
    '7W': 'DZ',
    '7X': 'DZ',
    '7Y': 'DZ',
    '7Z': 'SA',
    '8A': 'ID',
    '8B': 'ID',
    '8C': 'ID',
    '8D': 'ID',
    '8E': 'ID',
    '8F': 'ID',
    '8G': 'ID',
    '8H': 'ID',
    '8I': 'ID',
    '8J': 'JP',
    '8K': 'JP',
    '8L': 'JP',
    '8M': 'JP',
    '8N': 'JP',
    '8O': 'BW',
    '8P': 'BB',
    '8Q': 'MV',
    '8R': 'GY',
    '8S': 'SE',
    '8T': 'IN',
    '8U': 'IN',
    '8V': 'IN',
    '8W': 'IN',
    '8X': 'IN',
    '8Y': 'IN',
    '8Z': 'SA',
    '9A': 'HR',
    '9B': 'IR',
    '9C': 'IR',
    '9D': 'IR',
    '9E': 'ET',
    '9F': 'ET',
    '9G': 'GH',
    '9H': 'MT',
    '9I': 'ZM',
    '9J': 'ZM',
    '9K': 'KW',
    '9L': 'SL',
    '9M': 'MY',
    '9N': 'NP',
    '9O': 'CD',
    '9P': 'CD',
    '9Q': 'CD',
    '9R': 'CD',
    '9S': 'CD',
    '9T': 'CD',
    '9U': 'BI',
    '9V': 'SG',
    '9W': 'MY',
    '9X': 'RW',
    '9Y': 'TT',
    '9Z': 'TT',
    'A2': 'BW',
    'A3': 'TO',
    'A4': 'OM',
    'A5': 'BT',
    'A6': 'AE',
    'A7': 'QA',
    'A8': 'LR',
    'A9': 'BH',
    'AA': 'US',
    'AB': 'US',
    'AC': 'US',
    'AD': 'US',
    'AE': 'US',
    'AF': 'US',
    'AG': 'US',
    'AH': 'US',
    'AI': 'US',
    'AJ': 'US',
    'AK': 'US',
    'AL': 'US',
    'AM': 'ES',
    'AN': 'ES',
    'AO': 'ES',
    'AP': 'PK',
    'AQ': 'PK',
    'AR': 'PK',
    'AS': 'PK',
    'AT': 'IN',
    'AU': 'IN',
    'AV': 'IN',
    'AW': 'IN',
    'AX': 'AU',
    'AY': 'AR',
    'AZ': 'AR',
    'B': 'CN',
    'C2': 'NR',
    'C3': 'AD',
    'C4': 'CY',
    'C5': 'GM',
    'C6': 'BS',
    'C7': '',
    'C8': 'MZ',
    'C9': 'MZ',
    'CA': 'CL',
    'CB': 'CL',
    'CC': 'CL',
    'CD': 'CL',
    'CE': 'CL',
    'CF': 'CA',
    'CG': 'CA',
    'CH': 'CA',
    'CI': 'CA',
    'CJ': 'CA',
    'CK': 'CA',
    'CL': 'CU',
    'CM': 'CU',
    'CN': 'MA',
    'CO': 'CU',
    'CP': 'BO',
    'CQ': 'PT',
    'CR': 'PT',
    'CS': 'PT',
    'CT': 'PT',
    'CU': 'PT',
    'CV': 'UY',
    'CW': 'UY',
    'CX': 'UY',
    'CY': 'CA',
    'CZ': 'CA',
    'D2': 'AO',
    'D3': 'AO',
    'D4': 'CV',
    'D5': 'LR',
    'D6': 'KM',
    'D7': 'KR',
    'D8': 'KR',
    'D9': 'KR',
    'DA': 'DE',
    'DB': 'DE',
    'DC': 'DE',
    'DD': 'DE',
    'DE': 'DE',
    'DF': 'DE',
    'DG': 'DE',
    'DH': 'DE',
    'DI': 'DE',
    'DJ': 'DE',
    'DK': 'DE',
    'DL': 'DE',
    'DM': 'DE',
    'DN': 'DE',
    'DO': 'DE',
    'DP': 'DE',
    'DQ': 'DE',
    'DR': 'DE',
    'DS': 'KR',
    'DT': 'KR',
    'DU': 'PH',
    'DV': 'PH',
    'DW': 'PH',
    'DX': 'PH',
    'DY': 'PH',
    'DZ': 'PH',
    'E2': 'TH',
    'E3': 'ER',
    'E4': 'PS',
    'E5': 'CK',
    'E6': 'NU',
    'E7': 'BA',
    'EA': 'ES',
    'EB': 'ES',
    'EC': 'ES',
    'ED': 'ES',
    'EE': 'ES',
    'EF': 'ES',
    'EG': 'ES',
    'EH': 'ES',
    'EI': 'IE',
    'EJ': 'IE',
    'EK': 'AM',
    'EL': 'LR',
    'EM': 'UA',
    'EN': 'UA',
    'EO': 'UA',
    'EP': 'IR',
    'EQ': 'IR',
    'ER': 'MD',
    'ES': 'EE',
    'ET': 'ET',
    'EU': 'BY',
    'EV': 'BY',
    'EW': 'BY',
    'EX': 'KG',
    'EY': 'TJ',
    'EZ': 'TM',
    'F': 'FR',
    'G': 'GB',
    'H2': 'CY',
    'H3': 'PA',
    'H4': 'SB',
    'H6': 'NI',
    'H7': 'NI',
    'H8': 'PA',
    'H9': 'PA',
    'HA': 'HU',
    'HB': 'CH',
    'HC': 'EC',
    'HD': 'EC',
    'HE': 'CH',
    'HF': 'PL',
    'HG': 'HU',
    'HH': 'HT',
    'HI': 'DO',
    'HJ': 'CO',
    'HK': 'CO',
    'HL': 'KR',
    'HM': 'KP',
    'HN': 'IQ',
    'HO': 'PA',
    'HP': 'PA',
    'HQ': 'HN',
    'HR': 'HN',
    'HS': 'TH',
    'HT': 'NI',
    'HU': 'SV',
    'HV': 'VA',
    'HW': 'FR',
    'HX': 'FR',
    'HY': 'FR',
    'HZ': 'SA',
    'I': 'IT',
    'J2': 'DJ',
    'J3': 'GD',
    'J4': 'GR',
    'J5': 'GW',
    'J6': 'LC',
    'J7': 'DM',
    'J8': 'VC',
    'JA': 'JP',
    'JB': 'JP',
    'JC': 'JP',
    'JD': 'JP',
    'JE': 'JP',
    'JF': 'JP',
    'JG': 'JP',
    'JH': 'JP',
    'JI': 'JP',
    'JJ': 'JP',
    'JK': 'JP',
    'JL': 'JP',
    'JM': 'JP',
    'JN': 'JP',
    'JO': 'JP',
    'JP': 'JP',
    'JQ': 'JP',
    'JR': 'JP',
    'JS': 'JP',
    'JT': 'MN',
    'JU': 'MN',
    'JV': 'MN',
    'JW': 'NO',
    'JX': 'NO',
    'JY': 'JO',
    'JZ': 'ID',
    'K': 'US',
    'L2': 'AR',
    'L3': 'AR',
    'L4': 'AR',
    'L5': 'AR',
    'L6': 'AR',
    'L7': 'AR',
    'L8': 'AR',
    'L9': 'AR',
    'LA': 'NO',
    'LB': 'NO',
    'LC': 'NO',
    'LD': 'NO',
    'LE': 'NO',
    'LF': 'NO',
    'LG': 'NO',
    'LH': 'NO',
    'LI': 'NO',
    'LJ': 'NO',
    'LK': 'NO',
    'LL': 'NO',
    'LM': 'NO',
    'LN': 'NO',
    'LO': 'AR',
    'LP': 'AR',
    'LQ': 'AR',
    'LR': 'AR',
    'LS': 'AR',
    'LT': 'AR',
    'LU': 'AR',
    'LV': 'AR',
    'LW': 'AR',
    'LX': 'LU',
    'LY': 'LT',
    'LZ': 'BG',
    'M': 'GB',
    'N': 'US',
    'OA': 'PE',
    'OB': 'PE',
    'OC': 'PE',
    'OD': 'LB',
    'OE': 'AT',
    'OF': 'FI',
    'OG': 'FI',
    'OH': 'FI',
    'OI': 'FI',
    'OJ': 'FI',
    'OK': 'CZ',
    'OL': 'CZ',
    'OM': 'SK',
    'ON': 'BE',
    'OO': 'BE',
    'OP': 'BE',
    'OQ': 'BE',
    'OR': 'BE',
    'OS': 'BE',
    'OT': 'BE',
    'OU': 'DK',
    'OV': 'DK',
    'OW': 'DK',
    'OX': 'DK',
    'OY': 'DK',
    'OZ': 'DK',
    'P2': 'PG',
    'P3': 'CY',
    'P4': 'AW',
    'P5': 'KP',
    'P6': 'KP',
    'P7': 'KP',
    'P8': 'KP',
    'P9': 'KP',
    'PA': 'NL',
    'PB': 'NL',
    'PC': 'NL',
    'PD': 'NL',
    'PE': 'NL',
    'PF': 'NL',
    'PG': 'NL',
    'PH': 'NL',
    'PI': 'NL',
    'PJ': 'BQ',
    'PK': 'ID',
    'PL': 'ID',
    'PM': 'ID',
    'PN': 'ID',
    'PO': 'ID',
    'PP': 'BR',
    'PQ': 'BR',
    'PR': 'BR',
    'PS': 'BR',
    'PT': 'BR',
    'PU': 'BR',
    'PV': 'BR',
    'PW': 'BR',
    'PX': 'BR',
    'PY': 'BR',
    'PZ': 'SR',
    'R': 'RU',
    'S2': 'BD',
    'S3': 'BD',
    'S5': 'SI',
    'S6': 'SG',
    'S7': 'SC',
    'S8': 'ZA',
    'S9': 'ST',
    'SA': 'SE',
    'SB': 'SE',
    'SC': 'SE',
    'SD': 'SE',
    'SE': 'SE',
    'SF': 'SE',
    'SG': 'SE',
    'SH': 'SE',
    'SI': 'SE',
    'SJ': 'SE',
    'SK': 'SE',
    'SL': 'SE',
    'SM': 'SE',
    'SN': 'PL',
    'SO': 'PL',
    'SP': 'PL',
    'SQ': 'PL',
    'SR': 'PL',
    'SS': 'EG',
    'ST': 'SD',
    'SU': 'EG',
    'SV': 'GR',
    'SW': 'GR',
    'SX': 'GR',
    'SY': 'GR',
    'SZ': 'GR',
    'T2': 'TV',
    'T3': 'KI',
    'T4': 'CU',
    'T5': 'SO',
    'T6': 'AF',
    'T7': 'SM',
    'T8': 'PW',
    'TA': 'TR',
    'TB': 'TR',
    'TC': 'TR',
    'TD': 'GT',
    'TE': 'CR',
    'TF': 'IS',
    'TG': 'GT',
    'TH': 'FR',
    'TI': 'CR',
    'TJ': 'CM',
    'TK': 'FR',
    'TL': 'CF',
    'TM': 'FR',
    'TN': 'CG',
    'TO': 'FR',
    'TP': 'FR',
    'TQ': 'FR',
    'TR': 'GA',
    'TS': 'TN',
    'TT': 'TD',
    'TU': 'CI',
    'TV': 'FR',
    'TW': 'FR',
    'TX': 'FR',
    'TY': 'BJ',
    'TZ': 'ML',
    'UA': 'RU',
    'UB': 'RU',
    'UC': 'RU',
    'UD': 'RU',
    'UE': 'RU',
    'UF': 'RU',
    'UG': 'RU',
    'UH': 'RU',
    'UI': 'RU',
    'UJ': 'UZ',
    'UK': 'UZ',
    'UL': 'UZ',
    'UM': 'UZ',
    'UN': 'KZ',
    'UO': 'KZ',
    'UP': 'KZ',
    'UQ': 'KZ',
    'UR': 'UA',
    'US': 'UA',
    'UT': 'UA',
    'UU': 'UA',
    'UV': 'UA',
    'UW': 'UA',
    'UX': 'UA',
    'UY': 'UA',
    'UZ': 'UA',
    'V2': 'AG',
    'V3': 'BZ',
    'V4': 'KN',
    'V5': 'NA',
    'V6': 'FM',
    'V7': 'MH',
    'V8': 'BN',
    'VA': 'CA',
    'VB': 'CA',
    'VC': 'CA',
    'VD': 'CA',
    'VE': 'CA',
    'VF': 'CA',
    'VG': 'CA',
    'VH': 'AU',
    'VI': 'AU',
    'VJ': 'AU',
    'VK': 'AU',
    'VL': 'AU',
    'VM': 'AU',
    'VN': 'AU',
    'VO': 'CA',
    'VP': 'GB',
    'VQ': 'GB',
    'VR': 'HK',
    'VS': 'GB',
    'VT': 'IN',
    'VU': 'IN',
    'VV': 'IN',
    'VW': 'IN',
    'VX': 'CA',
    'VY': 'CA',
    'VZ': 'AU',
    'W': 'US',
    'XA': 'MX',
    'XB': 'MX',
    'XC': 'MX',
    'XD': 'MX',
    'XE': 'MX',
    'XF': 'MX',
    'XG': 'MX',
    'XH': 'MX',
    'XI': 'MX',
    'XJ': 'CA',
    'XK': 'CA',
    'XL': 'CA',
    'XM': 'CA',
    'XN': 'CA',
    'XO': 'CA',
    'XP': 'DK',
    'XQ': 'CL',
    'XR': 'CL',
    'XS': 'CN',
    'XT': 'BF',
    'XU': 'KH',
    'XV': 'VN',
    'XW': 'LA',
    'XX': 'MO',
    'XY': 'MM',
    'XZ': 'MM',
    'Y2': 'DE',
    'Y3': 'DE',
    'Y4': 'DE',
    'Y5': 'DE',
    'Y6': 'DE',
    'Y7': 'DE',
    'Y8': 'DE',
    'Y9': 'DE',
    'YA': 'AF',
    'YB': 'ID',
    'YC': 'ID',
    'YD': 'ID',
    'YE': 'ID',
    'YF': 'ID',
    'YG': 'ID',
    'YH': 'ID',
    'YI': 'IQ',
    'YJ': 'VU',
    'YK': 'SY',
    'YL': 'LV',
    'YM': 'TR',
    'YN': 'NI',
    'YO': 'RO',
    'YP': 'RO',
    'YQ': 'RO',
    'YR': 'RO',
    'YS': 'SV',
    'YT': 'RS',
    'YU': 'RS',
    'YV': 'VE',
    'YW': 'VE',
    'YX': 'VE',
    'YY': 'VE',
    'Z2': 'ZW',
    'Z3': 'MK',
    'Z8': 'SS',
    'ZA': 'AL',
    'ZB': 'GB',
    'ZC': 'GB',
    'ZD': 'GB',
    'ZE': 'GB',
    'ZF': 'GB',
    'ZG': 'GB',
    'ZH': 'GB',
    'ZI': 'GB',
    'ZJ': 'GB',
    'ZK': 'NZ',
    'ZL': 'NZ',
    'ZM': 'NZ',
    'ZN': 'GB',
    'ZO': 'GB',
    'ZP': 'PY',
    'ZQ': 'GB',
    'ZR': 'ZA',
    'ZS': 'ZA',
    'ZT': 'ZA',
    'ZU': 'ZA',
    'ZV': 'BR',
    'ZW': 'BR',
    'ZX': 'BR',
    'ZY': 'BR',
    'ZZ': 'BR',
  };
}
