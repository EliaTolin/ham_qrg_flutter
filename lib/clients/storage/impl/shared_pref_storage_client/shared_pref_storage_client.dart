import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_storage_client.g.dart';

class SharedPrefStorageClient implements StorageClient {
  SharedPrefStorageClient({required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Future<bool> delete(String key) async {
    return sharedPreferences.remove(key);
  }

  @override
  Future<String?> read(String key) async {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> write(String key, dynamic value) async {
    return sharedPreferences.setString(key, value);
  }

  @override
  Future<List<String>> getAllKeys() async {
    return sharedPreferences.getKeys().toList();
  }
}

@riverpod
Future<SharedPreferences> _sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}

@riverpod
Future<StorageClient> sharedPrefStorageClient(Ref ref) async {
  final sharedPreferences = await ref.watch(_sharedPreferencesProvider.future);
  return SharedPrefStorageClient(sharedPreferences: sharedPreferences);
}
