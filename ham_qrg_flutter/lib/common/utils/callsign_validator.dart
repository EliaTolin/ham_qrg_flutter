/// Utility class for validating callsigns.
class CallsignValidator {
  const CallsignValidator._();

  /// Standard amateur radio callsign patterns.
  ///
  /// Format: prefix + digit + suffix (1-4 letters)
  /// - Standard: 1-3 chars starting with letter + digit + letters (I0ABC, IK4XYZ, W1AW)
  /// - Digit prefix: digit + letter + digit + letters (2E0ABC, 7J1ABC)
  static final _licensedCallsignPatterns = [
    // Standard format: letter + 0-2 alphanumeric + digit + 1-4 letters
    RegExp(r'^[A-Za-z][A-Za-z0-9]{0,2}[0-9][A-Za-z]{1,4}$'),
    // Digit-prefix format: digit + letter(s) + digit + 1-4 letters (2E0ABC, 7J1ABC)
    RegExp(r'^[0-9][A-Za-z]{1,2}[0-9][A-Za-z]{1,4}$'),
  ];

  /// Pattern for valid modifiers (prefix before callsign or suffix after).
  /// Examples: /P, /M, /MM, /AM, /QRP, /4, IK4/, F/, EA6/
  static final _modifierPattern = RegExp(r'^[A-Za-z0-9]{1,4}$');

  /// List of invalid/reserved strings that should not be accepted as callsigns.
  static const _invalidStrings = {
    'UNKNOWN',
    'N/A',
    'NA',
    'TEST',
    'HELLO',
    'NONE',
    'NULL',
  };

  /// SWL callsign patterns.
  ///
  /// Supports multiple formats from around the world:
  /// - Italian: I1-12345-SWL, I112345SWL, IT2001SWL, IS0001SWL, I5-1990
  /// - German: DE1ABC
  /// - UK: RS12345, G-14167, GW4002SWL
  /// - USA: WA7009SWL, KC7001SWL, AB1001SWL, KG4001XXX
  /// - Belgian: ONL9357
  /// - Canadian: VE5001SWL
  /// - Greek: SVL1AA
  /// - Generic: XX-12345-SWL
  static final _swlPatterns = [
    // Format with SWL suffix: XX####SWL (most common international format)
    // Examples: WA7009SWL, IT2001SWL, VE5001SWL, GW4002SWL
    RegExp(r'^[A-Za-z]{2}\d{4}[Ss][Ww][Ll]$'),

    // Format with XXX suffix: XX####XXX (e.g., KG4001XXX)
    RegExp(r'^[A-Za-z]{2}\d{4}[A-Za-z]{3}$'),

    // Italian format: I + digit + - + digits + - + SWL
    RegExp(r'^[Ii][0-9]-?\d+-?[Ss][Ww][Ll]$'),

    // Italian/Regional format with dash: XX-#### or X#-#### (e.g., I5-1990, IS-12345)
    RegExp(r'^[A-Za-z][A-Za-z0-9]?-\d{4,5}$'),

    // UK format with dash: X-##### (e.g., G-14167)
    RegExp(r'^[A-Za-z]-\d{4,6}$'),

    // Belgian ONL format: ONL + digits
    RegExp(r'^[Oo][Nn][Ll]\d{3,5}$'),

    // Greek SVL format: SVL + digit + letters
    RegExp(r'^[Ss][Vv][Ll]\d[A-Za-z]{1,3}$'),

    // German SWL format: DE + digit + letters
    RegExp(r'^[Dd][Ee][0-9][A-Za-z]{1,3}$'),

    // UK RS format: RS + digits
    RegExp(r'^[Rr][Ss]\d{3,6}$'),

    // Generic SWL with country prefix and dashes: XX-12345-SWL
    RegExp(r'^[A-Za-z]{1,2}-?\d+-?[Ss][Ww][Ll]$'),

    // Japanese format: JA1-12345
    RegExp(r'^[Jj][A-Za-z][0-9]-?\d+$'),

    // Generic alphanumeric SWL (fallback for other countries)
    RegExp(r'^[A-Za-z]{1,2}[0-9][A-Za-z0-9]{2,6}$'),
  ];

  /// Validates a licensed amateur radio callsign.
  ///
  /// Returns `true` if the callsign matches the standard amateur radio
  /// callsign format: prefix (1-3 chars starting with letter) + digit + suffix (1-4 letters).
  ///
  /// Supports callsigns with modifiers:
  /// - Prefix: IK4/IU4VRB, F/W1AW (operating from different location)
  /// - Suffix: IU4VRB/P (portable), /M (mobile), /MM (maritime mobile)
  /// - Numeric suffix: W1AW/4 (operating from call area 4)
  /// - Multiple: IK4/IU4VRB/P, IU4VRB/P/QRP
  ///
  /// Examples of valid callsigns:
  /// - Italian: I0ABC, IK4XYZ, IU4VRB, IS0ABC, IT9ABC, IN3ABC
  /// - USA: W1AW, K1ABC, AA1A, KA1XYZ
  /// - German: DL1ABC, DK2XYZ
  /// - UK: G0ABC, M0ABC, 2E0ABC
  /// - Japanese: JA1ABC, 7J1ABC
  /// - With modifiers: IU4VRB/P, IK4/IU4VRB, W1AW/4/QRP
  static bool isValidLicensedCallsign(String callsign) {
    final trimmed = callsign.trim().toUpperCase();

    if (trimmed.isEmpty) return false;
    if (trimmed.length < 3) return false;

    // Reject known invalid strings
    if (_invalidStrings.contains(trimmed)) return false;

    // Handle callsigns with modifiers (prefix/suffix separated by /)
    if (trimmed.contains('/')) {
      return _isValidCallsignWithModifiers(trimmed);
    }

    return _isValidBaseCallsign(trimmed);
  }

  /// Validates a callsign with prefix/suffix modifiers.
  ///
  /// Format: [prefix/]callsign[/suffix][/suffix]
  static bool _isValidCallsignWithModifiers(String callsign) {
    final parts = callsign.split('/');

    // Must have at least 2 parts and no empty parts
    if (parts.length < 2) return false;
    if (parts.any((p) => p.isEmpty)) return false;

    // Find the base callsign (the part that matches callsign pattern)
    String? baseCallsign;
    var baseIndex = -1;

    for (var i = 0; i < parts.length; i++) {
      if (_isValidBaseCallsign(parts[i])) {
        baseCallsign = parts[i];
        baseIndex = i;
        break;
      }
    }

    // Must have a valid base callsign
    if (baseCallsign == null) return false;

    // Validate all other parts as modifiers
    for (var i = 0; i < parts.length; i++) {
      if (i == baseIndex) continue;
      if (!_modifierPattern.hasMatch(parts[i])) return false;
    }

    return true;
  }

  /// Validates a base callsign without modifiers.
  static bool _isValidBaseCallsign(String callsign) {
    // Must contain at least one digit
    if (!callsign.contains(RegExp('[0-9]'))) return false;

    // Must not start with two digits (invalid format)
    if (callsign.startsWith(RegExp(r'^\d\d'))) return false;

    // Check against all licensed callsign patterns
    for (final pattern in _licensedCallsignPatterns) {
      if (pattern.hasMatch(callsign)) return true;
    }

    return false;
  }

  /// Validates a Short Wave Listener (SWL) callsign.
  ///
  /// Returns `true` if the callsign matches one of the recognized SWL formats.
  ///
  /// Examples of valid SWL callsigns:
  /// - Italian: I1-12345-SWL, I254321SWL
  /// - German: DE1ABC, DE2XYZ
  /// - UK: RS12345
  static bool isValidSwlCallsign(String callsign) {
    final trimmed = callsign.trim();

    if (trimmed.isEmpty) return false;
    if (trimmed.length < 3) return false;

    // Check for invalid characters (only alphanumeric and dash allowed)
    if (!RegExp(r'^[A-Za-z0-9-]+$').hasMatch(trimmed)) return false;

    // Check against all SWL patterns
    for (final pattern in _swlPatterns) {
      if (pattern.hasMatch(trimmed)) return true;
    }

    return false;
  }
}
