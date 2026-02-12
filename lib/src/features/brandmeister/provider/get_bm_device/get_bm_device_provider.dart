import 'package:hamqrg/src/features/brandmeister/data/repository/brandmeister_repository.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_device.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_bm_device_provider.g.dart';

@riverpod
Future<BmDevice> getBmDevice(Ref ref, int deviceId) async {
  final repository = ref.read(brandmeisterRepositoryProvider);
  return repository.getDevice(deviceId);
}
