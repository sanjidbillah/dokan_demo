import 'package:dokan_demo/modules/profile/controllers/profile_controller.dart';
import 'package:dokan_demo/modules/profile/data/models/profile_update_payload.dart';
import 'package:dokan_demo/utils/widgets/primary_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/widgets/primary_button.dart';

class ProfileUpdateInput extends StatefulWidget {
  const ProfileUpdateInput({super.key});

  @override
  State<ProfileUpdateInput> createState() => _ProfileUpdateInputState();
}

class _ProfileUpdateInputState extends State<ProfileUpdateInput> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ProfileController _profileController = Get.find();

  @override
  void initState() {
    final profileInfo = _profileController.profileInfo?.value;
    if (profileInfo != null) {
      if (profileInfo.email != null) {
        _emailController.text = profileInfo.email!;
      }

      if (profileInfo.name != null) {
        _fullNameController.text = profileInfo.name!;
      }

      if (profileInfo.description != null) {
        _descriptionController.text = profileInfo.description!;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _fullNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryTextField(
          haveBorder: true,
          label: "Email",
          controller: _emailController,
          hintText: "example@test.com",
          height: 55,
        ).marginOnly(top: 20, bottom: 15),
        PrimaryTextField(
          controller: _fullNameController,
          haveBorder: true,
          label: "Full name",
          hintText: "Enter full name",
          height: 55,
        ).marginOnly(bottom: 15),
        PrimaryTextField(
          controller: _descriptionController,
          haveBorder: true,
          label: "Description",
          hintText: "Enter full name",
          height: 55,
        ).marginOnly(bottom: 20),
        Row(
          children: [
            Expanded(
              child: PrimaryButton(
                haveBorder: true,
                backgroundColor: Colors.white,
                title: "Cancel",
                titleColor: const Color(0xFF818995),
                onTap: () {
                  _profileController.isAccountMenuOpen.value = false;
                },
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: PrimaryButton(
                backgroundColor: const Color(0xFF1ABC9C),
                title: "Save",
                onTap: () {
                  if (_emailController.text.isEmail) {
                    _profileController.updateProfile(
                      ProfileUpdatePayload(
                        name: _fullNameController.text,
                        email: _emailController.text,
                        description: _descriptionController.text,
                      ),
                    );
                  } else {
                    Get.snackbar(
                      "Exception",
                      "Enter valid email",
                      colorText: Get.theme.colorScheme.error,
                    );
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
