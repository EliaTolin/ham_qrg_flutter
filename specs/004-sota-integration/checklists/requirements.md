# Specification Quality Checklist: SOTA Integration con "Summit Pursuit"

**Purpose**: Validate specification completeness and quality before proceeding to planning
**Created**: 2026-05-19
**Feature**: [spec.md](../spec.md)

## Content Quality

- [x] No implementation details (languages, frameworks, APIs)*
- [x] Focused on user value and business needs
- [x] Written for non-technical stakeholders
- [x] All mandatory sections completed

\* Eccezione consapevole: la spec menziona esplicitamente endpoint REST SOTA (`/api/spots/200/all/all`, `/api/summits/{summitCode}`) e la edge function `get_altimetric_profile`. Sono **vincoli esterni di prodotto** (l'API SOTA è il sistema da cui si integra) e dipendenze infrastrutturali pre-esistenti del backend, non scelte implementative discrezionali. La menzione è funzionale alla comprensione dello scope.

## Requirement Completeness

- [x] No [NEEDS CLARIFICATION] markers remain (sostituiti da 3 Open Questions strutturate per `/speckit.clarify`)
- [x] Requirements are testable and unambiguous
- [x] Success criteria are measurable
- [x] Success criteria are technology-agnostic (no implementation details)
- [x] All acceptance scenarios are defined (Given/When/Then per ogni user story)
- [x] Edge cases are identified (sezione dedicata con 13 edge case)
- [x] Scope is clearly bounded (sezione "Out of scope per MVP" + assumptions esplicite)
- [x] Dependencies and assumptions identified (sezione Assumptions con 9 voci)

## Feature Readiness

- [x] All functional requirements have clear acceptance criteria (FR mappati alle US tramite numerazione)
- [x] User scenarios cover primary flows (5 US prioritizzate P1–P3, ognuna con test indipendente)
- [x] Feature meets measurable outcomes defined in Success Criteria (8 SC quantitativi + qualitativi)
- [x] No implementation details leak into specification* (vedi eccezione sopra)

## Notes

### Open questions — risolte via `/speckit.clarify` (sessione 2026-05-19)

1. ✅ **`get_altimetric_profile`**: verificata in `ham_qrg_supabase/supabase/functions/get_altimetric_profile/`. Firma `{repeater_lat, repeater_lon, user_lat, user_lon, num_points?}` → `{points: [{lat, lon, elevation_m, distance_km}], total_distance_km, num_points}`. JWT richiesto. Backend: Open-Meteo.
2. ✅ **Posizionamento dashboard**: 4 tab paritari (Ripetitori / Spot / POTA / SOTA) per MVP, con riserva di revisione post-rilascio se UX stretta su device piccoli.
3. ✅ **Refresh lista**: solo pull-to-refresh manuale, parità POTA. Nessun auto-refresh MVP.
4. ✅ **Cache locale**: solo in-memory via Riverpod, niente persistenza su disco — parità POTA.
5. ✅ **Strumentazione analytics**: nessuna telemetria per MVP. SC-004 riformulato come obiettivo qualitativo verificato in UX testing post-release.

### Strengths

- **WOW feature ben argomentata e differenziante**: il Summit Pursuit con profilo altimetrico verso la cima sfrutta un'asset esistente del backend (`get_altimetric_profile`) per creare un valore unico rispetto a POTA e ai tool concorrenti.
- **Scope bounded**: ciò che è fuori scope (preferiti, notifiche push SOTA, "già attivata") è esplicito, evitando feature creep.
- **Allineamento al codebase**: la spec rispetta i pattern del progetto (`HookConsumerWidget`, Riverpod controllers, freezed states con `hasLoadError` per non perdere dati, l10n con prefisso feature).
- **Error handling esplicito**: FR-070/071 rispettano le linee guida CLAUDE.md su error handling nei controller Riverpod.

### Risks / Watch-outs

- **Dipendenza edge function**: tutta la WOW feature poggia su `get_altimetric_profile`. Va verificata prima del `/speckit.plan` per evitare di scoprirne l'indisponibilità a metà implementazione.
- **Logo SOTA**: la spec assume disponibilità del logo SOTA — va verificato il diritto d'uso. Fallback documentato (icona generica montagna).
- **Geolocalizzazione obbligatoria per la WOW**: senza GPS la feature WOW degrada a "info statiche sulla cima". È una limitazione intrinseca documentata negli edge case.
- **Test coverage parity con POTA**: SC-008 impegna a un livello di test analogo a POTA — da considerare nel budget di sviluppo.

### Validation result

Specifica giudicata **pronta per `/speckit.clarify`**. I 3 punti aperti sono strutturati come domande chiuse con opzioni e fallback, quindi non bloccano la pianificazione: in alternativa si può procedere a `/speckit.plan` accettando i default proposti (Q1=B, Q2=A, Q3=A).
