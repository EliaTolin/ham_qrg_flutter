import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamqrg/clients/image_picker/image_picker.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
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
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Mancano i permessi!'.hardcoded),
        content: Text(rationale.hardcoded),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Annulla'.hardcoded),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
            child: Text('Apri impostazioni'.hardcoded),
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
    try {
      final imagePicker = ref.read(imagePickerProvider);

      final hasPermission = await _requestPermission(
        context,
        source == ImageSource.gallery ? Permission.photos : Permission.camera,
        source == ImageSource.gallery
            ? "Per caricare un'immagine, consenti l'accesso alla galleria dalle impostazioni."
            : "Per scattare una foto, consenti l'accesso alla fotocamera dalle impostazioni.",
      );

      if (!hasPermission) return;

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
              title: Text('Errore'.hardcoded),
              content: Text("Errore durante il caricamento dell'immagine".hardcoded),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Chiudi'.hardcoded),
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
    return ElevatedButton.icon(
      icon: const Icon(Icons.upload),
      label: Text('Carica immagine'.hardcoded),
      onPressed: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context) {
            return SafeArea(
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: Text('Galleria'.hardcoded),
                    onTap: () {
                      Navigator.of(context).pop();
                      _pickImage(context, ref, ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: Text('Fotocamera'.hardcoded),
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
