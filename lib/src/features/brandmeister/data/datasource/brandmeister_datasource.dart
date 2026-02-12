import 'package:hamqrg/src/features/brandmeister/data/model/bm_device_model.dart';
import 'package:hamqrg/src/features/brandmeister/data/model/bm_talkgroup_model.dart';

/// Abstract interface for BrandMeister API calls.
abstract interface class BrandmeisterDatasource {
  /// Fetches device info by BrandMeister repeater ID.
  Future<BmDeviceModel> getDevice(int deviceId);

  /// Fetches all static talkgroups for a device.
  Future<List<BmTalkgroupModel>> getDeviceTalkgroups(int deviceId);

  /// Fetches the full talkgroup name registry: `{tgId: name}`.
  Future<Map<String, String>> getTalkgroupNames();
}
