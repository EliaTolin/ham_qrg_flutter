class SotaApiException implements Exception {
  const SotaApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'SotaApiException($statusCode): $message';
}

class SotaSummitNotFound extends SotaApiException {
  const SotaSummitNotFound(this.summitCode)
      : super('Summit not found', statusCode: 404);

  final String summitCode;

  @override
  String toString() => 'SotaSummitNotFound: $summitCode';
}
