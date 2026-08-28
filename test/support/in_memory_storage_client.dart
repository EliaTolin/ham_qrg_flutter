import 'package:hamqrg/clients/storage/storage_client.dart';

/// Archivio chiave-valore in memoria, per i test che non devono dipendere da
/// SharedPreferences reali.
class InMemoryStorageClient implements StorageClient {
  final Map<String, String> _values = {};

  /// Quando true ogni scrittura fallisce: simula lo spazio esaurito.
  bool failWrites = false;

  @override
  Future<String?> read(String key) async => _values[key];

  @override
  Future<bool> write(String key, String value) async {
    if (failWrites) return false;
    _values[key] = value;
    return true;
  }

  @override
  Future<bool> delete(String key) async => _values.remove(key) != null;

  @override
  Future<List<String>> getAllKeys() async => _values.keys.toList();
}
