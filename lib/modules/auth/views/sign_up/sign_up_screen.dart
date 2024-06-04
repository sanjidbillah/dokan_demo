import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/modules/auth/controllers/auth_controller.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';
import 'package:dokan_demo/modules/auth/views/components/social_section.dart';
import 'package:dokan_demo/utils/extensions/padding_extension.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/widgets/primary_button.dart';
import 'package:dokan_demo/utils/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/already_have_account.dart';
import 'components/image_upload_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const ImageUploadSection().paddingOnly(bottom: 40),
                PrimaryTextField(
                  controller: _nameController,
                  prefixIconPath: Assets.icons.accountInput,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ).paddingOnly(bottom: 20.pt),
                PrimaryTextField(
                  controller: _emailController,
                  prefixIconPath: Assets.icons.email,
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email!';
                    } else if (!value.isEmail) {
                      return 'Please enter valid email!';
                    }
                    return null;
                  },
                ).paddingOnly(bottom: 20.pt),
                PrimaryTextField(
                  controller: _passwordController,
                  prefixIconPath: Assets.icons.password,
                  hintText: "Password",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  obsecureText: true,
                ).paddingOnly(bottom: 20.pt),
                PrimaryTextField(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    } else if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      return 'Confirm Password is not matchin with password';
                    }
                    return null;
                  },
                  prefixIconPath: Assets.icons.password,
                  hintText: "Confirm Password",
                  obsecureText: true,
                ).paddingOnly(bottom: 30.pt),
                PrimaryButton(
                  title: "Sign Up",
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _authController.signUp(
                        AuthPayload(
                          username: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        ),
                      );
                    }
                  },
                ).paddingOnly(bottom: 30.pt),
                const SocialSection(),
                const AlreadyHaveAccount()
              ],
            ).pAll,
          ),
        ),
      )),
    );
  }
}
