import 'dart:developer';

import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/src/features/params/data/datasource/param_datasource.dart';
import 'package:hamqrg/src/features/params/data/model/param_model/param_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'param_supabase_datasource.g.dart';

class ParamSupabaseDatasource implements ParamDatasource {
  ParamSupabaseDatasource(this._client);
  final SupabaseClient _client;

  @override
  Future<List<ParamModel>> getAllParams() async {
    try {
      final data = await _client.from('params').select();
      return (data as List).map((e) => ParamModel.fromJson(e as Map<String, dynamic>)).toList();
    } catch (e) {
      log('Error to fetch params: $e');
      rethrow;
    }
  }

  @override
  Future<ParamModel?> getParamByKey(String key) async {
    try {
      final data = await _client.from('params').select().eq('key', key).maybeSingle();
      if (data == null) {
        return null;
      }
      return ParamModel.fromJson(Map<String, dynamic>.from(data));
    } catch (e) {
      log('Error to fetch param by key: $e');
      rethrow;
    }
  }
}

@riverpod
ParamDatasource paramSupabaseDatasource(Ref ref) {
  return ParamSupabaseDatasource(ref.read(supabaseClientProvider));
}
