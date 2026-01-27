import 'package:hamqrg/src/features/splashscreen/data/datasource/splash_datasource.dart';
import 'package:hamqrg/src/features/splashscreen/data/datasource/splash_local_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_repository.g.dart';

class SplashRepository {
  SplashRepository(this.splashDatasource);
  SplashDatasource splashDatasource;

  Future<bool> hasSeenOnboarding() {
    return splashDatasource.hasSeenOnboarding();
  }

  Future<void> setOnboardingSeen() {
    return splashDatasource.setOnboardingSeen();
  }
}

@riverpod
Future<SplashRepository> splashRepository(Ref ref) async {
  final splashDatasource = await ref.watch(splashLocalDatasourceProvider.future);

  return SplashRepository(splashDatasource);
}
