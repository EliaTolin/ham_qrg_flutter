import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'talker_service.g.dart';

@Riverpod(keepAlive: true)
Talker talkerService(Ref ref) {
  return TalkerFlutter.init();
}

@riverpod
TalkerDioLogger talkerDioLogger(Ref ref) {
  final talker = ref.watch(talkerServiceProvider);
  final talkerDioLogger = TalkerDioLogger(
    talker: talker,
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
    ),
  );
  return talkerDioLogger;
}
