import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/home/data/datasource/home_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_local_datasource.g.dart';

class HomeLocalDatasource implements HomeDatasource {
  HomeLocalDatasource(this.sharedPreferences);
  final StorageClient sharedPreferences;

  @override
  Future<bool> isTelegramGroupMember() async {
    try {
      final value = await sharedPreferences.read('isTelegramGroupMember');
      if (value == null) {
        return false;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> setTelegramGroupMember() {
    return sharedPreferences.write('isTelegramGroupMember', 'true');
  }

  @override
  Future<DateTime?> getTelegramInviteLastShownDate() async {
    final date = await sharedPreferences.read('lastTelegramInviteDate');
    if (date == null) {
      return null;
    }
    return Future.value(DateTime.parse(date));
  }

  @override
  Future<void> setTelegramInviteLastShownDate(DateTime time) {
    return sharedPreferences.write(
      'lastTelegramInviteDate',
      time.toIso8601String(),
    );
  }
}

@riverpod
Future<HomeDatasource> homeLocalDatasource(Ref ref) async {
  final storageClient = await ref.watch(sharedPrefStorageClientProvider.future);
  return HomeLocalDatasource(storageClient);
}
