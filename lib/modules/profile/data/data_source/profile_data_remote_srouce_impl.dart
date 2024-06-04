import 'package:dokan_demo/core/services/dio_service.dart';

import '../models/profile_models.dart';
import 'profile_data_remote_source.dart';

class ProfileDataRemoteSourceImpl implements ProfileDataRemoteSource {
  final _profilePath = "wp/v2/users/me";
  _updateProfile(int id) => "wp/v2/users/$id";
  @override
  Future<ProfileModel?> getProfile() async {
    final res = await makeRequest(path: _profilePath, method: HTTPMethod.get);
    return ProfileModel.fromJson(res.data);
  }

  @override
  Future<ProfileModel?> updateProfile(payload) async {
    final res = await makeRequest(
      path: _updateProfile(payload.id!),
      method: HTTPMethod.post,
      data: payload.toJson(),
    );

    return ProfileModel.fromJson(res.data);
  }
}
