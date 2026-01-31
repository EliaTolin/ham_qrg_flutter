import 'dart:io';

import 'package:hamqrg/src/features/authentication/provider/get_user_id/get_user_id_provider.dart';
import 'package:hamqrg/src/features/profile/data/repository/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_propics_provider.g.dart';

@riverpod
Future<void> uploadPropics(Ref ref, File image) async {
  final repository = await ref.read(profileRepositoryProvider.future);
  final userId = await ref.read(getUserIdProvider.future);
  await repository.uploadPropics(userId!, image);
}
