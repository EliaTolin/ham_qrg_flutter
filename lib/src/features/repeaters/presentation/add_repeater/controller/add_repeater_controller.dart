import 'package:hamqrg/src/features/repeaters/domain/access/access_mode.dart';
import 'package:hamqrg/src/features/repeaters/presentation/add_repeater/controller/state/add_repeater_state.dart';
import 'package:hamqrg/src/features/repeaters/provider/submit_repeater_submission/submit_repeater_submission_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_repeater_controller.g.dart';

@riverpod
class AddRepeaterController extends _$AddRepeaterController {
  @override
  AddRepeaterState build() {
    return const AddRepeaterState();
  }

  void setName(String value) => state = state.copyWith(name: value);
  void setCallsign(String value) => state = state.copyWith(callsign: value);
  void setFrequency(String value) => state = state.copyWith(frequency: value);
  void setShift(String value) => state = state.copyWith(shift: value);
  void setRegion(String value) => state = state.copyWith(region: value);
  void setProvinceCode(String value) =>
      state = state.copyWith(provinceCode: value);
  void setLocality(String value) => state = state.copyWith(locality: value);
  void setLatitude(String value) => state = state.copyWith(latitude: value);
  void setLongitude(String value) => state = state.copyWith(longitude: value);
  void setLocator(String value) => state = state.copyWith(locator: value);
  void setNotes(String value) => state = state.copyWith(notes: value);
  void setConfirmed({required bool confirmed}) =>
      state = state.copyWith(isConfirmed: confirmed);

  void addAccess() {
    state = state.copyWith(
      accesses: [
        ...state.accesses,
        const SubmissionAccess(mode: AccessMode.analog),
      ],
    );
  }

  void removeAccess(int index) {
    final updated = [...state.accesses]..removeAt(index);
    state = state.copyWith(accesses: updated);
  }

  void updateAccessMode(int index, AccessMode mode) {
    final updated = [...state.accesses];
    updated[index] = SubmissionAccess(mode: mode);
    state = state.copyWith(accesses: updated);
  }

  void updateAccessField(int index, SubmissionAccess access) {
    final updated = [...state.accesses];
    updated[index] = access;
    state = state.copyWith(accesses: updated);
  }

  bool get hasNameOrCallsign =>
      state.name.trim().isNotEmpty || state.callsign.trim().isNotEmpty;

  int? _parseFrequencyHz() {
    final freqStr = state.frequency.trim().replaceAll(',', '.');
    final freq = double.tryParse(freqStr);
    if (freq == null || freq <= 0) return null;
    return (freq * 1e6).round();
  }

  int? _parseShiftHz() {
    final shiftStr = state.shift.trim().replaceAll(',', '.');
    if (shiftStr.isEmpty) return null;
    final shift = double.tryParse(shiftStr);
    if (shift == null) return null;
    return (shift * 1e6).round();
  }

  bool isFormValid() {
    if (!hasNameOrCallsign) return false;
    if (_parseFrequencyHz() == null) return false;
    if (state.accesses.isEmpty) return false;
    if (!state.isConfirmed) return false;
    return true;
  }

  List<Map<String, dynamic>> _buildAccessesJson() {
    return state.accesses.map((a) {
      final map = <String, dynamic>{
        'mode': a.mode.name.toUpperCase(),
      };

      switch (a.mode) {
        case AccessMode.analog:
          _addIfNotEmpty(map, 'ctcss_tx_hz', double.tryParse(a.ctcssTxHz));
          _addIfNotEmpty(map, 'ctcss_rx_hz', double.tryParse(a.ctcssRxHz));
          _addIfNotEmpty(map, 'dcs_code', int.tryParse(a.dcsCode));
        case AccessMode.dmr:
          _addIfNotEmpty(map, 'color_code', int.tryParse(a.colorCode));
          _addIfNotEmpty(map, 'talkgroup', int.tryParse(a.talkgroup));
          _addIfNotEmptyStr(map, 'network_name', a.networkName);
        case AccessMode.c4fm:
          _addIfNotEmpty(map, 'dg_id', int.tryParse(a.dgId));
          _addIfNotEmptyStr(map, 'network_name', a.networkName);
        case AccessMode.dstar:
          _addIfNotEmptyStr(map, 'network_name', a.networkName);
        case AccessMode.echolink ||
              AccessMode.svx ||
              AccessMode.allstar ||
              AccessMode.irlp ||
              AccessMode.p25:
          // Per il P25 `node_id` trasporta il NAC: il backend non ha una
          // colonna dedicata, a cambiare è solo l'etichetta nel form.
          _addIfNotEmpty(map, 'node_id', int.tryParse(a.nodeId));
          _addIfNotEmptyStr(map, 'network_name', a.networkName);
        case AccessMode.aprs ||
              AccessMode.beacon ||
              AccessMode.atv ||
              AccessMode.nxdn ||
              AccessMode.winlink:
          break;
      }

      _addIfNotEmptyStr(map, 'notes', a.notes);
      return map;
    }).toList();
  }

  void _addIfNotEmpty(Map<String, dynamic> map, String key, num? value) {
    if (value != null) map[key] = value;
  }

  void _addIfNotEmptyStr(Map<String, dynamic> map, String key, String value) {
    if (value.trim().isNotEmpty) map[key] = value.trim();
  }

  Future<bool> submit() async {
    if (!isFormValid()) return false;

    state = state.copyWith(isSubmitting: true);

    try {
      await ref.read(
        submitRepeaterSubmissionProvider(
          name: state.name.trim(),
          callsign: state.callsign.trim(),
          frequencyHz: _parseFrequencyHz()!,
          accesses: _buildAccessesJson(),
          shiftHz: _parseShiftHz(),
          region: state.region.trim().isEmpty ? null : state.region.trim(),
          provinceCode: state.provinceCode.trim().isEmpty
              ? null
              : state.provinceCode.trim(),
          locality:
              state.locality.trim().isEmpty ? null : state.locality.trim(),
          lat: double.tryParse(state.latitude.trim()),
          lon: double.tryParse(state.longitude.trim()),
          locator: state.locator.trim().isEmpty ? null : state.locator.trim(),
          notes: state.notes.trim().isEmpty ? null : state.notes.trim(),
        ).future,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isSubmitting: false);
      rethrow;
    }
  }
}
