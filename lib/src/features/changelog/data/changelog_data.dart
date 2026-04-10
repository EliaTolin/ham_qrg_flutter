import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/l10n/app_localizations.dart';
import 'package:hamqrg/src/features/changelog/domain/changelog_entry.dart';

/// Returns all changelog entries with localized descriptions.
List<ChangelogEntry> getChangelogEntries(AppLocalizations l10n) => [
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
