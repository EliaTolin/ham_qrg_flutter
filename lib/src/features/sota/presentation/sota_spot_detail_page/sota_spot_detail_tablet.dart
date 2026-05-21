import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/controller/state/sota_spot_detail_state.dart';
import 'package:hamqrg/src/features/sota/presentation/sota_spot_detail_page/sota_spot_detail_page.dart';

/// Tablet detail layout for SOTA spots. Constrains content to a readable
/// width on wide screens and reuses the mobile body without duplicating
/// business logic.
class SotaSpotDetailTablet extends StatelessWidget {
  const SotaSpotDetailTablet({
    required this.state,
    required this.onRetrySummit,
    super.key,
  });

  final SotaSpotDetailState state;
  final VoidCallback onRetrySummit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: SotaSpotDetailMobile(
          state: state,
          onRetrySummit: onRetrySummit,
        ),
      ),
    );
  }
}
