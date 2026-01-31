import 'package:freezed_annotation/freezed_annotation.dart';

part 'received_notification.freezed.dart';

@freezed
abstract class ReceivedNotification with _$ReceivedNotification {
  const factory ReceivedNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
    String? imageUrl,
  }) = _ReceivedNotification;
}
