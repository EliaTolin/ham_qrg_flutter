import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hamqrg/common/extension/l10n_extension.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/src/features/authentication/presentation/auth/widgets/sign_in_buttons.dart';
import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/is_anonymous/is_anonymous_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_apple/sign_in_apple_provider.dart';
import 'package:hamqrg/src/features/authentication/provider/sign_in_google/sign_in_google_provider.dart';
import 'package:hamqrg/src/features/post_login_onboarding/provider/check_needs_onboarding/check_needs_onboarding_provider.dart';
import 'package:hamqrg/src/features/profile/provider/get_profile/get_profile_provider.dart';
import 'package:hamqrg/themes/app_colors.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// Propone a chi ha appena comprato Pro da anonimo di collegare un account.
///
/// Chiude e basta: **non naviga**. È la differenza con
/// `showRegistrationPrompt`, che al termine fa `pushAndPopUntil` e quindi
/// distruggerebbe la pagina chiamante — inaccettabile qui, visto che uno dei
/// due percorsi d'acquisto esiste apposta per riportare l'utente al punto che
/// aveva scelto sulla mappa (FR-031).
Future<void> showProLinkAccountPrompt(
  BuildContext context,
  WidgetRef ref,
) {
  return showDialog<void>(
    context: context,
    builder: (_) => const _ProLinkAccountDialog(),
  );
}

class _ProLinkAccountDialog extends ConsumerStatefulWidget {
  const _ProLinkAccountDialog();

  @override
  ConsumerState<_ProLinkAccountDialog> createState() =>
      _ProLinkAccountDialogState();
}

class _ProLinkAccountDialogState extends ConsumerState<_ProLinkAccountDialog> {
  bool _isLoading = false;

  Future<void> _link(Future<void> Function() signIn) async {
    if (_isLoading) return;
    setState(() => _isLoading = true);

    try {
      await signIn();

      // Tutti i provider legati all'identità, non solo il profilo: mancarne
      // uno lascia in cache un userId che non corrisponde più al JWT, e la
      // prima query protetta fallisce per RLS (vedi CLAUDE.md).
      ref
        ..invalidate(getProfileProvider)
        ..invalidate(checkNeedsPostLoginOnboardingProvider)
        ..invalidate(getUserIdProvider)
        ..invalidate(isAnonymousProvider);

      final userId = await ref.refresh(getUserIdProvider.future);
      if (userId != null) await OneSignal.login(userId);

      // Il collegamento dell'acquisto al nuovo utente lo fa da sé il listener
      // di `onAuthStateChange` in main.dart, che chiama `RevenueCat.login`.
      if (mounted) Navigator.of(context).pop();
    } on Exception catch (error) {
      log('Pro link account error: $error');
      if (mounted) {
        showErrorSnackbar(context, context.localization.authUnexpectedError);
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.localization;

    return AlertDialog(
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.proGold.withValues(alpha: 0.18),
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.proGold.withValues(alpha: 0.6)),
        ),
        child: const Icon(Icons.link_rounded, color: AppColors.proGold),
      ),
      title: Text(l10n.proLinkAccountTitle, textAlign: TextAlign.center),
      // I bottoni stanno nel contenuto e non in `actions`: quelli di accesso
      // sono a larghezza piena, e l'OverflowBar delle azioni li dispone in
      // riga — sfondando il dialog.
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.proLinkAccountBody,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.75),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          if (Platform.isIOS) ...[
            AppleSignInButton(
              onPressed: () => _link(
                () => ref.read(signInWithAppleProvider.future),
              ),
              isLoading: _isLoading,
            ),
            const SizedBox(height: 12),
          ],
          GoogleSignInButton(
            onPressed: () => _link(
              () => ref.read(signInWithGoogleProvider.future),
            ),
            isLoading: _isLoading,
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
          child: Text(
            l10n.reachUpsellLater,
            style: TextStyle(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
