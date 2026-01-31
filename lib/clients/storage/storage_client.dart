abstract class StorageClient {
  Future<String?> read(String key);
  Future<bool> write(String key, String value);
  Future<bool> delete(String key);
  Future<List<String>> getAllKeys();
}
