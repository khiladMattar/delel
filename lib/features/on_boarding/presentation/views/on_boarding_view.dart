import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/widgets/custom_btn.dart';
import 'package:daiel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:daiel/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_text_style.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 40),
              CustomNavBar(onTap: () {  },),
              OnBoardingWidgetBody(),
               const CustomBtn(text: AppStrings.next,),
               const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}
