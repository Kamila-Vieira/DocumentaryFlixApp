import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:documentary_flix/modules/category/service/model/category_model.dart';
import 'package:documentary_flix/themes/colors.dart';
import 'package:documentary_flix/app_module.dart';

enum Menu { category, video }

class MenuNavigate extends StatelessWidget {
  final List<CategoryModel> categories;

  const MenuNavigate({
    super.key,
    required this.categories,
  });

  Widget customMenuButton(
      {required Function() onPressed, required IconData iconData}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: const CircleBorder(
            side: BorderSide.none,
          ),
        ),
        onPressed: onPressed,
        child: Icon(iconData, size: 30, color: ThemeColors.iconColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // MediaQuery.of(context).padding.bottom;
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            controller.isOpen ? controller.close() : controller.open();
          },
          icon: const Icon(Icons.add, size: 38, color: ThemeColors.iconColor),
          tooltip: 'Show menu',
        );
      },
      style: MenuStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.only(right: 12)),
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
      ),
      menuChildren: [
        customMenuButton(
          onPressed: () {
            Modular.to.navigate(
              AppModule.videoRoute,
              arguments: {'categories': categories},
            );
          },
          iconData: Icons.video_call,
        ),
        customMenuButton(
          onPressed: () {
            Modular.to.navigate(AppModule.categoryRoute);
          },
          iconData: Icons.category_outlined,
        )
      ],
    );
  }
}
