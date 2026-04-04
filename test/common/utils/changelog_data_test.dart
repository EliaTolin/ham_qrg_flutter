import 'package:flutter_test/flutter_test.dart';
import 'package:hamqrg/common/utils/version_utils.dart';
import 'package:hamqrg/src/features/changelog/data/changelog_data.dart';
import 'package:hamqrg/src/features/changelog/domain/changelog_entry.dart';

/// Replicates the filtering logic from _ChangelogTrigger in dashboard_page.dart
/// to test it in isolation without widget dependencies.
List<ChangelogEntry> getVisibleChangelog({
  required List<ChangelogEntry> allEntries,
  required String? lastSeenVersion,
  required String appVersion,
}) {
  // Filter entries for versions <= current app version
  final filtered = allEntries
      .where((e) => compareVersions(e.version, appVersion) <= 0)
      .toList();

  // If lastSeenVersion is null (existing user, column just added),
  // show all filtered entries
  if (lastSeenVersion == null) return filtered;

  return getUnseenChangelogEntries(
    allEntries: filtered,
    lastSeenVersion: lastSeenVersion,
  );
}

void main() {
  final testEntries = [
    const ChangelogEntry(
      version: '1.0.14',
      changes: [
        ChangelogChange(
          category: ChangeCategory.fixed,
          description: 'Bug fix v1.0.14',
        ),
      ],
    ),
    const ChangelogEntry(
      version: '1.0.15',
      changes: [
        ChangelogChange(
          category: ChangeCategory.added,
          description: 'Feature v1.0.15',
        ),
      ],
    ),
    const ChangelogEntry(
      version: '1.0.16',
      changes: [
        ChangelogChange(
          category: ChangeCategory.improved,
          description: 'Improvement v1.0.16',
        ),
      ],
    ),
    const ChangelogEntry(
      version: '1.0.17',
      changes: [
        ChangelogChange(
          category: ChangeCategory.added,
          description: 'Feature v1.0.17',
        ),
        ChangelogChange(
          category: ChangeCategory.fixed,
          description: 'Fix v1.0.17',
        ),
      ],
    ),
    const ChangelogEntry(
      version: '2.0.0',
      changes: [
        ChangelogChange(
          category: ChangeCategory.added,
          description: 'Major release',
        ),
      ],
    ),
  ];

  group('getUnseenChangelogEntries (raw)', () {
    test('returns empty list when lastSeenVersion is null (first install)', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: null,
      );
      expect(result, isEmpty);
    });

    test('returns entries with version greater than lastSeenVersion', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '1.0.15',
      );
      expect(result, hasLength(3));
      expect(result.map((e) => e.version), ['1.0.16', '1.0.17', '2.0.0']);
    });

    test('returns empty list when lastSeenVersion matches latest entry', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '2.0.0',
      );
      expect(result, isEmpty);
    });

    test('returns empty list when lastSeenVersion is ahead of all entries', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '3.0.0',
      );
      expect(result, isEmpty);
    });

    test('returns all entries when lastSeenVersion is before all entries', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '1.0.0',
      );
      expect(result, hasLength(5));
    });

    test('returns empty list when allEntries is empty', () {
      final result = getUnseenChangelogEntries(
        allEntries: [],
        lastSeenVersion: '1.0.0',
      );
      expect(result, isEmpty);
    });

    test('handles patch version correctly', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '1.0.16',
      );
      expect(result, hasLength(2));
      expect(result.map((e) => e.version), ['1.0.17', '2.0.0']);
    });

    test('handles major version jump correctly', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '1.0.17',
      );
      expect(result, hasLength(1));
      expect(result.first.version, '2.0.0');
    });

    test('preserves all changes within returned entries', () {
      final result = getUnseenChangelogEntries(
        allEntries: testEntries,
        lastSeenVersion: '1.0.16',
      );
      final v1017 = result.firstWhere((e) => e.version == '1.0.17');
      expect(v1017.changes, hasLength(2));
      expect(v1017.changes[0].category, ChangeCategory.added);
      expect(v1017.changes[1].category, ChangeCategory.fixed);
    });
  });

  group('getVisibleChangelog (full trigger logic)', () {
    // ──────────────────────────────────────────────────
    // Existing user, column just added (lastSeenVersion = null)
    // ──────────────────────────────────────────────────

    test(
      'existing user (null), app 1.0.16 — no entries shown '
      '(1.0.17 filtered out because > app version)',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: null,
          appVersion: '1.0.16',
        );
        // 1.0.17 and 2.0.0 are filtered out (> 1.0.16)
        // null → show all remaining: 1.0.14, 1.0.15, 1.0.16
        expect(result, hasLength(3));
        expect(
          result.map((e) => e.version).toList(),
          ['1.0.14', '1.0.15', '1.0.16'],
        );
      },
    );

    test(
      'existing user (null), upgrades to 1.0.17 — shows 1.0.17',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: null,
          appVersion: '1.0.17',
        );
        // null → show all entries <= 1.0.17
        expect(result, hasLength(4));
        expect(result.any((e) => e.version == '1.0.17'), isTrue);
      },
    );

    // ──────────────────────────────────────────────────
    // Existing user with lastSeenVersion already set
    // ──────────────────────────────────────────────────

    test(
      'user at 1.0.16, upgrades to 1.0.17 — shows only 1.0.17',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '1.0.16',
          appVersion: '1.0.17',
        );
        expect(result, hasLength(1));
        expect(result.first.version, '1.0.17');
      },
    );

    test(
      'user at 1.0.17, app 1.0.17 — already seen, nothing shown',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '1.0.17',
          appVersion: '1.0.17',
        );
        expect(result, isEmpty);
      },
    );

    test(
      'user at 1.0.16, app still 1.0.16 — no future entries shown',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '1.0.16',
          appVersion: '1.0.16',
        );
        expect(result, isEmpty);
      },
    );

    // ──────────────────────────────────────────────────
    // Major version jumps
    // ──────────────────────────────────────────────────

    test(
      'user at 1.0.15, upgrades to 2.0.0 — shows 1.0.16, 1.0.17, 2.0.0',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '1.0.15',
          appVersion: '2.0.0',
        );
        expect(result, hasLength(3));
        expect(
          result.map((e) => e.version).toList(),
          ['1.0.16', '1.0.17', '2.0.0'],
        );
      },
    );

    test(
      'user at 1.0.17, upgrades to 2.0.0 — shows only 2.0.0',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '1.0.17',
          appVersion: '2.0.0',
        );
        expect(result, hasLength(1));
        expect(result.first.version, '2.0.0');
      },
    );

    // ──────────────────────────────────────────────────
    // New installs
    // ──────────────────────────────────────────────────

    test(
      'brand new install at 1.0.17 (null) — shows all entries <= 1.0.17',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: null,
          appVersion: '1.0.17',
        );
        expect(result, hasLength(4));
        expect(result.map((e) => e.version).toList(), [
          '1.0.14',
          '1.0.15',
          '1.0.16',
          '1.0.17',
        ]);
      },
    );

    test(
      'new install at future 1.0.18 (null) — shows all entries <= 1.0.18',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: null,
          appVersion: '1.0.18',
        );
        // 2.0.0 is filtered out (> 1.0.18)
        expect(result, hasLength(4));
        expect(result.every((e) => e.version != '2.0.0'), isTrue);
      },
    );

    // ──────────────────────────────────────────────────
    // User already up to date, app bumps with no new entries
    // ──────────────────────────────────────────────────

    test(
      'user at 1.0.17, upgrades to 1.0.18 with no 1.0.18 entry — nothing',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '1.0.17',
          appVersion: '1.0.18',
        );
        // No entry for 1.0.18, and 2.0.0 > 1.0.18
        expect(result, isEmpty);
      },
    );

    // ──────────────────────────────────────────────────
    // Edge cases
    // ──────────────────────────────────────────────────

    test('empty changelog — never shows anything', () {
      final result = getVisibleChangelog(
        allEntries: [],
        lastSeenVersion: null,
        appVersion: '1.0.17',
      );
      expect(result, isEmpty);
    });

    test(
      'lastSeenVersion ahead of app version — nothing shown',
      () {
        // Shouldn't happen in practice, but be safe
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '3.0.0',
          appVersion: '1.0.17',
        );
        expect(result, isEmpty);
      },
    );

    test(
      'lastSeenVersion equals app version, all entries older — nothing',
      () {
        final result = getVisibleChangelog(
          allEntries: testEntries,
          lastSeenVersion: '2.0.0',
          appVersion: '2.0.0',
        );
        expect(result, isEmpty);
      },
    );
  });
}
