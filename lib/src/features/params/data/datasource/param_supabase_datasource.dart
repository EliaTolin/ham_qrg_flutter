import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/params/data/datasource/param_datasource.dart';
import 'package:hamqrg/src/features/params/data/model/param_model/param_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'param_supabase_datasource.g.dart';

class ParamSupabaseDatasource implements ParamDatasource {
  ParamSupabaseDatasource(this._client, this._talker);
  final SupabaseClient _client;
  final Talker _talker;

  void _logTiming(String method, Stopwatch sw, {String? extra}) {
    final ms = sw.elapsedMilliseconds;
    final emoji = ms < 200
        ? '🟢'
        : ms < 400
            ? '🟡'
            : '🔴';
    final detail = extra != null ? ' ($extra)' : '';
    _talker.log('$emoji [$method] ${ms}ms$detail');
  }

  @override
  Future<List<ParamModel>> getAllParams() async {
    final sw = Stopwatch()..start();
    try {
      final data = await _client.from('params').select();
      final results = (data as List)
          .map((e) => ParamModel.fromJson(e as Map<String, dynamic>))
          .toList();
      _logTiming('getAllParams', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getAllParams', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching params');
      rethrow;
    }
  }

  @override
  Future<ParamModel?> getParamByKey(String key) async {
    final sw = Stopwatch()..start();
    try {
      final data =
          await _client.from('params').select().eq('key', key).maybeSingle();

      _logTiming(
        'getParamByKey',
        sw,
        extra: data != null ? '✅ "$key"' : '⚠️ "$key" null',
      );

      if (data == null) {
        return null;
      }
      return ParamModel.fromJson(Map<String, dynamic>.from(data));
    } catch (error, stackTrace) {
      _logTiming('getParamByKey', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching param by key');
      rethrow;
    }
  }
}

@riverpod
ParamDatasource paramSupabaseDatasource(Ref ref) {
  return ParamSupabaseDatasource(
    ref.read(supabaseClientProvider),
    ref.read(talkerServiceProvider),
  );
}
