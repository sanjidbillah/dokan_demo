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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // Stack(children: [
                    //   Container(
                    //       height: 60,
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(6),
                    //       )),
                    //   // TextFormField(
                    //   //   validator: (value) {
                    //   //     if (value == null || value.isEmpty) {
                    //   //       return 'Please enter some text';
                    //   //     }
                    //   //     return null;
                    //   //   },
                    //   //   obscureText: false,
                    //   //   keyboardType: TextInputType.name,
                    //   //   controller: _controller,
                    //   //   autocorrect: false,
                    //   //   decoration: InputDecoration(
                    //   //     hintText: 'Name',
                    //   //     border: InputBorder.none,
                    //   //     prefixIcon: SvgPicture.asset(
                    //   //       Assets.icons.accountInput,
                    //   //       height: 20.pt,
                    //   //       width: 20.pt,
                    //   //       fit: BoxFit.fill,
                    //   //     ).paddingAll(15),
                    //   //   ),
                    //   // ),
                    // ]),
                    PrimaryTextField(
                      controller: _controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      prefixIconPath: Assets.icons.accountInput,
                      hintText: "Name",
                    ).paddingOnly(bottom: 20.pt),
                    TextButton(
                        onPressed: () {
                          _formKey.currentState?.validate();
                        },
                        child: Text("hit"))
                  ],
                ),
              ),
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
