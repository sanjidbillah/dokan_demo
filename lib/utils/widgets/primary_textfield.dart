import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/utils/extensions/responsive_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../themes/theme_controller.dart';

class PrimaryTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final String? label;
  final bool haveBorder;
  final double? height;
  const PrimaryTextField({
    super.key,
    this.controller,
    this.suffixIconPath,
    this.prefixIconPath,
    required this.hintText,
    this.validator,
    this.label,
    this.obsecureText = false,
    this.haveBorder = false,
    this.height,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  late final ValueNotifier obsecureText =
      ValueNotifier<bool>(widget.obsecureText);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label ?? "N/A",
            style: const TextStyle(
              color: Color.fromRGBO(38, 50, 56, 1),
              fontWeight: FontWeight.w400,
            ),
          ).marginOnly(bottom: 5),
        Stack(
          children: [
            Container(
              height: widget.height ?? ThemeController.defaultFieldHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  ThemeController.defaultFieldRadius,
                ),
                border: widget.haveBorder
                    ? Border.all(
                        color: const Color.fromRGBO(38, 50, 56, 0.12),
                      )
                    : null,
                boxShadow: widget.haveBorder
                    ? []
                    : const [
                        BoxShadow(
                          color: Color.fromRGBO(57, 90, 184, 0.1),
                          blurRadius: 4,
                          offset: Offset(
                            0,
                            3,
                          ),
                        )
                      ],
              ),
            ),
            ValueListenableBuilder(
                valueListenable: obsecureText,
                builder: (_, value, __) {
                  return TextFormField(
                    autocorrect: false,
                    validator: widget.validator,
                    obscureText: value,
                    controller: widget.controller,
                    decoration: InputDecoration(
                      prefixIcon: widget.prefixIconPath == null
                          ? null
                          : SvgPicture.asset(
                              widget.prefixIconPath!,
                              height: 20.pt,
                              width: 20.pt,
                              fit: BoxFit.fill,
                            ).paddingAll(15),
                      suffixIcon: widget.obsecureText
                          ? InkWell(
                              onTap: () {
                                obsecureText.value = !obsecureText.value;
                              },
                              child: SvgPicture.asset(
                                value
                                    ? Assets.icons.eyeClose
                                    : Assets.icons.eyeOpen,
                                height: 20.pt,
                                width: 20.pt,
                                fit: BoxFit.fill,
                              ).paddingAll(15),
                            )
                          : widget.suffixIconPath == null
                              ? null
                              : SvgPicture.asset(
                                  widget.suffixIconPath!,
                                  height: 20.pt,
                                  width: 20.pt,
                                  fit: BoxFit.fill,
                                ).paddingAll(15),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: widget.height != null && widget.label != null
                            ? 13.5.pt
                            : 17.5.pt,
                        horizontal: widget.prefixIconPath == null ? 20.0 : 0.0,
                      ),
                      hintText: widget.hintText,
                    ),
                  );
                })
          ],
        ),
      ],
    );
  }
}
