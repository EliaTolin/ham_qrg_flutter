import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/profile/provider/get_image_profile/get_image_profile_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({
    this.imageProfileUrl,
    this.imageProfilePath,
    this.size = 100,
    super.key,
  }) : assert(
          imageProfileUrl == null || imageProfilePath == null,
          'Cannot provide both imageProfileUrl and imageProfilePath',
        );

  /// Direct URL to the image. If provided, will be used directly without calling the provider.
  final String? imageProfileUrl;

  /// Path to the image. If provided, will use getImageProfileProvider to get the full URL.
  final String? imageProfilePath;

  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // If no image is provided, show default icon
    if (imageProfileUrl == null && imageProfilePath == null) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: size * 0.5),
        ),
      );
    }

    // If imageProfileUrl is provided, use it directly
    if (imageProfileUrl != null) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          backgroundImage: CachedNetworkImageProvider(imageProfileUrl!),
        ),
      );
    }

    // If imageProfilePath is provided, use the provider
    final imageUrlAsync = ref.watch(getImageProfileProvider(imageProfilePath!));

    return SizedBox(
      width: size,
      height: size,
      child: imageUrlAsync.when(
        data: (url) => CircleAvatar(
          backgroundColor: Colors.grey[300],
          backgroundImage: CachedNetworkImageProvider(url),
        ),
        loading: () => CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: SizedBox(
            width: size * 0.3,
            height: size * 0.3,
            child: const CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
        error: (_, __) => CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, size: size * 0.5),
        ),
      ),
    );
  }
}
