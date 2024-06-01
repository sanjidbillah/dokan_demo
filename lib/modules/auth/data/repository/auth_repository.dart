import '../models/auth_payload.dart';
import '../models/auth_response_model.dart';
import '../models/auth_signin_res_model.dart';

abstract class AuthRepository {
  Future<AuthSignInResModel?> signIn(AuthPayload payload);
  Future<AuthResModel?> signUp(AuthPayload payload);
  forget();
}
