import 'package:dokan_demo/core/base/base_controller.dart';
import 'package:dokan_demo/modules/auth/data/interfaces/auth_interface.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';
import 'package:dokan_demo/modules/auth/data/repository/auth_repository.dart';
import 'package:dokan_demo/utils/constants/keys.dart';

import '../../../core/services/shared_pref_service.dart';

class AuthController extends BaseController implements IAuthService {
  final AuthRepository _authRepository;
  AuthController(this._authRepository);
  @override
  Future<void> signIn(AuthPayload authPayload) async {
    try {
      final signInRes = await _authRepository.signIn(authPayload);
      SharedPreferencesService.instance
          .setString(ProjectKeys.authKey, signInRes?.token);
    } catch (e) {
      setException = e;
    }
  }

  @override
  Future<void> signUp(AuthPayload authPayload) async {
    try {
      final signUpRes = await _authRepository.signUp(authPayload);
      if (signUpRes?.code == 200) {
        signIn(authPayload);
      }
    } catch (e) {
      setException = e;
    }
  }

  @override
  Future<void> forget() {
    // TODO: implement forget
    throw UnimplementedError();
  }
}
