import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/repeaters/data/repository/repeaters_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_repeater_submission_provider.g.dart';

@riverpod
Future<void> submitRepeaterSubmission(
  Ref ref, {
  required String name,
  required String callsign,
  required int frequencyHz,
  required List<Map<String, dynamic>> accesses,
  int? shiftHz,
  String? region,
  String? provinceCode,
  String? locality,
  double? lat,
  double? lon,
  String? locator,
  String? notes,
}) async {
  final userId = await ref.watch(getUserIdProvider.future);
  if (userId == null) {
    throw Exception('User not authenticated');
  }
  final repository = ref.read(repeatersRepositoryProvider);
  return repository.submitRepeaterSubmission(
    userId: userId,
    name: name,
    callsign: callsign,
    frequencyHz: frequencyHz,
    accesses: accesses,
    shiftHz: shiftHz,
    region: region,
    provinceCode: provinceCode,
    locality: locality,
    lat: lat,
    lon: lon,
    locator: locator,
    notes: notes,
  );
}
