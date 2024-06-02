import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadSection extends StatefulWidget {
  const ImageUploadSection({super.key});

  @override
  State<ImageUploadSection> createState() => _ImageUploadSectionState();
}

class _ImageUploadSectionState extends State<ImageUploadSection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pickerSelection();
      },
      child: Stack(
        children: [
          SizedBox(
            height: 125.pt,
            width: 125.pt,
          ),
          Container(
            height: 121.pt,
            width: 121.pt,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: ThemeController.defaultShadow,
            ),
            child: Center(
              child: SvgPicture.asset(Assets.icons.account),
            ),
          ),
          Positioned(
            bottom: 2.pt,
            right: 2.pt,
            child: Container(
              height: 34.pt,
              width: 34.pt,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(139, 47, 64, 0.25),
                    offset: Offset(0, 14),
                    blurRadius: 23,
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFF9472),
                    Color(0xFFF2709C),
                  ],
                ),
              ),
              child: Center(
                child: SvgPicture.asset(Assets.icons.camera),
              ),
            ),
          )
        ],
      ),
    );
  }

  pickerSelection() {
    Get.bottomSheet(Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: ThemeController.defaultPadding),
      child: Wrap(
        children: [
          Center(
            child: Text(
              "Add your image ",
              style: Get.theme.primaryTextTheme.headlineLarge,
            ),
          ).paddingOnly(top: 10, bottom: 10),
          Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  Get.back();
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                },
                child: Row(
                  children: [
                    const Icon(Icons.camera).paddingOnly(right: 5),
                    const Text("From camera"),
                  ],
                ),
              ).paddingOnly(bottom: 10),
              ElevatedButton(
                onPressed: () async {
                  Get.back();
                  final ImagePicker picker = ImagePicker();
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.gallery);
                },
                child: Row(
                  children: [
                    const Icon(Icons.collections).paddingOnly(right: 5),
                    const Text("From gallery"),
                  ],
                ),
              ).paddingOnly(
                bottom: 5,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
