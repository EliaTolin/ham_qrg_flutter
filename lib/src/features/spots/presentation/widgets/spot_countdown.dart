import 'dart:async';

import 'package:flutter/material.dart';

class SpotCountdown extends StatefulWidget {
  const SpotCountdown({
    required this.expiresAt,
    this.onExpired,
    this.style,
    super.key,
  });

  final DateTime expiresAt;
  final VoidCallback? onExpired;
  final TextStyle? style;

  @override
  State<SpotCountdown> createState() => _SpotCountdownState();
}

class _SpotCountdownState extends State<SpotCountdown> {
  late Timer _timer;
  Duration _remaining = Duration.zero;
  bool _hasExpired = false;

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  @override
  void didUpdateWidget(SpotCountdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expiresAt != widget.expiresAt) {
      _hasExpired = false;
      _updateRemaining();
    }
  }

  void _updateRemaining() {
    final remaining = widget.expiresAt.difference(DateTime.now());
    if (remaining.isNegative && !_hasExpired) {
      _hasExpired = true;
      widget.onExpired?.call();
    }
    if (mounted) {
      setState(() {
        _remaining = remaining.isNegative ? Duration.zero : remaining;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUrgent = _remaining.inSeconds < 60 && _remaining.inSeconds > 0;
    final totalSeconds = _remaining.inSeconds;

    String formatted;
    if (totalSeconds >= 3600) {
      final h = totalSeconds ~/ 3600;
      final m = (totalSeconds % 3600) ~/ 60;
      final s = totalSeconds % 60;
      formatted = '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    } else {
      final m = totalSeconds ~/ 60;
      final s = totalSeconds % 60;
      formatted = '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }

    final defaultStyle = theme.textTheme.bodyMedium?.copyWith(
      fontFeatures: const [FontFeature.tabularFigures()],
      color: isUrgent ? const Color(0xFFEF4444) : null,
      fontWeight: isUrgent ? FontWeight.bold : null,
    );

    return Text(
      formatted,
      style: widget.style ?? defaultStyle,
    );
  }
}
