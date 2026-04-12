# Tasks: Cluster Spots — Frontend

**Input**: Design documents from `/specs/002-cluster-spots-frontend/`
**Prerequisites**: plan.md, spec.md, data-model.md, contracts/realtime.md, quickstart.md, research.md

**Tests**: Integration tests per Constitution §II (feature touches Supabase data). Unit tests for state derivation logic.

**Organization**: Tasks grouped by user story. US1 and US1b are merged in Phase 3 (same data layer, same endpoint). US2 in Phase 4. US3-US6 in Phase 5-8.

## Format: `[ID] [P?] [Story] Description`

- **[P]**: Can run in parallel (different files, no dependencies)
- **[Story]**: Which user story (US1, US1b, US2, US3, US4, US5, US6)
- Paths relative to `lib/` unless noted

---

## Phase 1: Setup

**Purpose**: Project scaffolding, new feature directory, shared models

- [ ] T001 Create feature directory structure `lib/src/features/spots/{data/{datasource,model,mappers,repository},domain/{spot},presentation/{create_spot_sheet,spot_list_page/controller/state,widgets},provider/{create_spot,close_spot,active_spots_notifier,recent_spots_notifier,my_active_spot_notifier,spots_with_active},errors}`
- [ ] T002 [P] Add localization keys with prefix `spot*` to `lib/l10n/app_it.arb` (all keys from quickstart.md §10: spotCreateTitle, spotCreateOtherTitle, spotCreateDuration, spotCreateAccess, spotCreateConfirm, spotActiveYou, spotActiveClose, spotActiveNone, spotActiveCta, spotListTitle, spotListViewAll, spotListBadgeActive, spotListBadgeClosed, spotListBadgeReport, spotNotificationToggle, spotNotificationDisabled, spotPreviousClosed, spotError*)
- [ ] T003 [P] Add same localization keys to `lib/l10n/app_en.arb`, `lib/l10n/app_es.arb`, `lib/l10n/app_fr.arb`
- [ ] T004 Run `flutter gen-l10n` to generate localization delegates

---

## Phase 2: Foundational (Data Layer + Domain)

**Purpose**: Domain entities, DTOs, datasource, repository — shared by ALL user stories

**CRITICAL**: No UI work can begin until this phase is complete

- [ ] T005 [P] Create domain entity `RepeaterSpot` (@freezed, no JSON) in `lib/src/features/spots/domain/spot/repeater_spot.dart` — fields: id, userId, repeaterId, callsignSnapshot, spottedCallsign?, accessId?, accessMode?, startedAt, durationMinutes?, expiresAt?, closedAt?, repeaterCallsign?, repeaterName?, spotterFirstName? (see data-model.md §1)
- [ ] T006 [P] Create `SpotState` enum + `RepeaterSpotState` extension in `lib/src/features/spots/domain/spot_state.dart` — state derivation: isSelfSpot, isOtherSpot, state (active/expired/closed), isActive, remainingTime (see data-model.md §2)
- [ ] T007 [P] Create DTO `SpotModel` (@freezed + fromJson) with nested `SpotProfileModel`, `SpotRepeaterModel`, `SpotAccessModel` in `lib/src/features/spots/data/model/spot_model.dart` (see data-model.md §3)
- [ ] T008 [P] Create `SpotMapper` (Model → Entity) in `lib/src/features/spots/data/mappers/spot_mapper.dart` — use `AccessModeHelper.fromString` for accessMode (see data-model.md §4)
- [ ] T009 [P] Create `SpotError` sealed class in `lib/src/features/spots/errors/spot_error.dart` — variants: authRequired, callsignRequired, invalidDuration, repeaterNotFound, invalidAccess, spotNotFound, forbidden, alreadyClosed, unknown. Include `fromCode(String)` factory (see quickstart.md §2)
- [ ] T010 Create abstract `SpotsDatasource` interface in `lib/src/features/spots/data/datasource/spots_datasource.dart` — methods: createSelfSpot, createOtherSpot, closeSpot, getActiveSpotsForRepeater, getRecentSpots, getMyActiveSpot, getRepeaterIdsWithActiveSpots, setClusterNotificationsEnabled, setFavoriteClusterNotifications
- [ ] T011 Create `SpotsSupabaseDatasource` implementing `SpotsDatasource` in `lib/src/features/spots/data/datasource/spots_supabase_datasource.dart` — Edge Function calls for create-spot/close-spot, REST queries per quickstart.md §2-§9
- [ ] T012 Create `SpotsRepository` in `lib/src/features/spots/data/repository/spots_repository.dart` — wraps datasource, converts Models to Entities via SpotMapper, provides Riverpod provider
- [ ] T013 Run `dart run build_runner build --delete-conflicting-outputs` to generate .g.dart and .freezed.dart files
- [ ] T014 [P] Add `clusterNotificationsEnabled` field to existing `Profile` domain entity in `lib/src/features/profile/domain/profile/profile.dart`, update ProfileModel DTO, ProfileMapper, and update the profile datasource SELECT query to include `cluster_notifications_enabled` column
- [ ] T015 [P] Add `clusterNotificationsEnabled` field to favorite repeater model/entity (in `lib/src/features/repeaters/` data layer), update mapper, and update the favorites datasource SELECT query to include `cluster_notifications_enabled` column
- [ ] T016 Run `dart run build_runner build --delete-conflicting-outputs` after profile/favorite model changes
- [ ] T017a [P] Create `SpotCard` widget in `lib/src/features/spots/presentation/widgets/spot_card.dart` — displays callsign, access mode with color chip, countdown (for self-spot) or "segnalazione" badge (for other-spot), tap handler, close button visible if spot belongs to current user (FR-008)
- [ ] T017b [P] Create `SpotCountdown` widget in `lib/src/features/spots/presentation/widgets/spot_countdown.dart` — Stream.periodic(1s), format mm:ss or h:mm:ss for >=60min (FR-014), red color under 60s, calls onExpired callback when countdown reaches zero
- [ ] T017c Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T017d Run `flutter analyze` — zero warnings required

**Checkpoint**: Data layer + foundational widgets complete. All models, datasource, repository, error types, and shared UI components ready.

---

## Phase 3: User Story 1 + 1b — Spottarsi / Spottare un OM (Priority: P1) MVP

**Goal**: Un utente può creare un self-spot (con durata) e un other-spot (con callsign OM) dalla scheda ponte. Il bottom sheet si chiude con toast di conferma.

**Independent Test**: Creare un self-spot di 15 minuti su un ponte, verificare che venga creato. Creare un other-spot con callsign "IZ0XYZ", verificare che venga creato senza durata. Tentare senza callsign → errore.

### Implementation

- [ ] T018 [P] [US1] Create `createSpotProvider` (action provider, calls Edge Function `create-spot` for self-spot) in `lib/src/features/spots/provider/create_spot/create_spot_provider.dart`
- [ ] T019 [P] [US1b] Create `createOtherSpotProvider` (action provider, calls Edge Function `create-spot` with spotted_callsign) in `lib/src/features/spots/provider/create_spot/create_other_spot_provider.dart`
- [ ] T020 [P] [US1] Create `closeSpotProvider` (action provider, calls Edge Function `close-spot`, treats ALREADY_CLOSED as success per FR-009) in `lib/src/features/spots/provider/close_spot/close_spot_provider.dart`
- [ ] T021 [US1] Create self-spot bottom sheet `CreateSpotSheet` (HookConsumerWidget) in `lib/src/features/spots/presentation/create_spot_sheet/create_spot_sheet.dart` — duration chips (5, 15, 30, 60 min per FR-003), optional access dropdown with mode colors, confirm button with loading state (FR-005), auto-close + toast on success, error messages i18n (FR-006), auth gate for anonymous (FR-007)
- [ ] T022 [US1b] Create other-spot bottom sheet `CreateOtherSpotSheet` in `lib/src/features/spots/presentation/create_spot_sheet/create_other_spot_sheet.dart` — callsign text field (required), optional access dropdown, NO duration selection (FR-002a), confirm + loading + auto-close + toast, auth gate
- [ ] T023 [US1] Add cluster section with "Spottati" and "Spotta un OM" buttons to repeater detail page in `lib/src/features/repeaters/presentation/detail/repeater_detail_page.dart` — position after "Dati tecnici" section, before "Posizione" (FR-001). "Spottati" primary, "Spotta un OM" secondary. Buttons open respective bottom sheets.
- [ ] T024 Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T025 Run `flutter analyze` — zero warnings
- [ ] T026 [US1] Integration test: create self-spot via Edge Function, verify response shape in `test/spots_provider_test.dart` (@Tags(['integration']))
- [ ] T027 [US1] Unit test: SpotState derivation (active, expired, closed, other-spot) in `test/common/utils/spot_state_test.dart`

**Checkpoint**: Self-spot and other-spot creation works from repeater detail page. Bottom sheets functional with error handling.

---

## Phase 4: User Story 2 — Vedere spot attivi su un ponte (Priority: P1)

**Goal**: La sezione "Spot attivi" nella scheda ponte mostra i self-spot attivi in tempo reale con countdown, aggiornata via Realtime.

**Independent Test**: Due utenti guardano lo stesso ponte. A si spotta: B vede lo spot apparire entro 5s. A chiude: B lo vede scomparire. Countdown si aggiorna ogni secondo.

### Implementation

- [ ] T028 [US2] Create `ActiveSpotsNotifier` (@riverpod, family by repeaterId) in `lib/src/features/spots/provider/active_spots_notifier/active_spots_notifier.dart` — initial REST load (getActiveSpotsForRepeater), Realtime subscription on channel `spots:repeater:{id}`, re-fetch enriched on event, filter only self-spots (spotted_callsign IS NULL), remove expired spots locally, ref.onDispose to unsubscribe (see contracts/realtime.md §2)
- [ ] T031 [US2] Create `ActiveSpotsSection` widget in `lib/src/features/spots/presentation/widgets/active_spots_section.dart` — consumes ActiveSpotsNotifier, shows list of SpotCard (from Phase 2 T017a), empty state "Nessuno spottato al momento — spottati tu!" (FR-015), loading skeleton (FR-030e), error with retry (FR-030f). SpotCard shows close button for current user's own spot (FR-008).
- [ ] T032 [US2] Integrate `ActiveSpotsSection` into repeater detail page in `lib/src/features/repeaters/presentation/detail/repeater_detail_page.dart` — add section between cluster buttons and location section
- [ ] T033 Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T034 Run `flutter analyze`

**Checkpoint**: Repeater detail page shows live spot list with real-time updates and countdown.

---

## Phase 5: User Story 3 — Sezione "Ultimi spot" (Priority: P2)

**Goal**: Tab "Spot" nella dashboard + pagina full-screen "Vedi tutti" con tutti gli spot 24h, Realtime, badge self/other distinti.

**Independent Test**: Creare spot su ponti diversi, verificare che appaiano in "Ultimi spot" ordinati per recenza. Creare nuovo spot → compare in cima senza refresh. Tap → naviga al ponte.

### Implementation

- [ ] T035 [US3] Create `RecentSpotsNotifier` (@riverpod) in `lib/src/features/spots/provider/recent_spots_notifier/recent_spots_notifier.dart` — initial REST load (getRecentSpots, 24h), Realtime subscription on channel `spots:global` (no filter), re-fetch enriched on event, ref.onDispose to unsubscribe
- [ ] T036 [US3] Create `SpotDashboardTab` widget in `lib/src/features/spots/presentation/widgets/spot_dashboard_tab.dart` — consumes RecentSpotsNotifier, list of SpotCard (self-spot with countdown/badge, other-spot with "segnalazione" badge per FR-017), "Vedi tutti" link at top, loading skeleton, error with retry
- [ ] T037 [US3] Add "Spot" tab to dashboard DraggableScrollableSheet in `lib/src/features/dashboard/presentation/dashboard_page/dashboard_page.dart` — third tab alongside "Ripetitori" and "POTA"
- [ ] T038 [US3] Create `SpotListState` (@freezed) in `lib/src/features/spots/presentation/spot_list_page/controller/state/spot_list_state.dart`
- [ ] T039 [US3] Create `SpotListController` (@riverpod) in `lib/src/features/spots/presentation/spot_list_page/controller/spot_list_controller.dart` — reuses RecentSpotsNotifier (shared provider per FR-030g)
- [ ] T040 [US3] Create `SpotListPage` (@RoutePage, full-screen) in `lib/src/features/spots/presentation/spot_list_page/spot_list_page.dart` — same data as dashboard tab, tap navigates to repeater detail (FR-019)
- [ ] T041 [US3] Add `SpotListRoute` to `lib/router/app_router.dart`
- [ ] T042 Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T043 Run `flutter analyze`

**Checkpoint**: "Ultimi spot" tab visible in dashboard, full-screen page accessible, real-time updates working.

---

## Phase 6: User Story 4 — Indicatore personale (Priority: P2)

**Goal**: Banner persistente sopra la bottom nav con countdown + chiudi, visibile in tutte le 4 tab + full-screen "Ultimi spot". Aggiornato via Realtime.

**Independent Test**: Creare uno spot, navigare alla dashboard → banner visibile. Chiudere dall'indicatore → scompare. Countdown a 0 → scompare. Sostituzione → toast + aggiornamento.

### Implementation

- [ ] T044 [US4] Create `MyActiveSpotNotifier` (@Riverpod(keepAlive: true)) in `lib/src/features/spots/provider/my_active_spot_notifier/my_active_spot_notifier.dart` — initial REST load (getMyActiveSpot), Realtime subscription on channel `spots:user:{userId}`, handle UPDATE (closed_at null→not null) → show toast + clear state, handle INSERT → update with new spot, ref.onDispose to unsubscribe. Created post-login, invalidated on logout.
- [ ] T045 [US4] Create `ActiveSpotBanner` widget in `lib/src/features/spots/presentation/widgets/active_spot_banner.dart` — consumes MyActiveSpotNotifier, shows repeater callsign/name, SpotCountdown, "Chiudi" button (calls closeSpotProvider), animated appear/disappear, positioned above bottom nav
- [ ] T046 [US4] Integrate `ActiveSpotBanner` as overlay in `lib/src/features/home/presentation/home_page/home_page.dart` — Stack above AutoTabsScaffold bottom nav, visible in all 4 tabs (FR-020)
- [ ] T047 [US4] Initialize `MyActiveSpotNotifier` post-login in splash controller `lib/src/features/splashscreen/presentation/splash/controller/splash_controller.dart` — ref.read(myActiveSpotNotifierProvider) after auth
- [ ] T048 [US4] Invalidate `MyActiveSpotNotifier` on logout in `lib/src/features/profile/provider/logout/logout_provider.dart`
- [ ] T049 Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T050 Run `flutter analyze`

**Checkpoint**: Persistent banner visible across all tabs, real-time updates, close and substitution work.

---

## Phase 7: User Story 5 — Notifiche push deep link (Priority: P2)

**Goal**: Tap su notifica push cluster → naviga alla scheda ponte. Notifica in-app (snackbar) quando app in foreground (soppressa se gia sulla stessa scheda ponte).

**Independent Test**: Utente A con ponte X nei preferiti. B crea spot su X. A riceve notifica. Tap → scheda ponte X. Con app in foreground e su altra pagina: snackbar. Con app su stessa scheda ponte: snackbar soppressa.

### Implementation

- [ ] T051 [US5] Create notification handler for cluster spots in `lib/common/service/messaging/cluster_spot_notification_handler.dart` — addClickListener: parse `data.type == 'new_cluster_spot'` + `data.repeater_id` → push RepeaterDetailRoute. addForegroundWillDisplayListener: preventDefault + show in-app snackbar (suppress if already on same repeater detail page per FR-025).
- [ ] T052 [US5] Integrate cluster spot notification handler initialization in `lib/main.dart` or post-login initialization — call after OneSignal.initialize()
- [ ] T053 Run `flutter analyze`

**Checkpoint**: Push notification tap opens correct repeater page. In-app notification shows snackbar.

---

## Phase 8: User Story 6 — Preferenze notifiche (Priority: P3)

**Goal**: Toggle globale "Notifiche cluster" in profilo + toggle per-preferito nei favoriti. Toggle disabilitato se globale off.

**Independent Test**: Impostazioni profilo → toggle "Notifiche cluster" visibile e attivo. Disattivare → favoriti mostrano toggle grayed out con messaggio. Riattivare → toggle per-preferito funzionante.

### Implementation

- [ ] T054 [US6] Add "Notifiche cluster" toggle to user settings screen in `lib/src/features/profile/presentation/user_settings/user_settings_screen.dart` — reads/writes `profiles.cluster_notifications_enabled` via repository (FR-027)
- [ ] T055 [US6] Add per-favorite "Notifiche spot" toggle to favorites page in `lib/src/features/repeaters/presentation/favorites_page/favorites_page.dart` — reads/writes `user_favorite_repeaters.cluster_notifications_enabled` via repository (FR-028), disabled with text "Notifiche cluster disattivate nelle impostazioni profilo" when global toggle is off (FR-029)
- [ ] T056 Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T057 Run `flutter analyze`

**Checkpoint**: Notification preferences fully functional at both levels.

---

## Phase 9: Indicatori mappa e card

**Goal**: Bordo rosso pulsante sui marker mappa + punto rosso sulle card per ripetitori con self-spot attivi.

### Implementation

- [ ] T058 [P] Create `RepeatersWithActiveSpotsProvider` (@Riverpod(keepAlive: true)) in `lib/src/features/spots/provider/spots_with_active/repeaters_with_active_spots_provider.dart` — REST query for distinct repeater_ids with active self-spots, subscribes to `spots:global` Realtime channel (same table events as RecentSpotsNotifier) to add/remove repeater IDs incrementally on INSERT/UPDATE events, returns Set<String>. Graceful degradation: empty set if load fails.
- [ ] T059 Integrate red pulsing border on map markers in `lib/src/features/repeaters/presentation/repeaters_map_page/repeaters_map_page.dart` — consume RepeatersWithActiveSpotsProvider, if repeater.id in set → red border (#EF4444) with pulse animation (1.5s cycle, opacity 40-100%) per FR-030
- [ ] T060 Integrate red dot (8dp, #EF4444, top-right corner) on repeater cards in `lib/common/widgets/cards/repeater_card.dart` — consume RepeatersWithActiveSpotsProvider, show dot if repeater.id in set per FR-030c
- [ ] T061 Run `dart run build_runner build --delete-conflicting-outputs`
- [ ] T062 Run `flutter analyze`

**Checkpoint**: Map markers pulse red for active spots. Card dots appear/disappear in real-time.

---

## Phase 10: Polish & Cross-Cutting Concerns

- [ ] T063 [P] Integration test: create-spot + close-spot full flow via Edge Functions in `test/spots_provider_test.dart`
- [ ] T064 [P] Integration test: notification preferences (read/write cluster_notifications_enabled on profiles and user_favorite_repeaters) in `test/spots_notification_prefs_test.dart`
- [ ] T065 Run `flutter gen-l10n` to verify all localization keys compile
- [ ] T066 Run `dart format lib test` — no changes required
- [ ] T067 Run `flutter analyze` — final zero warnings check
- [ ] T068 Run `flutter test` — all tests pass
- [ ] T069 Manual smoke test: full flow per quickstart.md §9 (create self-spot, other-spot, close, realtime, notification, preferences, indicators)

---

## Dependencies & Execution Order

### Phase Dependencies

- **Phase 1 (Setup)**: No dependencies — start immediately
- **Phase 2 (Foundational)**: Depends on Phase 1 — BLOCKS all user stories
- **Phase 3 (US1+US1b)**: Depends on Phase 2 — MVP
- **Phase 4 (US2)**: Depends on Phase 2 (uses ActiveSpotsNotifier + SpotCard)
- **Phase 5 (US3)**: Depends on Phase 2 (uses RecentSpotsNotifier + SpotCard from Phase 4)
- **Phase 6 (US4)**: Depends on Phase 2 (uses MyActiveSpotNotifier)
- **Phase 7 (US5)**: Depends on Phase 2 (notification handler is standalone)
- **Phase 8 (US6)**: Depends on Phase 2 (profile/favorite model changes)
- **Phase 9 (Indicators)**: Depends on Phase 2 (uses RepeatersWithActiveSpotsProvider)
- **Phase 10 (Polish)**: Depends on all desired phases being complete

### User Story Dependencies

- **US1+US1b (P1)**: After Phase 2 — no other story dependencies
- **US2 (P1)**: After Phase 2 — independent, uses SpotCard/SpotCountdown from Phase 2
- **US3 (P2)**: After Phase 2 — independent, uses SpotCard from Phase 2
- **US4 (P2)**: After Phase 2 — fully independent
- **US5 (P2)**: After Phase 2 — fully independent
- **US6 (P3)**: After Phase 2 — fully independent
- **Indicators**: After Phase 2 — fully independent

### Recommended Implementation Order

```
Phase 1 → Phase 2 → Phase 3 (MVP!) → Phase 4 → Phase 5 → Phase 6 → Phase 7 → Phase 8 → Phase 9 → Phase 10
```

### Parallel Opportunities (after Phase 2)

Phases 3-9 can all proceed in parallel since they touch different files:
- **Phase 3** (bottom sheets, buttons in repeater detail)
- **Phase 4** (ActiveSpotsSection, SpotCard, SpotCountdown)
- **Phase 5** (SpotDashboardTab, SpotListPage)
- **Phase 6** (ActiveSpotBanner, home_page overlay)
- **Phase 7** (notification handler)
- **Phase 8** (settings toggles)
- **Phase 9** (map markers, card dots)

---

## Parallel Example: Phase 2 (Foundational)

```
# All [P] tasks in Phase 2 can run in parallel:
T005: RepeaterSpot entity
T006: SpotState enum
T007: SpotModel DTO
T008: SpotMapper
T009: SpotError
T014: Profile model update
T015: Favorite model update
T017a: SpotCard widget
T017b: SpotCountdown widget
```

## Parallel Example: Phase 3 (US1+US1b)

```
# Providers can be created in parallel:
T018: createSpotProvider
T019: createOtherSpotProvider
T020: closeSpotProvider

# Then bottom sheets (depend on providers):
T021: CreateSpotSheet
T022: CreateOtherSpotSheet
```

---

## Implementation Strategy

### MVP First (Phase 1-3 Only)

1. Complete Phase 1: Setup (T001-T004)
2. Complete Phase 2: Foundational data layer (T005-T017)
3. Complete Phase 3: US1+US1b — self-spot + other-spot creation (T018-T027)
4. **STOP and VALIDATE**: Un utente può spottarsi e spottare OM dalla scheda ponte
5. Deploy/demo if ready — la feature ha gia valore

### Incremental Delivery

1. Phase 1+2 → Data layer ready
2. + Phase 3 → MVP! Spot creation works
3. + Phase 4 → Live spot list on repeater detail (Realtime!)
4. + Phase 5 → Global "Ultimi spot" dashboard + full-screen
5. + Phase 6 → Personal banner across all tabs
6. + Phase 7 → Push notifications with deep link
7. + Phase 8 → Notification preferences
8. + Phase 9 → Map/card visual indicators
9. + Phase 10 → Polish, tests, smoke test

---

## Notes

- [P] tasks = different files, no dependencies
- [Story] label maps task to specific user story
- Run `build_runner` after EVERY phase that creates/modifies @freezed or @riverpod files
- Run `flutter analyze` at end of every phase — zero warnings
- Commit after each phase checkpoint
- The spec requires Constitution §II: at least one integration test for Supabase data (T026, T063, T064)
