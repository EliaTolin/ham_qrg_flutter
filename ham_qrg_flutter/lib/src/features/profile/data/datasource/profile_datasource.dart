import 'dart:io';

import 'package:hamqrg/src/features/profile/data/model/profile_model/profile_model.dart';

abstract interface class ProfileDatasource {
  Future<ProfileModel> getProfile(String userId);
  Future<void> updateProfile(ProfileModel user);
  Future<void> uploadPropics(String userId, File image);
  Future<String> getImagePropicUrl(String path);
  Future<void> deleteImagePropic(String userId);
}
