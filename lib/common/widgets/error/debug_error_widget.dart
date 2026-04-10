import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:talker_flutter/talker_flutter.dart';

// TEMP: debug widget to display raw error + stack trace on TestFlight builds
// with a button to open TalkerScreen.
// TO-DO(elia): remove once the root cause is found.
class DebugErrorWidget extends ConsumerWidget {
  const DebugErrorWidget({
    required this.label,
    required this.error,
    required this.stackTrace,
    required this.onRetry,
    super.key,
  });

  final String label;
  final Object error;
  final StackTrace? stackTrace;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final text = '$error\n\n${stackTrace ?? 'no stack trace'}';
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '$label error (debug)',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.error,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: theme.colorScheme.outline),
                ),
                child: SingleChildScrollView(
                  child: SelectableText(
                    text,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Error copied to clipboard'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy),
                    label: const Text('Copy'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: onRetry,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Retry'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () {
                final talker = ref.read(talkerServiceProvider);
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => TalkerScreen(talker: talker),
                  ),
                );
              },
              icon: const Icon(Icons.article_outlined),
              label: const Text('View logs (Talker)'),
            ),
          ],
        ),
      ),
    );
  }
}
