import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hamqrg/common/extension/hard_coded_string.dart';
import 'package:hamqrg/common/widgets/snackbars/show_error_snackbar.dart';
import 'package:hamqrg/config/app_configs.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> showTelegramInviteDialog(
  BuildContext context, {
  VoidCallback? onAlreadyTelegramMember,
}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon with rounded background
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.telegram,
                    size: 50,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 20),
                // Title
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Unisciti alla nostra ',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Community!',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Description
                Text(
                  'Scopri i vantaggi di entrare nella community Telegram:',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Benefits List
                Column(
                  children: [
                    _buildBenefitItem(
                      context,
                      Icons.group,
                      'Supporto dai membri',
                    ),
                    _buildBenefitItem(
                      context,
                      Icons.lightbulb_outline,
                      'Proponi nuove funzionalità',
                    ),
                    _buildBenefitItem(
                      context,
                      Icons.developer_mode,
                      'Contatto con gli sviluppatori',
                    ),
                    _buildBenefitItem(
                      context,
                      Icons.star,
                      'Anteprime e beta esclusive',
                    ),
                    _buildBenefitItem(
                      context,
                      Icons.chat_bubble,
                      'Community attiva',
                    ),
                    const Gap(8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        try {
                          final telegramUrl = AppConfigs.getTelegramLink();
                          final uri = Uri.parse(telegramUrl);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            if (context.mounted) {
                              showErrorSnackbar(
                                context,
                                "Errore durante l'apertura di Telegram".hardcoded,
                              );
                            }
                          }
                        } catch (e) {
                          if (context.mounted) {
                            showErrorSnackbar(
                              context,
                              "Errore durante l'apertura di Telegram".hardcoded,
                            );
                          }
                        }
                      },
                      child: const Text('Unisciti ora!'),
                    ),
                  ],
                ),
                const Gap(20),
                // Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (onAlreadyTelegramMember != null)
                      TextButton(
                        onPressed: () {
                          onAlreadyTelegramMember.call();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Sono già membro'),
                      ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Più tardi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Widget _buildBenefitItem(BuildContext context, IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.blue,
        ),
        const Gap(
          12,
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
          ),
        ),
      ],
    ),
  );
}
