class UpdateRequiredException implements Exception {
  UpdateRequiredException({
    required this.minVersion,
    required this.installedVersion,
  });

  final String minVersion;
  final String installedVersion;

  @override
  String toString() {
    return 'UpdateRequiredException: Versione installata ($installedVersion) è inferiore alla minima richiesta ($minVersion)';
  }
}
