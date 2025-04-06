import 'package:mypsy_app/shared/themes/app_colors.dart';
import 'package:mypsy_app/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';

class TopBarSubPage extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TopBarSubPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) => AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Container(
            color: Colors.transparent,
            width: 100,
            height: 40,
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.mypsyBlack,
              size: 15,
            ),
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          title,
          style: AppThemes.appbarSubPageTitleStyle,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: AppColors.mypsyBottomDivider,
            height: 1.0,
          ),
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
