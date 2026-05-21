import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:hamqrg/log/talker_service/talker_service.dart';
import 'package:hamqrg/src/features/user_reports/data/datasource/user_reports_datasource.dart';
import 'package:hamqrg/src/features/user_reports/data/model/user_report_model.dart';
import 'package:hamqrg/src/features/user_reports/data/model/user_submission_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

part 'user_reports_supabase_datasource.g.dart';

class UserReportsSupabaseDatasource implements UserReportsDatasource {
  UserReportsSupabaseDatasource(this._client, this._talker);
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
  Future<List<UserReportModel>> getUserReports(String userId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        _logTiming('getUserReports', sw, extra: '⚠️ empty userId');
        return [];
      }
      final data = await _client
          .from('repeater_reports')
          .select('*, repeater:repeaters(callsign, name)')
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final results = (data as List)
          .map(
            (e) => UserReportModel.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList();
      _logTiming('getUserReports', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getUserReports', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching user reports');
      rethrow;
    }
  }

  @override
  Future<List<UserSubmissionModel>> getUserSubmissions(String userId) async {
    final sw = Stopwatch()..start();
    try {
      if (userId.isEmpty) {
        _logTiming('getUserSubmissions', sw, extra: '⚠️ empty userId');
        return [];
      }
      final data = await _client
          .from('repeater_submissions')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);

      final results = (data as List)
          .map(
            (e) => UserSubmissionModel.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList();
      _logTiming('getUserSubmissions', sw, extra: '${results.length} results');
      return results;
    } catch (error, stackTrace) {
      _logTiming('getUserSubmissions', sw, extra: '❌ error');
      _talker.handle(error, stackTrace, 'Error fetching user submissions');
      rethrow;
    }
  }
}

@riverpod
UserReportsDatasource userReportsSupabaseDatasource(Ref ref) {
  return UserReportsSupabaseDatasource(
    ref.read(supabaseClientProvider),
    ref.read(talkerServiceProvider),
  );
}
