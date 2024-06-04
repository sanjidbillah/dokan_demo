import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/modules/auth/controllers/auth_controller.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';
import 'package:dokan_demo/utils/extensions/padding_extension.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/primary_textfield.dart';
import '../components/social_section.dart';
import 'components/create_new_account.dart';
import 'components/forgot_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.images.brand,
                  width: 160.pt,
                  height: 50.pt,
                ).paddingOnly(bottom: 70.pt),
                Text(
                  "Sign In",
                  style: Get.theme.primaryTextTheme.headlineLarge,
                ).paddingOnly(
                  bottom: 20.pt,
                ),
                PrimaryTextField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email.';
                    } else if (!value.isEmail) {
                      return 'Please enter valid email.';
                    }
                    return null;
                  },
                  prefixIconPath: Assets.icons.email,
                  hintText: "Email",
                ).paddingOnly(bottom: 20.pt),
                PrimaryTextField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password.';
                    }
                    return null;
                  },
                  prefixIconPath: Assets.icons.password,
                  hintText: "Password",
                  obsecureText: true,
                ).paddingOnly(bottom: 15.pt),
                const ForgotPassword(),
                PrimaryButton(
                  onTap: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      authController.signIn(
                        AuthPayload(
                          username: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                  title: "Login",
                ).paddingOnly(bottom: 30.pt),
                const SocialSection(),
                const CreateNewAccountButton(),
              ],
            ).pAll,
          ),
        ),
      ),
    );
  }
}
