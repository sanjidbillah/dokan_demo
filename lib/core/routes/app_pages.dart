import 'package:dokan_demo/checkpoint.dart';
import 'package:dokan_demo/modules/auth/views/sign_in/sign_in_screen.dart';
import 'package:dokan_demo/modules/auth/views/sign_up/sign_up_screen.dart';
import 'package:dokan_demo/modules/root/views/root_screen.dart';
import 'package:get/route_manager.dart';

import '../../modules/root/bindings/root_bindings.dart';
import 'app_routes.dart';

final List<GetPage> pages = [
  GetPage(
    name: Routes.checkpoint,
    page: () => const CheckPoint(),
  ),
  GetPage(
    name: Routes.signIn,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: Routes.signUp,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: Routes.root,
    page: () => RootScreen(),
    binding: RootBindings(),
  ),
];
