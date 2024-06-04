import 'package:dokan_demo/gen/assets.gen.dart';
import 'package:dokan_demo/modules/profile/views/components/profile_update_input.dart';
import 'package:dokan_demo/utils/extensions/padding_extension.dart';
import 'package:dokan_demo/utils/themes/theme_controller.dart';
import 'package:flutter/material.dart';

import 'left_icon_expanded.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          ThemeController.defaultFieldRadius,
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 3),
            color: Color.fromRGBO(77, 88, 119, 0.13),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        children: [
          LeftIconExpanded(
            iconPath: Assets.icons.accountInput,
            menuName: "Account",
            expandedWidget: const ProfileUpdateInput(),
          ),
          LeftIconExpanded(
            iconPath: Assets.icons.password,
            menuName: "Password",
          ),
          LeftIconExpanded(
            iconPath: Assets.icons.notification,
            menuName: "Notification",
          ),
          LeftIconExpanded(
            iconPath: Assets.icons.favourite,
            menuName: "Wishlist",
            haveDivider: false,
          ),
        ],
      ).pAll,
    ).pAll;
  }
}
