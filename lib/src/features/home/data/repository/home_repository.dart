import 'package:hamqrg/src/features/home/data/datasource/home_datasource.dart';
import 'package:hamqrg/src/features/home/data/datasource/home_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

class HomeRepository {
  HomeRepository(this.dataSource);
  final HomeDatasource dataSource;

  Future<bool> needToShowTelegramInvite() async {
    final lastShownDate = await dataSource.getTelegramInviteLastShownDate();
    final isTelegramMember = await dataSource.isTelegramGroupMember();
    if (isTelegramMember) {
      return false;
    }
    if (lastShownDate == null) {
      return true;
    }
    final now = DateTime.now();
    final difference = now.difference(lastShownDate);
    return difference.inDays >= 31;
  }

  Future<void> setAlreadyInTelegramCommunity() {
    return dataSource.setTelegramGroupMember();
  }

  Future<void> setLastTelegramInviteShow() {
    return dataSource.setTelegramInviteLastShownDate(DateTime.now());
  }
}

@riverpod
Future<HomeRepository> homeRepository(Ref ref) async {
  final dataSource = await ref.watch(homeLocalDatasourceProvider.future);
  return HomeRepository(dataSource);
}
