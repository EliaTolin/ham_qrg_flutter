import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamqrg/clients/image_picker/image_picker.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class UploadImageButton extends ConsumerWidget {
  const UploadImageButton({required this.uploadImage, super.key});
  final Future Function(File) uploadImage;

  Future<bool> _requestPermission(
    BuildContext context,
    Permission permission,
    String rationale,
  ) async {
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isLimited) {
      final newStatus = await permission.request();
      if (newStatus.isGranted) {
        return true;
      } else if (newStatus.isPermanentlyDenied && context.mounted) {
        await _showPermissionDeniedDialog(context, rationale);
      }
    } else if (status.isPermanentlyDenied && context.mounted) {
      await _showPermissionDeniedDialog(context, rationale);
    }
    return false; // Permesso negato
  }

  Future<void> _showPermissionDeniedDialog(
    BuildContext context,
    String rationale,
  ) async {
    final l10n = context.localization;
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(l10n.permissionsMissingTitle),
        content: Text(rationale),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(l10n.commonCancel),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: Text(l10n.commonOpenSettings),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage(
    BuildContext context,
    WidgetRef ref,
    ImageSource source,
  ) async {
    final l10n = context.localization;
    try {
      final imagePicker = ref.read(imagePickerProvider);

      // Gallery uses the system photo picker (Android Photo Picker / iOS
      // PHPicker), which grants one-time access without any media permission.
      // Requesting Permission.photos here would reintroduce READ_MEDIA_IMAGES,
      // which violates Google Play's Photo and Video Permissions policy.
      // Only the camera flow needs a runtime permission.
      if (source == ImageSource.camera) {
        final hasPermission = await _requestPermission(
          context,
          Permission.camera,
          l10n.cameraPermissionRationale,
        );

        if (!hasPermission) return;
      }

      final image = await imagePicker.pickImage(source: source);

      if (image != null) {
        await uploadImage(File(image.path));
      }
    } catch (e) {
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(l10n.error),
              content: Text(l10n.imageUploadError),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(l10n.commonClose),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.localization;
    return ElevatedButton.icon(
      icon: const Icon(Icons.upload),
      label: Text(l10n.uploadImageLabel),
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text(l10n.sourceGallery),
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickImage(context, ref, ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: Text(l10n.sourceCamera),
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickImage(context, ref, ImageSource.camera);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
