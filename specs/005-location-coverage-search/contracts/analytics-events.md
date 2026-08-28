# Contract — Eventi del funnel di conversione

Prima strumentazione dell'app: oggi non esiste alcun sistema di analytics (R8). Nessun SDK di terze parti — gli eventi vanno nel backend Supabase già in uso.

## Eventi

| Evento | Quando | Requisito |
|---|---|---|
| `coverage_point_selected` | l'utente fissa un punto (ricerca, coordinate, pressione lunga) | FR-064 |
| `coverage_teaser_shown` | il teaser viene mostrato a un non Pro | FR-064 |
| `coverage_cta_tapped` | tocco sulla call to action | FR-064 |
| `coverage_paywall_shown` | il paywall viene presentato | FR-064 |
| `coverage_purchase_completed` | acquisto riuscito | FR-064 |
| `coverage_paywall_dismissed` | paywall chiuso senza acquisto | FR-064 |

## Superfici (`surface`)

| Valore | Dove |
|---|---|
| `map_teaser` | teaser sulla mappa dopo la scelta del punto |
| `stations_list` | vetrina della lista postazioni |
| `reach_button` | pulsante "cosa raggiungo da qui" — **superficie esistente**, oggi non misurata (FR-066) |
| `reach_badge` | badge sfocato sul dettaglio ripetitore — idem |

Le ultime due sono la ragione per cui il confronto fra punti d'ingresso è possibile: senza strumentarle, il nuovo teaser non avrebbe termine di paragone.

## Tabella

```sql
create table public.analytics_events (
  id          bigint generated always as identity primary key,
  user_id     uuid references auth.users(id) on delete set null,
  event       text not null,
  surface     text not null,
  props       jsonb not null default '{}'::jsonb,
  created_at  timestamptz not null default now()
);

alter table public.analytics_events enable row level security;

-- Solo inserimento: nessun client legge gli eventi.
create policy "insert own events" on public.analytics_events
  for insert to authenticated, anon
  with check (user_id is null or user_id = auth.uid());

create index on public.analytics_events (event, surface, created_at desc);
```

Vive nel repo `ham_qrg_supabase` — unico artefatto di questa feature fuori da questo repository.

## Interfaccia client

```dart
abstract class AnalyticsClient {
  /// Fire-and-forget. Non attende, non lancia, non rallenta la UI (FR-068).
  void track(AnalyticsEvent event, {required AnalyticsSurface surface, int? count});
}
```

`event` e `surface` sono **enum chiusi**, e l'unico dato libero ammesso è un contatore intero. Non esiste un parametro in cui possano finire coordinate o nomi di località: FR-067 è garantito dalla firma del metodo, non dalla disciplina di chi la chiama.

## Fallimenti

Invio non atteso (`unawaited`), eccezioni catturate e inoltrate a Talker, mai propagate. Un backend irraggiungibile non deve produrre alcun effetto osservabile dall'utente (FR-068).
