import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_apple/sign_in_apple_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_google/sign_in_google_provider.dart';

class SignInButtons extends ConsumerStatefulWidget {
  const SignInButtons({
    required this.onSignInComplete,
    super.key,
  });
  final Future<void> Function() onSignInComplete;

  @override
  ConsumerState<SignInButtons> createState() => _SignInButtonsState();
}

class _SignInButtonsState extends ConsumerState<SignInButtons> {
  bool _isLoading = false;

  Future<void> _handleAppleSignIn() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await ref.read(signInWithAppleProvider.future);
      await widget.onSignInComplete();
    } on Exception catch (e) {
      if (mounted) {
        showErrorSnackbar(context, 'Errore durante il login');
      }
      log(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleGoogleSignIn() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    try {
      await ref.read(signInWithGoogleProvider.future);
      await widget.onSignInComplete();
    } on Exception catch (e) {
      if (mounted) {
        showErrorSnackbar(context, 'Errore durante il login');
      }
      log(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (Platform.isIOS) ...[
            AppleSignInButton(
              onPressed: _handleAppleSignIn,
              isLoading: _isLoading,
            ),
            const Gap(10),
          ],
          GoogleSignInButton(
            onPressed: _handleGoogleSignIn,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}

/// Reusable Apple Sign In button widget
class AppleSignInButton extends StatelessWidget {
  const AppleSignInButton({
    required this.onPressed,
    this.isLoading = false,
    this.label,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final buttonLabel = label ?? l10n.registrationSignInApple;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          // Apple brand colors
          backgroundColor: isDark ? Colors.white : Colors.black,
          foregroundColor: isDark ? Colors.black : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.apple,
              size: 24,
              color: isDark ? Colors.black : Colors.white, // Apple brand color
            ),
            const Gap(12),
            Text(
              buttonLabel,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.black : Colors.white, // Apple brand color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable Google Sign In button widget
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    required this.onPressed,
    this.isLoading = false,
    this.label,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final l10n = context.localization;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final buttonLabel = label ?? l10n.registrationSignInGoogle;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.surface,
          foregroundColor: colorScheme.onSurface,
          side: BorderSide(color: colorScheme.outline),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google logo
            Image.network(
              'https://www.google.com/favicon.ico',
              width: 20,
              height: 20,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.g_mobiledata,
                size: 24,
                color: colorScheme.onSurface,
              ),
            ),
            const Gap(12),
            Text(
              buttonLabel,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
