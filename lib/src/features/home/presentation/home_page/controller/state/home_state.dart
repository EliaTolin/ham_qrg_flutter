import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required bool showTelegramRePrompt,
    required bool needToExtraConfig,
  }) = _HomeState;
}
