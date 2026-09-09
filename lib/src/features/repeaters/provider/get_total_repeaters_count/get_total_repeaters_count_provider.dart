import 'package:hamqrg/common/provider/keep_alive_for_ref.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_total_repeaters_count_provider.g.dart';

@riverpod
Future<int> getTotalRepeatersCount(Ref ref) async {
  ref.keepAliveFor(kHandoverKeepAlive);
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.getTotalRepeatersCount();
}
