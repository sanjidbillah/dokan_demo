import 'package:dokan_demo/modules/auth/controllers/auth_controller.dart';
import 'package:dokan_demo/modules/auth/data/data_source/auth_remote_source_impl.dart';
import 'package:dokan_demo/modules/auth/data/models/auth_payload.dart';
import 'package:dokan_demo/modules/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final AuthController _authController =
      AuthController(AuthRepositoryImpl(AuthRemoteSourceImpl()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                _authController.signIn(
                    AuthPayload(username: "test122", password: "test1234"));
              },
              child: Text("SignIn"))
        ],
      ),
    );
  }
}
