import 'package:json_annotation/json_annotation.dart';

/// User type enum matching database enum `public.user_type`
enum UserType {
  /// Short Wave Listener (non-licensed)
  @JsonValue('swl')
  swl,

  /// Licensed radio amateur
  @JsonValue('licensed')
  licensed,
}
