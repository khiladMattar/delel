import 'package:daiel/core/funcation/navigation.dart';
import 'package:daiel/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:daiel/features/on_boarding/presentation/views/widgets/custom_nav_bar.dart';
import 'package:daiel/features/on_boarding/presentation/views/widgets/get_buttons.dart';
import 'package:daiel/features/on_boarding/presentation/views/widgets/on_boarding_widget_body.dart';
import 'package:flutter/material.dart';

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
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 40),
              CustomNavBar(onTap: () {
                onBoardingVisited() ;
                customNavigate(context, "/singUP") ; 
                },),
              OnBoardingWidgetBody(controller: _controller, 
              onPageChanged: (index) {
                setState(() {
                   currentIndex = index;
                });
                 
                }),
               const SizedBox(height: 40),
              CurrentIndex(controller: _controller, currentIndex: currentIndex),
               const SizedBox(height: 17),
            ],
          ),
        ),
      ),
    );
  }
}

  