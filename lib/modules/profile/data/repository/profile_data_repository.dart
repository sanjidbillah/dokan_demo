import '../models/profile_models.dart';
import '../models/profile_update_payload.dart';

abstract class ProfileDataRepository {
  Future<ProfileModel?> getProfile();
  Future<ProfileModel?> updateProfile(ProfileUpdatePayload payload);
}
