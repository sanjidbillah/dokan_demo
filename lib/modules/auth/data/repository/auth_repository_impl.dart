import 'package:dokan_demo/modules/auth/data/data_source/auth_remote_source.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';
import 'package:dokan_demo/modules/auth/data/repository/auth_repository.dart';

import '../models/auth_response_model.dart';
import '../models/auth_signin_res_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _authRemoteSource;
  AuthRepositoryImpl(this._authRemoteSource);
  @override
  Future<AuthSignInResModel?> signIn(AuthPayload authPayload) async {
    return await _authRemoteSource.signIn(authPayload);
  }

  @override
  Future<AuthResModel?> signUp(AuthPayload authPayload) async {
    return await _authRemoteSource.signUp(authPayload);
  }

  @override
  forget() {
    // TODO: implement forget
    throw UnimplementedError();
  }
}
