/// Formattazione leggibile di dimensioni in byte (MB/GB).
abstract final class BytesFormatHelper {
  static const _mb = 1024 * 1024;
  static const _gb = _mb * 1024;

  static String format(int bytes) {
    if (bytes >= _gb) return '${(bytes / _gb).toStringAsFixed(1)} GB';
    return '${(bytes / _mb).toStringAsFixed(1)} MB';
  }
}
