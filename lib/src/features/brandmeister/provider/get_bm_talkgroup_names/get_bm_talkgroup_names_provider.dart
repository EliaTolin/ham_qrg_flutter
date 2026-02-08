import 'package:hamqrg/src/features/brandmeister/data/repository/brandmeister_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_bm_talkgroup_names_provider.g.dart';

/// Fetches the full BrandMeister talkgroup name registry: `{tgId: name}`.
@riverpod
Future<Map<String, String>> getBmTalkgroupNames(Ref ref) async {
  final repository = ref.read(brandmeisterRepositoryProvider);
  return repository.getTalkgroupNames();
}
