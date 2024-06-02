import 'package:dokan_demo/core/base/base_controller.dart';
import 'package:dokan_demo/core/routes/app_routes.dart';
import 'package:dokan_demo/core/services/dio_service.dart';
import 'package:dokan_demo/modules/auth/data/interfaces/auth_interface.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';
import 'package:dokan_demo/modules/auth/data/repository/auth_repository.dart';
import 'package:dokan_demo/utils/constants/keys.dart';
import 'package:dokan_demo/utils/widgets/loader.dart';
import 'package:get/get.dart';

import '../../../core/services/shared_pref_service.dart';

/// Controller for handling authentication logic.
/// Extends [BaseController] and implements [IAuthService].
class AuthController extends BaseController implements IAuthService {
  final AuthRepository _authRepository;

  /// Constructor for [AuthController], accepts an instance of [AuthRepository].
  AuthController(this._authRepository);

  /// Signs in a user with the provided [authPayload].
  /// Shows a loader during the process, and navigates to the root route upon success.
  /// Catches and handles any exceptions that occur during the sign-in process.
  @override
  Future<void> signIn(AuthPayload authPayload) async {
    try {
      // Show loader while signing in
      showLoader();

      // Call signIn method from AuthRepository with authPayload
      final signInRes = await _authRepository.signIn(authPayload);

      // Save token to SharedPreferences if successful
      await SharedPreferencesService.instance
          .setString(ProjectKeys.authKey, signInRes?.token);

      // Hide loader after successful sign in
      hideLoader();

      // Navigate to root route after successful sign in using GetX
      Get.offAllNamed(Routes.root);
    } catch (e) {
      // Set exception if any error occurs
      setException = e;

      // Show error message to user
      showErrorMsg();
    }
  }

  // Implementation of signUp method from IAuthService interface
  @override
  Future<void> signUp(AuthPayload authPayload) async {
    try {
      showLoader();
      // Call signUp method from AuthRepository with authPayload
      final signUpRes = await _authRepository.signUp(authPayload);
      hideLoader();
      // Check if signup response code is 200 (success)
      if (signUpRes?.code == 200) {
        // If signup is successful, call signIn method
        signIn(authPayload);
      }
    } catch (e) {
      // Set exception if any error occurs during signup
      setException = e;
      showErrorMsg();
    }
  }

  // Unimplemented method for forget password functionality
  @override
  Future<void> forget() {
    throw UnimplementedError();
  }

  Future checkLoginStatus() async {
    final token =
        await SharedPreferencesService.instance.getString(ProjectKeys.authKey);

    if (token == null) {
      Get.offAllNamed(Routes.signIn);
    } else {
      final isExpired = DioService.instance.isExpired(token);
      if (isExpired) {
        Get.offAllNamed(Routes.signIn);
      } else {
        Get.offAllNamed(Routes.root);
      }
    }
  }
}
