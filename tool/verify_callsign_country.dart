// Temporary verification harness: reads callsigns from stdin, one per line,
// and prints `callsign<TAB>isoCode` using the real production helper.
import 'dart:io';

import 'package:hamqrg/common/utils/callsign_country_helper.dart';

void main() {
  String? line;
  while ((line = stdin.readLineSync()) != null) {
    final callsign = line!.trim();
    if (callsign.isEmpty) continue;
    final iso = CallsignCountryHelper.isoCodeOf(callsign);
    stdout.writeln('$callsign\t${iso ?? ''}');
  }
}
