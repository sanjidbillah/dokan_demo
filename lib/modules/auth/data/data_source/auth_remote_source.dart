import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';

import '../models/auth_response_model.dart';
import '../models/auth_signin_res_model.dart';

abstract class AuthRemoteSource {
  Future<AuthSignInResModel?> signIn(AuthPayload payload);
  Future<AuthResModel?> signUp(AuthPayload payload);
  forget();
}
