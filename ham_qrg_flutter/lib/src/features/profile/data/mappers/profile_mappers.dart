import 'package:hamqrg/common/abstracts/mapper.dart';
import 'package:hamqrg/common/extension/string_cleared_value_extension.dart';
import 'package:hamqrg/src/features/profile/data/model/profile_model/profile_model.dart';
import 'package:hamqrg/src/features/profile/domain/profile/profile.dart';

class ProfileMappers implements Mapper<Profile, ProfileModel> {
  @override
  Profile fromModel(ProfileModel user) {
    return Profile(
      id: user.id,
      name: user.firstName,
      surname: user.lastName,
      callsign: user.callsign,
      propic: user.propic.clearedValue(),
      userType: user.userType,
    );
  }

  @override
  ProfileModel toModel(Profile user) {
    return ProfileModel(
      id: user.id,
      firstName: user.name,
      lastName: user.surname,
      callsign: user.callsign,
      propic: user.propic.clearedValue(),
      userType: user.userType,
    );
  }
}
