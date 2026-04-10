import 'package:freezed_annotation/freezed_annotation.dart';

part 'changelog_entry.freezed.dart';

enum ChangeCategory { added, improved, fixed }

@freezed
abstract class ChangelogChange with _$ChangelogChange {
  const factory ChangelogChange({
    required ChangeCategory category,
    required String description,
  }) = _ChangelogChange;
}

@freezed
abstract class ChangelogEntry with _$ChangelogEntry {
  const factory ChangelogEntry({
    required String version,
    required List<ChangelogChange> changes,
  }) = _ChangelogEntry;
}
