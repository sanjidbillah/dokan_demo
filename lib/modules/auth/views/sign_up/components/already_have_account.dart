import 'package:dokan_demo/modules/auth/views/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(() => const SignInScreen());
      },
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: Get.theme.primaryTextTheme.headlineMedium,
          children: const [
            TextSpan(
              text: "Login",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Color(0xFF2893E3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
