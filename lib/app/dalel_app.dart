import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/route/app_router.dart';
import 'package:flutter/material.dart';

class Daiel extends StatelessWidget {
  const Daiel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.offWhite,
        textSelectionTheme: TextSelectionThemeData(
      cursorColor:AppColors.grey,
    ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router
      );
  }
}