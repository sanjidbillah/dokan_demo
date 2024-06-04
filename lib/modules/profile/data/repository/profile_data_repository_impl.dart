import 'package:dokan_demo/modules/profile/data/data_source/profile_data_remote_source.dart';

import '../models/profile_models.dart';
import '../models/profile_update_payload.dart';
import 'profile_data_repository.dart';

class ProfileDataRepositoryImpl implements ProfileDataRepository {
  final ProfileDataRemoteSource _profileDataRemoteSource;
  ProfileDataRepositoryImpl(this._profileDataRemoteSource);
  @override
  Future<ProfileModel?> getProfile() async {
    return _profileDataRemoteSource.getProfile();
  }

  @override
  Future<ProfileModel?> updateProfile(ProfileUpdatePayload payload) {
    return _profileDataRemoteSource.updateProfile(payload);
  }
}
