/// Lanciata dai datasource quando una chiamata remota viene corto-circuitata
/// perché il device è senza rete: fa scattare subito il fallback sulla cache
/// (strategia network-first) invece di attendere il timeout del socket.
class OfflineException implements Exception {
  const OfflineException();

  @override
  String toString() => 'OfflineException: device is offline';
}
