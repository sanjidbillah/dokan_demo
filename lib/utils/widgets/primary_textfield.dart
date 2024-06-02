import 'package:dokan_demo/utils/extensions/responsive_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../themes/theme_controller.dart';

class PrimaryTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? suffixIconPath;
  final String? prefixIconPath;
  final String hintText;
  final String? Function(String?)? validator;
  const PrimaryTextField({
    super.key,
    this.controller,
    this.suffixIconPath,
    this.prefixIconPath,
    required this.hintText,
    this.validator,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: ThemeController.defaultFieldHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              ThemeController.defaultFieldRadius,
            ),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(57, 90, 184, 0.1),
                  blurRadius: 4,
                  offset: Offset(
                    0,
                    3,
                  ))
            ],
          ),
        ),
        TextFormField(
          autocorrect: false,
          validator: widget.validator,
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
            suffixIcon: widget.suffixIconPath == null
                ? null
                : SvgPicture.asset(
                    widget.suffixIconPath!,
                    height: 20.pt,
                    width: 20.pt,
                    fit: BoxFit.fill,
                  ).paddingAll(15),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              vertical: 17.5.pt,
            ),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }
}
