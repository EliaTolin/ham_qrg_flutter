import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/src/features/profile/provider/get_image_profile/get_image_profile_provider.dart';
import 'package:hamqrg/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileAvatar extends ConsumerWidget {
  const ProfileAvatar({
    this.imageProfileUrl,
    this.imageProfilePath,
    this.size = 100,
    this.isPro = false,
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

  /// When true, the avatar is wrapped in a gold ring marking a HamQRG Pro user.
  final bool isPro;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget avatar;

    if (imageProfileUrl == null && imageProfilePath == null) {
      // No image provided: default icon.
      avatar = CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: size * 0.5),
      );
    } else if (imageProfileUrl != null) {
      // Direct URL.
      avatar = CircleAvatar(
        backgroundColor: Colors.grey[300],
        backgroundImage: CachedNetworkImageProvider(imageProfileUrl!),
      );
    } else {
      // Resolve the path via the provider.
      final imageUrlAsync =
          ref.watch(getImageProfileProvider(imageProfilePath!));
      avatar = imageUrlAsync.when(
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
      );
    }

    final sizedAvatar = SizedBox(width: size, height: size, child: avatar);

    if (!isPro) return sizedAvatar;

    // Gold ring for Pro users.
    final ringWidth = (size * 0.04).clamp(2.0, 5.0);
    return Container(
      padding: EdgeInsets.all(ringWidth),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.proGoldLight, AppColors.proGold],
        ),
      ),
      child: sizedAvatar,
    );
  }
}
