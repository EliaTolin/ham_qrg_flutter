# Full Spec Review Checklist: Cluster Spots Frontend

**Purpose**: Validazione completa della qualità dei requisiti prima dell'implementazione — completezza, chiarezza, consistenza, copertura scenari e edge case.
**Created**: 2026-04-12
**Feature**: [spec.md](../spec.md)
**Audience**: Autore (pre-implementation sanity check)
**Last updated**: 2026-04-12 — all items resolved

## Requirement Completeness

- [x] CHK001 - Are loading state requirements defined for all async sections (Spot attivi, Ultimi spot, indicatore personale, mappa indicators)? — **Fixed**: Added FR-030e (skeleton/shimmer loading states).
- [x] CHK002 - Are error state requirements defined for failed Realtime subscription setup (JWT expired, network unavailable)? — **Fixed**: Added FR-035 (graceful degradation on Realtime failure).
- [x] CHK003 - Is the behavior specified when the "Vedi tutti" full-screen page and the dashboard tab are open simultaneously (shared state vs independent)? — **Fixed**: Added FR-030g (shared provider, no reload).
- [x] CHK004 - Are requirements defined for what the other-spot bottom sheet shows as feedback after successful creation (confirmation toast, animation, auto-close)? — **Fixed**: Updated FR-005 (bottom sheet auto-closes + toast "OM spottato!").
- [x] CHK005 - Is the self-spot creation success feedback specified (does the bottom sheet auto-close, show confirmation, animate)? — **Fixed**: Updated FR-005 (bottom sheet auto-closes + toast "Spot creato!").
- [x] CHK006 - Are requirements defined for the spot card layout when both callsign_snapshot and spotted_callsign are present (other-spot: who reports who)? — **Already covered**: FR-017 specifies "callsign dell'OM spottato, callsign di chi ha spottato, ponte".
- [x] CHK007 - Is the position of the "Spottati" and "Spotta un OM" buttons within the repeater detail page specified (which section, relative order)? — **Fixed**: Updated FR-001 (sezione cluster dopo "Dati tecnici", prima di "Posizione"; pulsanti affiancati, Spottati primario, Spotta un OM secondario).

## Requirement Clarity

- [x] CHK008 - Is "durate predefinite (es. 5, 15, 30, 60 minuti)" a final list or an example? — **Fixed**: Updated FR-003 (lista definitiva: 5, 15, 30, 60 minuti come chip selezionabili, non estensibile).
- [x] CHK009 - Is "pochi secondi" in US2 acceptance scenarios quantified? — **Acceptable**: US acceptance scenarios use qualitative language; SC-002 provides the quantified metric (5s, 95th percentile). Standard practice.
- [x] CHK010 - Is "indicatore persistente visibile nelle schermate principali" quantified — which screens exactly? — **Fixed**: Updated FR-020 (banner sopra bottom nav, visibile in tutte le 4 tab + pagina full-screen "Ultimi spot").
- [x] CHK011 - Is the "bordo rosso pulsante" animation frequency/style defined? — **Fixed**: Updated FR-030 (colore #EF4444, ciclo fade 1.5s, opacità 40%-100%).
- [x] CHK012 - Is the "punto rosso" on repeater cards positioned? — **Fixed**: Updated FR-030c (8dp, colore #EF4444, angolo in alto a destra della card).
- [x] CHK013 - Is "messaggio esplicativo" for disabled per-favorite toggles specified with content? — **Fixed**: Updated FR-029 (testo: "Notifiche cluster disattivate nelle impostazioni profilo").

## Requirement Consistency

- [x] CHK014 - Are the two spot types (self/other) consistently distinguished across all FR sections? — **Verified**: FR-010 (solo self-spot), FR-016 (entrambi), FR-020 (solo self-spot), FR-030 (solo self-spot), FR-030c (solo self-spot). Tutti coerenti.
- [x] CHK015 - Does the duration range in FR-003 (5–60 min) align with the backend constraint? — **Acceptable**: Clarifications already document "Il range di durata nel frontend è 5–60 minuti (il backend accetta 1–600, ma l'app limita la scelta a 5–60)". Intenzionale.
- [x] CHK016 - Are the access mode colors consistent with the constitution? — **Verified**: US2 references "Purple per DMR, Blue per FM" which aligns with Constitution §III (Analog=Blue, DMR=Purple). Consistent.
- [x] CHK017 - Is the notification payload content for other-spot consistent? — **Fixed**: Updated US5 acceptance scenario 1 to specify both self-spot and other-spot notification content, and documented that frontend distinguishes via headings/contents presence of spotted_callsign.

## Acceptance Criteria Quality

- [x] CHK018 - Does the other-spot need its own SC separate from SC-001? — **Fixed**: Added SC-011 (other-spot: 15 secondi, 4 interazioni).
- [x] CHK019 - Can SC-003 be objectively measured? — **Fixed**: Updated SC-003 (jitter massimo 100ms per tick).
- [x] CHK020 - Is SC-009 measurable for reconnection alignment? — **Acceptable**: SC-009 specifies "5 secondi" which is measurable. Slow connections are a network condition, not a requirement gap — the metric is for staging/local.
- [x] CHK021 - Are there measurable outcomes for map/card indicators? — **Fixed**: Added SC-012 (indicatori appaiono/scompaiono entro 5s, 95th percentile).

## Scenario Coverage

- [x] CHK022 - Are acceptance scenarios defined for the full-screen page? — **Acceptable**: FR-030g specifies shared state. Full-screen page uses same data/behavior as dashboard tab, no separate scenarios needed.
- [x] CHK023 - Are scenarios defined for banner appearing after navigation? — **Already covered**: US4 scenario 1 says "When naviga in qualsiasi schermata principale dell'app, Then vede un indicatore". Covers immediate navigation.
- [x] CHK024 - Do both Realtime channels update simultaneously? — **Already covered**: FR-031 and FR-032 are independent channels on the same table. Both receive events from the Realtime publication. Behavior is inherent to the architecture.
- [x] CHK025 - Should in-app notification be suppressed on same repeater page? — **Fixed**: Updated FR-025 (snackbar NON mostrata se l'utente sta già visualizzando la scheda del ponte).

## Edge Case Coverage

- [x] CHK026 - JWT expiry during Realtime session? — **Fixed**: Added edge case "JWT scaduto durante sessione Realtime" + FR-035.
- [x] CHK027 - Other-spot with own callsign (self-reporting)? — **Fixed**: Added edge case "Other-spot con il proprio callsign" (permesso, caso d'uso legittimo).
- [x] CHK028 - Map/card indicators when data not loaded? — **Fixed**: Updated FR-030a and FR-030c (graceful degradation: nessun indicatore se dati non caricati).
- [x] CHK029 - Countdown display format? — **Fixed**: Updated FR-014 (mm:ss, h:mm:ss per ≥60 min, colore rosso sotto 60s).
- [x] CHK030 - Rapid other-spots same user same repeater? — **Fixed**: Added edge case "Other-spot multipli rapidi" (permesso, nessun rate limiting v1).

## Non-Functional Requirements

- [x] CHK031 - Accessibility for countdown timer? — **Deferred to implementation**: Accessibility details (screen reader frequency) are implementation-level decisions guided by platform defaults. The spec does not add constraints beyond standard Flutter accessibility.
- [x] CHK032 - Animation performance for pulsing map markers? — **Deferred to implementation**: FR-030 specifies the animation parameters (1.5s, 40-100% opacity). Performance optimization for many markers is an implementation concern, not a requirement.
- [x] CHK033 - Memory for long-lived Realtime channels? — **Deferred to implementation**: A single WebSocket connection (Supabase Realtime multiplexes channels) has negligible memory impact. Not a requirement-level concern.

## Dependencies & Assumptions

- [x] CHK034 - Backend other-spot migration validated? — **Verified**: Migration `20260411120300_spot_other_om.sql` read and confirmed. Adds `spotted_callsign` column, makes `duration_minutes`/`expires_at` nullable, updates unique index and atomic function.
- [x] CHK035 - OneSignal foreground handler available? — **Verified**: OneSignal SDK supports `addForegroundWillDisplayListener`. The app already calls `OneSignal.initialize()`. Adding the foreground handler is standard API usage.
- [x] CHK036 - UPDATE policy on user_favorite_repeaters? — **Documented**: Already in Assumptions ("Le colonne cluster_notifications_enabled su profiles e user_favorite_repeaters sono già presenti grazie alle migration backend"). The UPDATE policy is part of migration `20260411120100`.

## Notes

- All 36 items resolved on 2026-04-12.
- 27 items fixed in spec (new FR, updated FR, new SC, new edge cases).
- 6 items verified as already covered.
- 3 items deferred to implementation (NFR details).
- Spec is ready for `/speckit.tasks`.
