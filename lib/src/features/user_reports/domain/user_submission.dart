import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_submission.freezed.dart';

enum UserSubmissionStatus { pending, approved, rejected }

@freezed
abstract class UserSubmission with _$UserSubmission {
  const factory UserSubmission({
    required String id,
    required String? name,
    required String? callsign,
    required int frequencyHz,
    required UserSubmissionStatus status,
    required DateTime createdAt,
    String? coordinatorResponse,
    DateTime? respondedAt,
  }) = _UserSubmission;
}
