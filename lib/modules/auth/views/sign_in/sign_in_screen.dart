import 'package:dokan_demo/gen/assets.gen.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                prefixIconPath: Assets.icons.email,
                hintText: "Email",
              ).paddingOnly(bottom: 20.pt),
              PrimaryTextField(
                prefixIconPath: Assets.icons.password,
                hintText: "Password",
              ).paddingOnly(bottom: 15.pt),
              const ForgotPassword(),
              const PrimaryButton(
                title: "Login",
              ).paddingOnly(bottom: 30.pt),
              const SocialSection(),
              const CreateNewAccountButton(),
            ],
          ).pAll,
        ),
      ),
    );
  }
}
