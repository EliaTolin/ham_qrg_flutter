import 'package:freezed_annotation/freezed_annotation.dart';

part 'bm_talkgroup.freezed.dart';

@freezed
abstract class BmTalkgroup with _$BmTalkgroup {
  const factory BmTalkgroup({
    required int talkgroupId,
    required int slot,
    required int repeaterId,
  }) = _BmTalkgroup;
}
