import 'package:flutter/material.dart';
import 'package:hamqrg/common/utils/callsign_country_helper.dart';

/// Renders a callsign preceded by the flag of the country that issued it.
///
/// Falls back to the bare callsign whenever the country cannot be resolved, so
/// the layout never shows a placeholder where a flag would be.
///
/// The flag is drawn with its own [TextStyle] rather than inheriting [style]:
/// emoji come from the platform font, and letting a custom family (the app
/// uses Inter) reach them only makes the fallback harder than it needs to be.
/// It is also hidden from screen readers, which would otherwise announce a
/// country before every callsign.
class CallsignText extends StatelessWidget {
  const CallsignText({
    required this.callsign,
    this.style,
    this.flagSize,
    this.gap = 4,
    this.maxLines,
    this.overflow,
    super.key,
  });

  /// The callsign to render, and the source of the flag.
  ///
  /// Only pass a value that really is a callsign: an empty string renders no
  /// flag, which is what fallbacks such as a repeater locality want. A place
  /// name would otherwise be resolved as a prefix — `Bologna` reads as `BO`.
  final String callsign;

  /// Style of the callsign itself. The flag only borrows its size.
  final TextStyle? style;

  /// Size of the flag. Defaults to the font size of [style].
  final double? flagSize;

  /// Horizontal space between the flag and the callsign.
  final double gap;

  /// Forwarded to the callsign [Text].
  final int? maxLines;

  /// Forwarded to the callsign [Text].
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    final label = Text(
      callsign,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
    );

    final flag = CallsignCountryHelper.flagOf(callsign);
    if (flag == null) return label;

    final resolvedFlagSize = flagSize ??
        style?.fontSize ??
        DefaultTextStyle.of(context).style.fontSize;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ExcludeSemantics(
          child: Text(
            flag,
            style: TextStyle(fontSize: resolvedFlagSize, height: 1),
          ),
        ),
        SizedBox(width: gap),
        Flexible(child: label),
      ],
    );
  }
}
