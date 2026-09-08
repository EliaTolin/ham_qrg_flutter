import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/changelog/domain/changelog_entry.dart';

/// Returns all changelog entries with localized descriptions.
List<ChangelogEntry> getChangelogEntries(AppLocalizations l10n) => [
      ChangelogEntry(
        version: '1.3.0',
        changes: [
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog130ImperialUnits,
          ),
        ],
      ),
      ChangelogEntry(
        version: '1.2.0',
        changes: [
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog120OfflineMode,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog120OfflineMaps,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog120CoverageSearch,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog120SavedStations,
          ),
          ChangelogChange(
            category: ChangeCategory.improved,
            description: l10n.changelog120SpotsRefresh,
          ),
          ChangelogChange(
            category: ChangeCategory.improved,
            description: l10n.changelog120NoNetwork,
          ),
        ],
      ),
      ChangelogEntry(
        version: '1.1.0',
        changes: [
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog110Coverage,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog110Reachable,
          ),
        ],
      ),
      ChangelogEntry(
        version: '1.0.20',
        changes: [
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog1020ClusterSpots,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog1020DetailTabs,
          ),
          ChangelogChange(
            category: ChangeCategory.improved,
            description: l10n.changelog1020TabletLayout,
          ),
        ],
      ),
      ChangelogEntry(
        version: '1.0.17',
        changes: [
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog1017PotaSpots,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog1017SubmitRepeater,
          ),
          ChangelogChange(
            category: ChangeCategory.added,
            description: l10n.changelog1017MultiLanguage,
          ),
          ChangelogChange(
            category: ChangeCategory.improved,
            description: l10n.changelog1017Onboarding,
          ),
          ChangelogChange(
            category: ChangeCategory.improved,
            description: l10n.changelog1017ReportAnonymous,
          ),
        ],
      ),
    ];

/// Returns only changelog entries with version > [lastSeenVersion].
/// If [lastSeenVersion] is null, returns an empty list (first install).
List<ChangelogEntry> getUnseenChangelogEntries({
  required List<ChangelogEntry> allEntries,
  required String? lastSeenVersion,
}) {
  if (lastSeenVersion == null) return [];
  return allEntries
      .where(
        (entry) => compareVersions(entry.version, lastSeenVersion) > 0,
      )
      .toList();
}
