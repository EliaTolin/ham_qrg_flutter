import 'package:flutter/material.dart';

class PotaSpotFreshnessIndicator extends StatelessWidget {
  const PotaSpotFreshnessIndicator({
    required this.spotTime,
    super.key,
  });

  final DateTime spotTime;

  @override
  Widget build(BuildContext context) {
    final age = DateTime.now().difference(spotTime);
    final color = _colorForAge(age);

    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Color _colorForAge(Duration age) {
    if (age.inMinutes < 5) return Colors.green;
    if (age.inMinutes < 15) return Colors.amber;
    return Colors.grey;
  }
}

/// Returns a human-readable time-ago string for a spot time.
String spotTimeAgo(DateTime spotTime) {
  final age = DateTime.now().difference(spotTime);
  if (age.inSeconds < 60) return '${age.inSeconds}s fa';
  if (age.inMinutes < 60) return '${age.inMinutes}m fa';
  if (age.inHours < 24) return '${age.inHours}h fa';
  return '${age.inDays}d fa';
}
