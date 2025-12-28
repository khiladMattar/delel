import 'package:daiel/core/cashe/cashe_helper.dart';
import 'package:daiel/core/funcation/navigation.dart';
import 'package:daiel/core/services/service_locator.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {
  @override
  void initState() {
    // TODO: implement initState
     bool isOnBoardingVisisted =
       getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;
    if (isOnBoardingVisisted == true) {
          DelagedNavigation(context, "/singUP");

    } else {
     DelagedNavigation(context, "/OnBoarding");
    }
    super.initState();
   // DelagedNavigation(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
    child: Text("Daiel",
    style: CustomTextStyles.pacifico400style64,),
    ),
    );
  }
}
 void DelagedNavigation(context,Path) {
     Future.delayed(const Duration(seconds: 3), () {
      customReplacementNavigate(context, path: Path);
      
    });
  }