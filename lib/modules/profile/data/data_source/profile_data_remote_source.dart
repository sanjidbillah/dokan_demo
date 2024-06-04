import 'package:dokan_demo/modules/profile/data/models/profile_update_payload.dart';

import '../models/profile_models.dart';

abstract class ProfileDataRemoteSource {
  Future<ProfileModel?> getProfile();
  Future<ProfileModel?> updateProfile(ProfileUpdatePayload payload);
}
