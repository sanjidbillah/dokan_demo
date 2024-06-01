import 'package:dio/dio.dart';
import 'package:dokan_demo/core/services/dio_service.dart';
import 'package:dokan_demo/modules/auth/data/data_source/auth_remote_source.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_response_model.dart';

import '../models/auth_payload.dart';
import '../models/auth_signin_res_model.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final String _signInPath = "jwt-auth/v1/token";
  final String _signUpPath = "wp/v2/users/register";
  @override
  forget() {
    // TODO: implement forget
    throw UnimplementedError();
  }

  @override
  Future<AuthSignInResModel?> signIn(AuthPayload payload) async {
    Response res = await makeRequest(
      path: _signInPath,
      method: HTTPMethod.post,
      data: payload.toJson(),
    );
    return AuthSignInResModel.fromJson(res.data);
  }

  @override
  Future<AuthResModel?> signUp(AuthPayload payload) async {
    Response res = await makeRequest(
      path: _signUpPath,
      method: HTTPMethod.post,
      data: payload.toJson(),
    );
    return AuthResModel.fromJson(res.data);
  }
}
