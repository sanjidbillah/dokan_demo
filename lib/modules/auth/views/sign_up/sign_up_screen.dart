import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/modules/auth/views/components/social_section.dart';
import 'package:dokan_demo/utils/extensions/padding_extension.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/widgets/primary_button.dart';
import 'package:dokan_demo/utils/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'components/already_have_account.dart';
import 'components/image_upload_section.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const ImageUploadSection().paddingOnly(bottom: 40),
              PrimaryTextField(
                prefixIconPath: Assets.icons.accountInput,
                hintText: "Name",
              ).paddingOnly(bottom: 20.pt),
              PrimaryTextField(
                prefixIconPath: Assets.icons.email,
                hintText: "Email",
              ).paddingOnly(bottom: 20.pt),
              PrimaryTextField(
                prefixIconPath: Assets.icons.password,
                hintText: "Password",
              ).paddingOnly(bottom: 20.pt),
              PrimaryTextField(
                prefixIconPath: Assets.icons.password,
                hintText: "Confirm Password",
              ).paddingOnly(bottom: 30.pt),
              const PrimaryButton(title: "Sign Up").paddingOnly(bottom: 30.pt),
              const SocialSection(),
              const AlreadyHaveAccount()
            ],
          ).pAll,
        ),
      )),
    );
  }
}
