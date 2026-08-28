import 'dart:async';

import 'package:hamqrg/clients/analytics/analytics_client.dart';
import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'supabase_analytics_client.g.dart';

/// Nome della tabella degli eventi.
const String kAnalyticsEventsTable = 'analytics_events';

/// Scrive gli eventi nel backend già in uso, senza SDK di terze parti: nessun
/// nuovo trasferimento di dati verso terzi e nessuna nuova dichiarazione di
/// privacy sugli store.
class SupabaseAnalyticsClient implements AnalyticsClient {
  SupabaseAnalyticsClient(this._client, this._talker);

  final SupabaseClient _client;
  final Talker _talker;

  @override
  void track(
    AnalyticsEvent event, {
    required AnalyticsSurface surface,
    int? count,
  }) {
    // Fire-and-forget: l'invio non viene atteso, così nessun tocco resta in
    // attesa della rete (FR-068).
    unawaited(_send(event, surface, count));
  }

  Future<void> _send(
    AnalyticsEvent event,
    AnalyticsSurface surface,
    int? count,
  ) async {
    try {
      await _client.from(kAnalyticsEventsTable).insert({
        'user_id': _client.auth.currentUser?.id,
        'event': event.id,
        'surface': surface.id,
        if (count != null) 'props': {'count': count},
      });
    } catch (error, stackTrace) {
      // Un evento perso è un buco nelle statistiche, non un guasto per
      // l'utente: si registra e si tira dritto.
      _talker.handle(error, stackTrace, 'analytics: ${event.id} non inviato');
    }
  }
}

@Riverpod(keepAlive: true)
AnalyticsClient analyticsClient(Ref ref) {
  return SupabaseAnalyticsClient(
    ref.watch(supabaseClientProvider),
    ref.watch(talkerServiceProvider),
  );
}
