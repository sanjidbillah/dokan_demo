import '../models/auth_payload.dart';

abstract class IAuthService {
  Future<void> signIn(AuthPayload authPayload);
  Future<void> signUp(AuthPayload authPayload);
  Future<void> forget();
}
