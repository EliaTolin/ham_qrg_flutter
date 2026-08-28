import 'package:freezed_annotation/freezed_annotation.dart';

part 'bulk_refresh_progress.freezed.dart';

/// Avanzamento dell'aggiornamento massivo (FR-053).
@freezed
abstract class BulkRefreshProgress with _$BulkRefreshProgress {
  const factory BulkRefreshProgress({
    required int total,
    @Default(0) int done,
    @Default(<String>[]) List<String> failedNames,
    @Default(false) bool cancelled,
  }) = _BulkRefreshProgress;

  const BulkRefreshProgress._();

  bool get isComplete => done >= total || cancelled;
  int get succeeded => done - failedNames.length;
}
