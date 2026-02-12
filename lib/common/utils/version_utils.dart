/// Utility per confrontare le versioni dell'app
/// Confronta versioni nel formato semantic versioning (es: "1.0.6")
int compareVersions(String version1, String version2) {
  final parts1 = version1.split('.').map(int.parse).toList();
  final parts2 = version2.split('.').map(int.parse).toList();

  // Normalizza le lunghezze aggiungendo zeri
  final maxLength =
      parts1.length > parts2.length ? parts1.length : parts2.length;
  while (parts1.length < maxLength) {
    parts1.add(0);
  }
  while (parts2.length < maxLength) {
    parts2.add(0);
  }

  for (var i = 0; i < maxLength; i++) {
    if (parts1[i] < parts2[i]) return -1;
    if (parts1[i] > parts2[i]) return 1;
  }
  return 0;
}

/// Verifica se la versione installata è minore della versione minima richiesta
bool isVersionOutdated(String installedVersion, String minVersion) {
  return compareVersions(installedVersion, minVersion) < 0;
}
