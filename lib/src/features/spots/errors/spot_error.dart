sealed class SpotError implements Exception {
  const SpotError(this.message);

  factory SpotError.fromCode(String code) {
    return switch (code) {
      'AUTH_REQUIRED' => const SpotErrorAuthRequired(),
      'CALLSIGN_REQUIRED' => const SpotErrorCallsignRequired(),
      'INVALID_DURATION' => const SpotErrorInvalidDuration(),
      'REPEATER_NOT_FOUND' => const SpotErrorRepeaterNotFound(),
      'INVALID_ACCESS' => const SpotErrorInvalidAccess(),
      'SPOT_NOT_FOUND' => const SpotErrorSpotNotFound(),
      'FORBIDDEN' => const SpotErrorForbidden(),
      'ALREADY_CLOSED' => const SpotErrorAlreadyClosed(),
      _ => SpotErrorUnknown(code),
    };
  }

  final String message;

  @override
  String toString() => 'SpotError: $message';
}

class SpotErrorAuthRequired extends SpotError {
  const SpotErrorAuthRequired() : super('AUTH_REQUIRED');
}

class SpotErrorCallsignRequired extends SpotError {
  const SpotErrorCallsignRequired() : super('CALLSIGN_REQUIRED');
}

class SpotErrorInvalidDuration extends SpotError {
  const SpotErrorInvalidDuration() : super('INVALID_DURATION');
}

class SpotErrorRepeaterNotFound extends SpotError {
  const SpotErrorRepeaterNotFound() : super('REPEATER_NOT_FOUND');
}

class SpotErrorInvalidAccess extends SpotError {
  const SpotErrorInvalidAccess() : super('INVALID_ACCESS');
}

class SpotErrorSpotNotFound extends SpotError {
  const SpotErrorSpotNotFound() : super('SPOT_NOT_FOUND');
}

class SpotErrorForbidden extends SpotError {
  const SpotErrorForbidden() : super('FORBIDDEN');
}

class SpotErrorAlreadyClosed extends SpotError {
  const SpotErrorAlreadyClosed() : super('ALREADY_CLOSED');
}

class SpotErrorUnknown extends SpotError {
  const SpotErrorUnknown(super.message);
}
