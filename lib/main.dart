import 'package:daiel/core/cashe/cashe_helper.dart';
import 'package:daiel/core/services/service_locator.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/route/app_router.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const Daiel());
}

class Daiel extends StatelessWidget {
  const Daiel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.offWhite
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router
      );
  }
}
