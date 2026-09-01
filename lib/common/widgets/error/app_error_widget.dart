import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hamqrg/common/widgets/error/debug_error_widget.dart';
import 'package:hamqrg/common/widgets/error/error_with_retry_widget.dart';

/// Schermata di errore unificata per i rami `error:` delle pagine.
///
/// - **Debug**: dettaglio completo dell'errore, selezionabile e copiabile,
///   con accesso ai log Talker ([DebugErrorWidget]) — serve a diagnosticare
///   quale chiamata è fallita senza ricostruire nulla.
/// - **Release**: messaggio localizzato pulito con bottone Riprova
///   ([ErrorWidgetWithRetry]).
///
/// Da usare in ogni pagina al posto di rami di errore ad hoc, così il
/// comportamento è identico ovunque.
class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    required this.label,
    required this.onRetry,
    this.error,
    this.stackTrace,
    super.key,
  });

  /// Nome breve della pagina/area, mostrato solo in debug (es. 'Dashboard').
  final String label;
  final VoidCallback onRetry;
  final Object? error;
  final StackTrace? stackTrace;

  @override
  Widget build(BuildContext context) {
    final error = this.error;
    if (kDebugMode && error != null) {
      return DebugErrorWidget(
        label: label,
        error: error,
        stackTrace: stackTrace,
        onRetry: onRetry,
      );
    }
    return ErrorWidgetWithRetry(onRetry: onRetry);
  }
}
