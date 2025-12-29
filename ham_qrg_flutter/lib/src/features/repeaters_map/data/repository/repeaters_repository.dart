import 'package:ham_qrg/src/features/repeaters_map/data/datasource/repeaters_datasource.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/datasource/repeaters_supabase_datasource.dart';
import 'package:ham_qrg/src/features/repeaters_map/data/mappers/repeaters_mappers.dart';
import 'package:ham_qrg/src/features/repeaters_map/domain/repeater/repeater.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repeaters_repository.g.dart';

class RepeatersRepository {
  RepeatersRepository(this._datasource);
  final RepeatersDatasource _datasource;

  final _mapper = RepeatersMappers();

  Future<List<Repeater>> getRepeatersInBounds({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
    List<RepeaterMode>? modes,
  }) async {
    final data = await _datasource.getRepeatersInBounds(
      lat1: lat1,
      lon1: lon1,
      lat2: lat2,
      lon2: lon2,
      modes: _mapper.mapModesToValues(modes),
    );
    return data.map(_mapper.fromModel).toList();
  }

  Future<List<Repeater>> searchRepeaters({
    required String query,
    int limit = 100,
    List<RepeaterMode>? modes,
  }) async {
    final data = await _datasource.searchRepeaters(
      query: query,
      limit: limit,
      modes: _mapper.mapModesToValues(modes),
    );
    return data.map(_mapper.fromModel).toList();
  }
}

@riverpod
RepeatersRepository repeatersRepository(Ref ref) {
  final datasource = ref.read(repeatersSupabaseDatasourceProvider);
  return RepeatersRepository(datasource);
}
