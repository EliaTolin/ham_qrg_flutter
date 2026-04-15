import 'package:flutter/material.dart';

/// Width threshold (in logical pixels) above which the tablet builder is
/// used. Defaults to 840 — landscape tablet / large foldable.
const double kTabletBreakpoint = 840;

/// Wrapper that picks between a [mobile] and an optional [tablet] layout
/// based on the available width.
///
/// Usage:
/// ```dart
/// return ResponsiveLayout(
///   mobile: (context) => MobileBody(),
///   tablet: (context) => TabletBody(),
/// );
/// ```
///
/// If [tablet] is omitted the [mobile] layout is used at every width.
/// The breakpoint can be overridden via [breakpoint].
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobile,
    this.tablet,
    this.breakpoint = kTabletBreakpoint,
    super.key,
  });

  final WidgetBuilder mobile;
  final WidgetBuilder? tablet;
  final double breakpoint;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (tablet != null && constraints.maxWidth >= breakpoint) {
          return tablet!(context);
        }
        return mobile(context);
      },
    );
  }
}
