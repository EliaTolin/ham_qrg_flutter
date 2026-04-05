# Feature Specification: PRO Subscription with Adapty

**Feature Branch**: `001-pro-subscription`
**Created**: 2026-04-05
**Status**: Draft
**Input**: User description: "Creare la versione a pagamento dell'app con Adapty. Logbook è PRO. Cluster NON è a pagamento. Nessun blocco per utenti free. Valutare lifetime."

## User Scenarios & Testing *(mandatory)*

### User Story 1 - Free User Discovers PRO Features (Priority: P1)

A free user browses the app normally (map, list, favorites, cluster, community).
When they encounter a PRO-only feature (e.g., Logbook, Offline Mode), they see
a clear but non-intrusive indicator that this is a PRO feature. Tapping it opens
a paywall screen showing subscription options. The user can dismiss the paywall
and continue using the app without interruption.

**Why this priority**: The free experience MUST remain fully functional. No
feature gating should degrade the core app. This is the foundation of the
monetization model.

**Independent Test**: A free user can navigate the entire app, see PRO badges
on locked features, open and dismiss the paywall, and continue using all free
features without friction.

**Acceptance Scenarios**:

1. **Given** a free user on the dashboard, **When** they tap a PRO feature
   (e.g., Logbook tab), **Then** a paywall screen is displayed with
   subscription options (monthly, annual, lifetime).
2. **Given** a free user viewing the paywall, **When** they dismiss it,
   **Then** they return to the previous screen with no loss of state.
3. **Given** a free user browsing the app, **When** they use any free feature
   (map, list, favorites, cluster, search, feedback), **Then** no paywall
   or PRO prompt is shown.
4. **Given** a free user on the repeater detail page, **When** they see PRO
   sections (RF coverage, link budget), **Then** a compact PRO badge is
   shown with a "Unlock" button, but free sections remain fully visible.

---

### User Story 2 - User Subscribes to PRO (Priority: P1)

A user decides to subscribe. They choose a plan (monthly, annual, or lifetime)
from the paywall. The purchase is processed via the platform store (App Store /
Google Play) through Adapty. Upon successful purchase, all PRO features unlock
immediately without requiring an app restart.

**Why this priority**: The purchase flow is the revenue-critical path. It must
work flawlessly on both platforms.

**Independent Test**: Complete a subscription purchase on iOS and Android,
verify PRO features unlock instantly.

**Acceptance Scenarios**:

1. **Given** a free user on the paywall, **When** they select a monthly plan
   and complete the purchase, **Then** the paywall closes and all PRO features
   become accessible.
2. **Given** a user who just subscribed, **When** they navigate to the Logbook,
   **Then** they can create and view QSO entries.
3. **Given** a user who purchased on device A, **When** they log in on
   device B, **Then** their PRO status is recognized via Adapty and features
   unlock.
4. **Given** a user selecting the lifetime plan, **When** the purchase
   completes, **Then** PRO access is permanent with no renewal.

---

### User Story 3 - PRO User Accesses Logbook (Priority: P2)

A PRO user opens the Logbook section. They can create QSO log entries, view
their log history with filters, and auto-fill QSO data from the repeater
detail page. Advanced logbook features include ADIF export and statistics.

**Why this priority**: Logbook is the confirmed flagship PRO feature and the
primary value proposition for subscription.

**Independent Test**: A PRO user can create, view, filter, and export QSO logs.

**Acceptance Scenarios**:

1. **Given** a PRO user, **When** they open the Logbook, **Then** they see
   their QSO history with search and filter capabilities.
2. **Given** a PRO user on a repeater detail page, **When** they tap
   "Log QSO", **Then** a form opens pre-filled with repeater frequency,
   mode, CTCSS tones, and network info.
3. **Given** a PRO user with logged QSOs, **When** they tap "Export ADIF",
   **Then** a valid ADIF file is generated and shared via the system share
   sheet.
4. **Given** a PRO user, **When** they view Logbook statistics, **Then**
   they see QSO counts by mode, band, and time period.

---

### User Story 4 - PRO User Uses Offline Mode (Priority: P3)

A PRO user downloads repeater data and map tiles for offline use before going
to a field location. While offline, they can browse the map, view repeater
details, and access their logbook.

**Why this priority**: Offline mode has significant infrastructure cost
(storage, sync) and is most valuable for field operators who are a committed
PRO audience.

**Independent Test**: Download data while online, enable airplane mode,
verify map/list/detail/logbook still function.

**Acceptance Scenarios**:

1. **Given** a PRO user online, **When** they tap "Download for Offline",
   **Then** repeater data and map tiles for the selected region are saved
   locally with a progress indicator.
2. **Given** a PRO user offline, **When** they browse the map, **Then**
   downloaded regions display correctly with repeater markers.
3. **Given** a PRO user offline, **When** they open a downloaded repeater
   detail, **Then** all cached data is displayed.
4. **Given** a PRO user who was offline, **When** connectivity returns,
   **Then** local data syncs with the server automatically.

---

### User Story 5 - PRO User Accesses Advanced RF Tools (Priority: P3)

A PRO user on a repeater detail page accesses advanced RF analysis tools:
estimated RF coverage map, link budget calculator with Fresnel zone clearance,
and radio horizon overlay.

**Why this priority**: These are niche, technically advanced features that
appeal to serious operators — the ideal PRO audience.

**Independent Test**: View RF coverage, link budget, and radio horizon for
a known repeater and verify calculations match expected values.

**Acceptance Scenarios**:

1. **Given** a PRO user on a repeater detail page, **When** they open
   "RF Coverage", **Then** an estimated coverage map overlay is displayed.
2. **Given** a PRO user on a repeater detail page, **When** they open
   "Link Budget", **Then** they see FSPL, Fresnel clearance, and a
   signal strength verdict (green/yellow/red) with an adjustable TX power
   slider.
3. **Given** a PRO user on a repeater detail page, **When** they open
   "Radio Horizon", **Then** they see the theoretical radio horizon in km
   overlaid on the mini-map with a comparison to their current distance.

---

### Edge Cases

- What happens when a subscription expires mid-session? PRO features
  become locked at next app launch; no mid-session disruption.
- What happens if a purchase fails (network error, declined payment)?
  Clear error message displayed; user can retry or dismiss.
- What happens if Adapty SDK is unreachable? App falls back to cached
  entitlement status; free features remain fully functional.
- What happens when a user restores purchases on a new device? Adapty
  handles restore; PRO status is recovered.
- What happens to offline data if a user downgrades from PRO? Downloaded
  data remains accessible read-only for 30 days, then is purged.
- What happens if an anonymous user tries to purchase? They MUST be
  prompted to create an account first (existing auth gate pattern).

## Requirements *(mandatory)*

### Functional Requirements

- **FR-001**: System MUST integrate Adapty SDK for subscription management
  on both iOS and Android.
- **FR-002**: System MUST offer three subscription tiers: monthly, annual,
  and lifetime.
- **FR-003**: System MUST NOT block, limit, or degrade any existing free
  feature (map, list, favorites, search, cluster, feedback, community,
  compass, meteo, propagation index).
- **FR-004**: System MUST display a non-intrusive PRO badge on locked
  features without hiding surrounding free content.
- **FR-005**: System MUST unlock PRO features immediately upon successful
  purchase without requiring app restart.
- **FR-006**: System MUST sync subscription status across devices via
  Adapty user profiles linked to the app's authentication system.
- **FR-007**: System MUST support purchase restoration (Restore Purchases
  button on the paywall).
- **FR-008**: System MUST cache entitlement status locally to allow PRO
  feature access during brief connectivity losses.
- **FR-009**: System MUST provide a Logbook feature for PRO users with
  QSO creation, list view, filters, ADIF export, and statistics.
- **FR-010**: System MUST provide Offline Mode for PRO users with
  repeater data download, offline map tiles, and background sync.
- **FR-011**: System MUST provide advanced RF tools (coverage estimation,
  link budget, radio horizon) as PRO features on the repeater detail page.
- **FR-012**: System MUST display subscription management options in the
  user profile/settings page (current plan, renewal date, cancel link).
- **FR-013**: System MUST handle subscription expiration gracefully —
  lock PRO features at next app launch, not mid-session.
- **FR-014**: Push notifications (repeater status changes, new repeaters
  in area) MUST be a PRO feature.
- **FR-015**: Home screen widget (nearest repeater) MUST be a PRO feature.

### Key Entities

- **Subscription**: User reference, plan tier (monthly/annual/lifetime),
  status (active/expired/cancelled), Adapty profile ID, platform
  (iOS/Android), start date, expiry date.
- **QSOLog**: User reference, repeater reference, date/time, frequency,
  mode, callsign worked, RST sent/received, notes, CTCSS/DCS tones,
  network info.
- **OfflineRegion**: User reference, geographic bounds, download date,
  data version, size, sync status.

## Success Criteria *(mandatory)*

### Measurable Outcomes

- **SC-001**: Free users can complete all existing app workflows
  (browse map, view repeater detail, manage favorites, submit feedback)
  with zero PRO-related interruptions or blockers.
- **SC-002**: Users can complete a subscription purchase in under
  60 seconds from tapping a PRO feature to having it unlocked.
- **SC-003**: PRO features unlock on all user devices within 30 seconds
  of purchase completion.
- **SC-004**: PRO users can log a QSO entry in under 30 seconds when
  starting from a repeater detail page (auto-fill flow).
- **SC-005**: Offline mode allows PRO users to browse previously
  downloaded repeaters and map tiles with no connectivity for at
  least 24 hours without data loss.
- **SC-006**: The app starts and loads correctly even when Adapty
  services are unreachable, with all free features fully functional.
- **SC-007**: Subscription conversion rate tracking is in place
  (paywall views, purchase starts, purchase completions) via Adapty
  analytics.

## Assumptions

- Adapty SDK supports both iOS and Android with Flutter plugin
  (`adapty_flutter`).
- App Store and Google Play review processes will approve the
  subscription model (no regulatory blockers expected for utility apps).
- Existing Supabase authentication (Google, Apple, Anonymous) will be
  linked to Adapty user profiles; anonymous users will be prompted to
  create an account before purchasing.
- Pricing tiers will be set in the App Store Connect / Google Play
  Console and managed via Adapty dashboard — not hardcoded in the app.
- Lifetime purchase is a one-time payment with no expiry, handled as
  a non-consumable IAP through Adapty.
- ADIF export follows the ADIF 3.1.x standard format.
- Offline map tiles use Mapbox's OfflineManager API with region-based
  downloads.

## PRO Feature Summary

| Feature                        | Free | PRO |
| ------------------------------ | ---- | --- |
| Map, list, search, filters     | Yes  | Yes |
| Favorites                      | Yes  | Yes |
| Repeater detail (basic)        | Yes  | Yes |
| Community feedback & reports   | Yes  | Yes |
| DX Cluster                     | Yes  | Yes |
| Meteo at site                  | Yes  | Yes |
| Compass & bearing              | Yes  | Yes |
| Propagation index              | Yes  | Yes |
| Sunrise/sunset                 | Yes  | Yes |
| **Logbook QSO**                | No   | Yes |
| **ADIF Export**                 | No   | Yes |
| **Logbook Statistics**         | No   | Yes |
| **Offline Mode**               | No   | Yes |
| **RF Coverage Estimation**     | No   | Yes |
| **Link Budget Calculator**     | No   | Yes |
| **Radio Horizon Overlay**      | No   | Yes |
| **Push Notifications**         | No   | Yes |
| **Home Screen Widget**         | No   | Yes |
| **Apple Watch Complication**   | No   | Yes |
