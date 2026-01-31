import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/src/features/repeaters/presentation/widgets/info_banner.dart';
import 'package:hamqrg/src/features/repeaters/service/location_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionBanner extends ConsumerWidget {
  const PermissionBanner({
    required this.errorType,
    required this.onRetry,
    super.key,
  });

  final LocationErrorType errorType;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    final description = switch (errorType) {
      LocationErrorType.servicesDisabled => l10n.repeatersMapLocationServicesDisabled,
      LocationErrorType.permissionDenied => l10n.repeatersMapPermissionMessage,
      LocationErrorType.permissionPermanentlyDenied => l10n.repeatersMapPermissionPermanentlyDenied,
    };

    return InfoBanner(
      icon: const Icon(Icons.my_location_outlined),
      label: description,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () async {
              await openAppSettings();
            },
            child: Text(l10n.repeatersMapOpenSettings),
          ),
          TextButton(
            onPressed: onRetry,
            child: Text(l10n.repeatersMapRetry),
          ),
        ],
      ),
    );
  }
}
