# Mobile Onboarding Redesign PRD

**Author:** Elia Tolin
**Date:** 2026-03-27
**Status:** Draft
**Skill used:** `skills/prd-development/SKILL.md`

---

## 1. Executive Summary

We're building a redesigned mobile onboarding experience for new HamQRG users to solve the problem of a minimal two-step flow (user type + callsign) that drops users onto the dashboard without explaining the app's core value — finding and exploring ham radio repeaters, monitoring live POTA (Parks on the Air) activations, and joining the community via Telegram. The redesign will guide new users to their first meaningful interaction (discovering a nearby repeater or live POTA spot), connect them to the Telegram community, and reduce early churn.

---

## 2. Problem Statement

### Who has this problem?
New users who download HamQRG for the first time — both licensed ham radio operators and SWL (shortwave listener) newcomers.

### What is the problem?
The current onboarding flow is purely administrative: it asks user type (licensed/SWL) and callsign, then drops users on a dashboard with a map preview and statistics. There's no guidance on what the app does, how to use it, or what to do first. Users must figure out the value proposition on their own.

**Current flow:**
```
Splash (2.5s) → [User Type selection] → [Callsign entry] → Dashboard (cold)
```

### Why is it painful?
- **New hams / SWL users** don't understand what they're looking at (Maidenhead locator, repeater modes like DMR/C4FM/D-STAR)
- **Experienced hams** don't discover key features (favorites, filtering by mode, network search, live POTA spots)
- **POTA enthusiasts** don't know the app has real-time POTA spot monitoring with band/mode filtering and distance sorting
- **All users** see a disclaimer dialog and a Telegram invite popup within seconds of landing — the Telegram community is a key retention driver, but the current timing (popup on cold dashboard) undermines its impact
- **Anonymous users** skip onboarding entirely and land on an unexplained dashboard

### Evidence (to be gathered)
- [ ] Activation funnel analytics (splash → onboarding → first repeater view)
- [ ] Day-1 and Day-7 retention rates
- [ ] App store reviews mentioning confusion or lack of guidance
- [ ] Support/Telegram channel questions from new users

---

## 3. Target Users & Personas

### Primary Persona: New Licensed Ham — "Marco"
- **Profile:** Recently licensed Italian ham radio operator (IU-prefix callsign)
- **Tech savviness:** Moderate (uses smartphone apps daily, familiar with radio basics)
- **Goal:** Find repeaters near him to make his first contacts
- **Pain point:** Knows radio theory but not which repeaters are active nearby or what modes they support
- **Current behavior:** Asks on Telegram groups, checks outdated PDF lists
- **Job-to-be-done:** "Help me find a repeater I can reach with my radio so I can make my first contact today"
- **Secondary interest:** POTA activations — wants to know if someone is activating a park nearby

### Secondary Persona: Curious SWL — "Giulia"
- **Profile:** Shortwave listener, no license yet, exploring the hobby
- **Tech savviness:** High (digital native), but low ham radio knowledge
- **Goal:** Understand what repeaters exist nearby and what she could access with a license
- **Pain point:** Jargon-heavy interfaces (CTCSS, Color Code, DMR ID) with no explanation
- **Current behavior:** Browses online repeater databases, gets overwhelmed
- **Job-to-be-done:** "Show me what's out there so I can decide if getting a license is worth it"

### Secondary Persona: Experienced Ham — "Paolo"
- **Profile:** Veteran operator with multiple radios, knows the repeater landscape
- **Goal:** Quick access to repeater details on the go, favorite management
- **Pain point:** Doesn't need hand-holding but wants to know power features fast
- **Current behavior:** Skips onboarding, explores on his own, may miss features
- **Job-to-be-done:** "Let me get to the map fast and show me what's new compared to my usual tools"
- **Secondary interest:** Live POTA spots — wants real-time activations without switching apps

---

## 4. Strategic Context

### Business Goals
- Increase Day-7 retention rate
- Improve app store rating (first-session experience is the primary driver)
- Grow active user base in the Italian ham radio community
- Increase anonymous-to-registered conversion rate

### Why Now?
- The app already has rich features (map, list, favorites, mode filtering, network search, live POTA spots) but the onboarding doesn't showcase any of them
- Current post-login onboarding (`post_login_onboarding/`) only collects profile data — zero feature education
- Anonymous auth exists, meaning users can explore without signing up, but they land on the same unexplained dashboard
- The feature set has grown significantly; the gap between "what's available" and "what new users discover" is widening
- **Telegram community is a key retention lever** — users who join the group stay longer and contribute more (repeater reports, feedback). The current popup timing wastes this opportunity by showing it before the user understands why the community matters

### Competitive Context
- **RepeaterBook:** No mobile onboarding, relies on web familiarity. Dominant by inertia, not UX.
- **HamQRG differentiator:** Map-first, location-aware experience with multi-mode support (Analog, DMR, C4FM, D-STAR with color coding) + live POTA spot monitoring. Onboarding should make this advantage obvious within 30 seconds.
- **POTA.app:** Official POTA site has spot listings but no mobile-native experience with distance sorting, band filtering, and park map integration like HamQRG offers

---

## 5. Solution Overview

### Proposed Flow

```
PRIMO AVVIO (tutti gli utenti, inclusi anonimi):

Splash (2.5s)
  → Welcome screens (4 cards: repeaters + crediti IZ8WNH, modi, POTA, preferiti)
  → Location permission (contextual)
  → User Type selection (Licensed / SWL)
  → Callsign entry (if applicable)
  → "Your First Discovery" (nearest repeater + live POTA spots)
  → Telegram Community Invite (dedicated step)
  → Dashboard
```

**Persistenza locale-first:** User type e callsign vengono salvati in **SharedPreferences** durante l'onboarding, anche per utenti anonimi. Non serve un account Supabase per completare l'onboarding.

```
POST-REGISTRAZIONE (Google/Apple sign-in):

  Se il profilo Supabase NON ha userType/callsign:
    → Leggi da SharedPreferences → Salva su Supabase (sync automatico)
    → Skip post_login_onboarding (dati gia raccolti nell'onboarding)

  Se il profilo Supabase HA gia userType/callsign (es. re-login):
    → Skip tutto
```

**Dialogs rimosse dal `HomeController`:**
- **Disclaimer IZ8WNH** → eliminata come dialog separata; i crediti sono integrati nella Card 1 delle welcome screens
- **Telegram invite popup** → sostituita dallo step dedicato nell'onboarding (vedi 5.5)

### Key Features

#### 5.1 Welcome Value Proposition Screens
4 horizontal swipeable cards shown before any profile setup:

| Card | Headline | Visual | Note |
|------|----------|--------|------|
| 1 | "Trova i ripetitori vicino a te" | Map with repeater pins | Subtitle: "Dati dei ponti radio forniti da IZ8WNH" + link a iz8wnh.it |
| 2 | "Filtra per modo — Analogico, DMR, C4FM, D-STAR" | Color-coded mode chips (Blue, Purple, Teal, Orange) | |
| 3 | "Spot POTA in tempo reale" | POTA spots list with band badges and freshness indicators (green/orange/gray) | |
| 4 | "Salva i preferiti per accesso rapido" | Favorites list preview | |

- **Card 1 integra i crediti IZ8WNH** — il sottotitolo attribuisce la fonte dati e il link consente di visitare il sito. Questo sostituisce completamente la dialog disclaimer attuale (`show_disclaimer_dialog.dart`).
- Skip button on all cards
- "Inizia" (Get Started) button on final card
- Shown only on first launch

#### 5.2 Contextual Location Permission
Custom pre-permission screen before the system dialog:
- Explains: "Usiamo la tua posizione per mostrarti i ripetitori e le attivazioni POTA vicine"
- Map illustration with location pin
- "Attiva Posizione" button → triggers system permission
- "Non ora" option → continues with degraded experience (no nearby repeaters/POTA distance, can still browse)

#### 5.3 Profile Setup (Local-First)
Stessa UI dell'attuale `post_login_onboarding`, ma con persistenza locale:
- Step 1: Licensed operator / SWL selection
- Step 2: Callsign entry (required for licensed, optional for SWL)
- **Salvataggio:** `SharedPreferences` (non Supabase) — funziona anche per utenti anonimi
- **Sync post-registrazione:** Quando l'utente si registra (Google/Apple), un provider legge i dati locali e li scrive sul profilo Supabase se mancanti. Questo avviene nel flusso di auth, prima di navigare alla Home.
- **Post-login onboarding skip:** Se i dati locali sono gia stati sincronizzati su Supabase, `checkNeedsPostLoginOnboarding` ritorna `false` → skip diretto alla Home

#### 5.4 "Your First Discovery" Guided Moment
After profile setup, show a split-view discovery screen with two sections:

**Section A — Nearest Repeater:**
- **Card shows:** Repeater name, frequency (formatted), distance, mode with color badge
- **CTA:** "Vedi Dettagli" → navigates to repeater detail page

**Section B — Live POTA Spot (if any active):**
- **Card shows:** Activator callsign, park reference + name, frequency, band badge, freshness indicator
- **CTA:** "Vedi Spot" → navigates to POTA spot detail page
- **If no active spots:** Section hidden, full space to nearest repeater

**Bottom CTA:** "Esplora la Mappa" → navigates to map tab
**Fallback (no location):** Show "Esplora la mappa per trovare ripetitori e attivazioni POTA" with map CTA

Shown once only.

#### 5.5 Telegram Community Invite (Dedicated Onboarding Step)
**This is NOT a deferred popup — it's a proper onboarding step.** The Telegram community is a key retention driver and deserves a dedicated screen.

After the first discovery moment, show a dedicated community invite screen:
- **Headline:** "Unisciti alla community"
- **Body:** "Entra nel gruppo Telegram di HamQRG per ricevere aggiornamenti, segnalare ripetitori e conoscere altri radioamatori"
- **Primary CTA:** "Unisciti al Gruppo Telegram" → opens Telegram deep link
- **Secondary CTA:** "Forse dopo" → proceeds to dashboard (stores preference, re-shows once after Day 7 if not joined)
- **Visual:** Telegram logo + community member count (if available)
- **Why here:** The user has just seen the app's value (repeaters + POTA). They now have context for why a community around this app is worth joining. This is dramatically more effective than a cold popup on an unexplained dashboard.

#### 5.6 Cleanup: Rimozione Dialog dal HomeController
Entrambe le dialog attuali vengono **eliminate** dal `HomeController`:

- **Disclaimer IZ8WNH (`show_disclaimer_dialog.dart`)** → **rimossa completamente.** I crediti alla fonte dati sono ora nella Card 1 dell'onboarding. Il file dialog puo essere eliminato.
- **Telegram invite popup (`show_telegram_invite_dialog.dart`)** → **rimossa dal primo avvio.** Sostituita dallo step dedicato nell'onboarding (5.5). Il file dialog viene mantenuto e riutilizzato solo per il re-prompt Day 7 degli utenti che hanno scelto "Forse dopo".
- `HomeState.showDisclaimer` → rimosso
- `HomeState.showTelegram` → rinominato in `showTelegramRePrompt`, attivo solo per utenti "Forse dopo" dopo Day 7
- I provider `needToShowDisclaimerProvider`, `setDisclaimerSeenProvider` → eliminabili
- Il provider `needToShowTelegramInviteProvider` → aggiornato per controllare solo il re-prompt Day 7

---

## 6. Success Metrics

### Primary Metric
**Activation rate** — % of new users who view at least one repeater detail within their first session

| | Current | Target |
|---|---------|--------|
| Activation rate | TBD (instrument first) | 60%+ |

**Timeline:** Measure 30 days after launch

### Secondary Metrics
| Metric | Current | Target |
|--------|---------|--------|
| Onboarding completion rate | TBD | 85% |
| Day-7 retention | TBD | +15% improvement |
| Time to first repeater view | TBD | < 60 seconds from splash |
| Welcome screens view-through rate | N/A | 70%+ reach final card |
| POTA spot view rate (first session) | TBD | 30%+ of users tap a POTA spot |
| **Telegram join rate (from onboarding)** | TBD | **25%+** (vs. current popup conversion) |
| Telegram re-prompt join rate (Day 7) | N/A | 10%+ of "Forse dopo" users |

### Guardrail Metrics
| Metric | Constraint |
|--------|-----------|
| Onboarding skip rate | If >40%, flow is too long — simplify |
| Anonymous-to-registered conversion | Must not decrease |
| App crash rate during onboarding | Must remain at 0% |

---

## 7. User Stories & Requirements

### Epic Hypothesis
We believe that adding feature education and a guided first-repeater interaction to the onboarding flow will increase activation rate because users currently land on the dashboard without understanding the app's value or knowing what to do first. We'll measure success by activation rate and Day-7 retention 30 days post-launch.

### User Stories

#### Story 1: Welcome value proposition screens

**As a** new user,
**I want to** understand what HamQRG does before signing up,
**so that** I know why I should invest time in it.

**Acceptance Criteria:**
- [ ] 4 horizontal swipeable cards shown after splash screen
- [ ] Each card has illustration/graphic, headline, and one-line description
- [ ] **Card 1** include i crediti IZ8WNH: sottotitolo "Dati dei ponti radio forniti da IZ8WNH" + link tappabile a iz8wnh.it (via `url_launcher`)
- [ ] **Card 3** presenta gli spot POTA con band badges e indicatori di freschezza
- [ ] All text in Italian (following existing l10n pattern in `app_it.arb`)
- [ ] Skip button ("Salta") visible on all cards
- [ ] "Inizia" (Get Started) button on final card
- [ ] Dot indicators show current position
- [ ] Shown only on first launch (persist flag via SharedPreferences)
- [ ] Swipe gestures and tap navigation both supported
- [ ] **Sostituisce completamente** `show_disclaimer_dialog.dart` — la dialog disclaimer non viene piu mostrata

#### Story 2: Contextual location permission request

**As a** new user,
**I want to** understand why the app needs my location before granting permission,
**so that** I feel comfortable sharing it.

**Acceptance Criteria:**
- [ ] Custom pre-permission screen shown before system dialog
- [ ] Explains purpose: location is used to show nearby repeaters
- [ ] "Attiva Posizione" button triggers system permission dialog
- [ ] "Non ora" allows continuing without location
- [ ] If permission denied, app continues gracefully (no crash, no re-prompt)
- [ ] If permission already granted (from previous install), skip this screen

#### Story 3: Guided first discovery (repeaters + POTA)

**As a** new user,
**I want to** be shown a nearby repeater and live POTA spots after setup,
**so that** I immediately experience the app's value.

**Acceptance Criteria:**
- [ ] After profile setup, show split-view discovery screen
- [ ] **Repeater section:** Fetch nearest repeater using existing location service + Supabase query
- [ ] Card displays: repeater name, frequency (formatted), distance, mode with color badge
- [ ] Mode color follows existing scheme: Analog=Blue, DMR=Purple, C4FM=Teal, D-STAR=Orange
- [ ] "Vedi Dettagli" CTA navigates to `RepeaterDetailRoute(repeaterId: id)`
- [ ] **POTA section:** Fetch active POTA spots from existing `PotaApiDatasource` (`GET /spot/`)
- [ ] If active spots exist: show top spot with activator callsign, park name, frequency, band badge, freshness indicator
- [ ] Freshness indicator follows existing scheme: green (<5min), orange (<15min), gray (>15min)
- [ ] "Vedi Spot" CTA navigates to `PotaSpotDetailRoute(spotId: id, reference: ref)`
- [ ] If no active POTA spots: hide POTA section, full space to repeater card
- [ ] **Bottom CTA:** "Esplora la Mappa" navigates to map tab in `HomeRoute`
- [ ] If no location available: show fallback with "Esplora la mappa per trovare ripetitori e attivazioni POTA"
- [ ] Screen shown once; subsequent opens go directly to dashboard
- [ ] Loading state while fetching data (use existing loading widgets)

#### Story 4: Telegram community invite (onboarding step)

**As a** new user who has just seen the app's value,
**I want to** be invited to join the HamQRG Telegram community,
**so that** I can connect with other operators, get help, and stay updated.

**Acceptance Criteria:**
- [ ] Dedicated full-screen community invite shown after first discovery screen
- [ ] Headline: "Unisciti alla community" with Telegram branding
- [ ] Body explains value: updates, repeater reports, meeting other hams
- [ ] "Unisciti al Gruppo Telegram" button opens Telegram deep link
- [ ] "Forse dopo" button proceeds to dashboard, stores choice in SharedPreferences
- [ ] If user taps "Forse dopo", re-show Telegram invite once after Day 7 (gentle re-prompt via existing dialog logic in `HomeController`)
- [ ] If user joined (or tapped Telegram link), do not re-show
- [ ] Track: impressions, tap-through rate, "Forse dopo" rate

#### Story 5: Profile setup local-first con sync post-registrazione

**As a** anonymous user,
**I want to** inserire il mio tipo utente e nominativo durante l'onboarding,
**so that** quando mi registro i dati siano gia pronti senza doverli reinserire.

**Acceptance Criteria:**
- [ ] User type (Licensed/SWL) e callsign salvati in `SharedPreferences` durante l'onboarding
- [ ] Stessa UI dell'attuale `post_login_onboarding` (selezione tipo + campo callsign)
- [ ] Validazione callsign invariata (uppercase, alfanumerico)
- [ ] Funziona per utenti anonimi — nessuna chiamata Supabase
- [ ] **Sync automatico post-registrazione:** Quando l'utente completa sign-in (Google/Apple), un provider:
  - Legge userType e callsign da SharedPreferences
  - Controlla se il profilo Supabase ha gia questi campi
  - Se mancanti → li scrive sul profilo Supabase
  - Se gia presenti (es. re-login su altro device) → non sovrascrive, usa quelli di Supabase
- [ ] `checkNeedsPostLoginOnboarding` aggiornato: ritorna `false` se i dati sono gia su Supabase (sync avvenuto) O se sono in SharedPreferences (sync pending)
- [ ] Il vecchio `post_login_onboarding` non viene piu mostrato se l'utente ha completato il nuovo onboarding

#### Story 6: Rimozione dialog dal HomeController

**As a** developer,
**I want to** rimuovere le dialog disclaimer e Telegram dal `HomeController`,
**so that** il flusso di primo avvio sia pulito e gestito interamente dall'onboarding.

**Acceptance Criteria:**
- [ ] `show_disclaimer_dialog.dart` — eliminato (crediti IZ8WNH integrati nella Card 1 dell'onboarding)
- [ ] `HomeState.showDisclaimer` — campo rimosso
- [ ] `needToShowDisclaimerProvider` e `setDisclaimerSeenProvider` — eliminati
- [ ] `HomeState.showTelegram` — rinominato in `showTelegramRePrompt`
- [ ] `needToShowTelegramInviteProvider` — aggiornato: ritorna `true` solo se l'utente ha completato l'onboarding, ha scelto "Forse dopo", e sono passati 7+ giorni
- [ ] `show_telegram_invite_dialog.dart` — mantenuto, usato solo per il re-prompt Day 7
- [ ] Il blocco `useMemoized` in `home_page.dart` mostra solo la Telegram re-prompt dialog (non piu disclaimer)
- [ ] Il delay di 2 secondi prima delle dialog viene rimosso per il primo avvio (nessuna dialog)

### Edge Cases & Constraints

| Scenario | Behavior |
|----------|----------|
| User kills app mid-onboarding | Resume from last completed step on next open |
| User denies location, then grants later in settings | Nearest repeater feature activates on next app open |
| No internet during onboarding | Show welcome screens (offline), skip first-discovery and Telegram steps, proceed to dashboard |
| Anonymous user (no sign-in) | Flusso completo: welcome screens → location → profile setup (salvato in locale) → first discovery → Telegram → dashboard |
| User already completed onboarding (app update) | Do not re-show onboarding |
| Very slow connection | Timeout on nearest-repeater fetch after 5s, show fallback CTA |
| POTA API unreachable | Hide POTA section in discovery screen, show only nearest repeater |
| No active POTA spots at time of onboarding | Hide POTA section, full space to repeater card |
| User taps Telegram link but doesn't actually join | Treat as "attempted" — do not re-prompt (we can't detect actual join) |
| User selected "Forse dopo" for Telegram | Re-prompt once after Day 7 via `HomeController` dialog |
| Telegram not installed on device | Link opens in browser (Telegram web preview) |
| Utente anonimo completa onboarding, poi si registra | Sync automatico: SharedPreferences → Supabase; skip post_login_onboarding |
| Utente si registra su nuovo device (ha gia profilo Supabase) | Dati Supabase prevalgono; SharedPreferences non sovrascrive |
| Utente completa onboarding, disinstalla e reinstalla (senza registrarsi) | SharedPreferences persi; onboarding mostrato di nuovo (comportamento atteso) |
| Utente cambia callsign nelle impostazioni dopo il sync | Modifica va direttamente su Supabase (flusso esistente invariato) |

---

## 8. Out of Scope

**Not included in this release:**

| Feature | Reason |
|---------|--------|
| Personalized onboarding by user type (different flows for licensed vs. SWL) | Validate single flow first; personalize in v2 |
| Interactive tutorial/tooltips on dashboard | Consider for v2 if activation is still low post-launch |
| Video walkthroughs | Resource-intensive; static cards sufficient for v1 |
| Onboarding A/B testing infrastructure | Instrument metrics first, test in future iteration |
| Dashboard redesign | This PRD covers only the flow *before* the dashboard |
| Onboarding for web/dashboard app | Mobile-only for now |
| In-app radio mode explanations (what is DMR, etc.) | Valuable but separate initiative |
| POTA park map layer in onboarding | Too complex for v1; users can discover via POTA spots page |
| SOTA / WWFF / GMA integration | Not yet implemented in app; POTA only for now |
| Telegram bot integration (auto-detect join) | Not feasible; rely on link-tap tracking |

**Future consideration (v2):**
- Personalized repeater recommendations based on user's radio and preferred modes
- "Complete your profile" nudges (add favorite modes, preferred networks)
- Tooltips on first dashboard visit explaining map elements
- Collect preferred radio modes during onboarding for personalization
- POTA favorites / alerts for specific parks or activators
- SOTA / WWFF / GMA integration (when supported by the app)

---

## 9. Dependencies & Risks

### Dependencies

| Dependency | Owner | Status | ETA |
|-----------|-------|--------|-----|
| Wireframes/mockups for welcome screens | Design | Not started | TBD |
| Illustrations for onboarding cards | Design | Not started | TBD |
| Analytics event tracking (baseline metrics) | Dev | Not started | Must complete *before* development |
| ~~Legal review: deferring disclaimer~~ | — | **Non necessario** | Crediti integrati nell'onboarding |

### Technical Dependencies
- **None blocking.** All required data (nearest repeater, user profile, POTA spots) is already available via existing Supabase queries, location service, and POTA API (`https://api.pota.app`).
- POTA datasource already implemented in `lib/src/features/pota/data/datasource/pota_api_datasource.dart`.
- Welcome screens use standard Flutter `PageView` — no new packages needed.
- SharedPreferences client already exists in `lib/clients/storage/`.
- Telegram deep link: standard `url_launcher` (already in project).

### Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Users skip all welcome screens | Medium | Low value education | Keep to 2-3 screens; make visually compelling; track skip rate |
| Location denied → no "first repeater" | Medium | Degraded first experience | Fallback: map CTA or popular repeaters in region |
| Longer onboarding → more drop-off | Medium | Fewer users reach dashboard | Track per-step completion; every step skippable |
| ~~Deferred disclaimer~~ | — | — | **Risolto:** crediti IZ8WNH nella Card 1, dialog eliminata |
| Onboarding state corruption (killed mid-flow) | Low | User stuck or re-shown screens | Persist completion per-step, not as single flag |
| POTA API down during onboarding | Low | No POTA card shown | Graceful fallback: hide POTA section, show repeater only |
| Telegram invite feels pushy | Low | User annoyance | "Forse dopo" is prominent; only one re-prompt at Day 7; never more |
| Telegram link opens browser (app not installed) | Medium | Friction to join | Telegram web preview is functional; acceptable for v1 |

---

## 10. Open Questions

| # | Question | Decision Owner | Status |
|---|----------|---------------|--------|
| 1 | What is the current Day-1 / Day-7 retention rate? | PM/Analytics | Needs baseline |
| 2 | ~~Is the disclaimer legally required on first open?~~ | — | **Risolto:** crediti IZ8WNH integrati nella Card 1 dell'onboarding; dialog eliminata |
| 3 | ~~Should anonymous users see the full onboarding or shortened version?~~ | — | **Risolto:** tutti vedono il flusso completo; profile setup salvato in locale (SharedPreferences) |
| 4 | Should we collect preferred radio modes during onboarding? | PM | Open (useful for v2 personalization) |
| 5 | Should welcome screens be skippable with a single "Skip All" or require swiping? | PM/Design | Open |
| 6 | What illustrations/graphics style for onboarding cards? | Design | Open |
| 7 | Should we show a "tour" option on subsequent opens for users who skipped? | PM | Open (v2 candidate) |
| 8 | Should the POTA card in onboarding link to the full spots list instead of a single spot? | PM/Design | Open |
| 9 | What is the current Telegram join rate from the existing popup? (baseline for comparison) | PM/Analytics | Needs baseline |
| 10 | Should the Telegram Day-7 re-prompt be a dialog or a subtle banner? | PM/Design | Open |

---

## Appendix: Files to Modify

| File/Directory | Change |
|---------------|--------|
| `lib/src/features/post_login_onboarding/` | Add welcome screens, location permission, first-discovery (repeater + POTA), Telegram invite |
| `lib/src/features/pota/data/datasource/pota_api_datasource.dart` | Reuse existing datasource for fetching active spots in onboarding |
| `lib/src/features/splashscreen/presentation/controller/splash_controller.dart` | Update navigation logic for new flow |
| `lib/src/features/home/presentation/home_page/home_page.dart` | Rimuovere disclaimer dialog; mantenere solo Telegram re-prompt (Day 7) per utenti "Forse dopo" |
| `lib/common/dialogs/show_disclaimer_dialog.dart` | **Eliminare** — crediti IZ8WNH integrati nell'onboarding Card 1 |
| `lib/src/features/home/provider/need_to_show_disclaimer/` | **Eliminare** — non piu necessario |
| `lib/src/features/home/provider/set_disclaimer_seen/` | **Eliminare** — non piu necessario |
| `lib/src/features/home/presentation/home_page/controller/state/home_state.dart` | Rimuovere `showDisclaimer`, rinominare `showTelegram` → `showTelegramRePrompt` |
| `lib/router/app_router.dart` | Add new onboarding routes |
| `lib/l10n/app_it.arb` | Add onboarding localization keys (welcome cards, POTA descriptions, Telegram invite copy) |
| `lib/clients/storage/` | Add onboarding completion flags + userType/callsign locale + Telegram invite response to SharedPreferences |
| `lib/src/features/post_login_onboarding/` (existing) | Aggiornare `checkNeedsPostLoginOnboarding`: skip se dati gia presenti (locale o Supabase) |
| `lib/src/features/authentication/` | Aggiungere sync provider: post sign-in legge SharedPreferences → scrive su Supabase se profilo incompleto |