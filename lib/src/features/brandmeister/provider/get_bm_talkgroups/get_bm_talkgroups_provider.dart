import 'package:hamqrg/src/features/brandmeister/data/repository/brandmeister_repository.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_talkgroup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_bm_talkgroups_provider.g.dart';

@riverpod
Future<List<BmTalkgroup>> getBmTalkgroups(
  Ref ref,
  int deviceId,
) async {
  final repository = ref.read(brandmeisterRepositoryProvider);
  return repository.getDeviceTalkgroups(deviceId);
}
