import 'dart:io';

import 'package:hamqrg/clients/supabase/supabase_client/supabase_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'images_provider.g.dart';

@riverpod
Future<String> uploadImage(
  Ref ref,
  String bucketName,
  File image,
  String filePath, {
  bool upsert = true,
}) async {
  final supabase = ref.read(supabaseClientProvider);
  final fullPath = await supabase.storage
      .from(bucketName)
      .upload(filePath, image, fileOptions: FileOptions(upsert: upsert));
  return fullPath;
}
