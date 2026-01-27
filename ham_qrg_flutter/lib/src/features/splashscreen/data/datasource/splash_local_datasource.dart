import 'package:hamqrg/clients/storage/impl/shared_pref_storage_client/shared_pref_storage_client.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:hamqrg/src/features/splashscreen/data/datasource/splash_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_local_datasource.g.dart';

class SplashLocalDatasource implements SplashDatasource {
  SplashLocalDatasource(this.sharedPreferences);
  StorageClient sharedPreferences;
  @override
  Future<bool> hasSeenOnboarding() async {
    final value = await sharedPreferences.read('onboarding');
    return value != null;
  }

  @override
  Future<void> setOnboardingSeen() {
    return sharedPreferences.write('onboarding', 'done');
  }
}

@riverpod
Future<SplashDatasource> splashLocalDatasource(Ref ref) async {
  final sharedPreferences = await ref.watch(sharedPrefStorageClientProvider.future);
  return SplashLocalDatasource(sharedPreferences);
}
