import 'package:daiel/core/funcation/navigation.dart';
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
    super.initState();
    DelagedNavigation(context);
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
 void DelagedNavigation(context) {
     Future.delayed(const Duration(seconds: 3), () {
      customReplacementNavigate(context, path: "/OnBoarding");
      
    });
  }