import 'package:hamqrg/src/features/brandmeister/data/datasource/brandmeister_api_datasource.dart';
import 'package:hamqrg/src/features/brandmeister/data/datasource/brandmeister_datasource.dart';
import 'package:hamqrg/src/features/brandmeister/data/mappers/bm_mappers.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_device.dart';
import 'package:hamqrg/src/features/brandmeister/domain/bm_talkgroup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'brandmeister_repository.g.dart';

class BrandmeisterRepository {
  BrandmeisterRepository(this._datasource);

  final BrandmeisterDatasource _datasource;
  final _mapper = BmMappers();

  Future<BmDevice> getDevice(int deviceId) async {
    final model = await _datasource.getDevice(deviceId);
    return _mapper.deviceFromModel(model);
  }

  Future<List<BmTalkgroup>> getDeviceTalkgroups(int deviceId) async {
    final models = await _datasource.getDeviceTalkgroups(deviceId);
    return models.map(_mapper.talkgroupFromModel).toList();
  }

  Future<Map<String, String>> getTalkgroupNames() async {
    return _datasource.getTalkgroupNames();
  }
}

@riverpod
BrandmeisterRepository brandmeisterRepository(
  Ref ref,
) {
  final datasource = ref.read(brandmeisterDatasourceProvider);
  return BrandmeisterRepository(datasource);
}
