import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hamqrg/clients/storage/storage_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_client.g.dart';

class SecureStorageClient implements StorageClient {
  SecureStorageClient({required this.storage});
  final FlutterSecureStorage storage;

  @override
  Future<bool> delete(String key) async {
    await storage.delete(key: key);
    return true;
  }

  @override
  Future<String?> read(String key) {
    return storage.read(key: key);
  }

  @override
  Future<bool> write(String key, dynamic value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  @override
  Future<List<String>> getAllKeys() async {
    return storage.readAll().then((value) => value.keys.toList());
  }
}

@riverpod
FlutterSecureStorage _flutterSecureStorage(Ref ref) {
  return const FlutterSecureStorage();
}

@riverpod
Future<StorageClient> secureStorageClient(Ref ref) async {
  final storage = ref.watch(_flutterSecureStorageProvider);
  return SecureStorageClient(storage: storage);
}
