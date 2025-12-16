import 'package:daiel/core/utils/app_assets.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:daiel/features/on_boarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';

class OnBoardingWidgetBody extends StatelessWidget {
     OnBoardingWidgetBody({super.key,});
  // const OnBoardingWidgetBody({super.key, required this.controller, this.onPageChanged});
  // final PageController controller;
  // final Function(int)? onPageChanged;
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        itemCount: 3,
        controller: _controller,
       itemBuilder: (BuildContext context, int index) { 
        return Column(
            children: [
             Image.asset(Assets.assetsImagesOnBording1, ),
             const SizedBox(height: 24),
              CustomSmoothPageIndicator(controller: _controller),
              const SizedBox(height: 32),
              Text(
                onBoardingData[index].title,
                style: CustomTextStyles.poppins500style24 .copyWith(fontWeight: FontWeight.bold,fontSize: 20),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Text(
                onBoardingData[index].subTitle,
                style: CustomTextStyles.poppins300style16.copyWith(fontSize: 14),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
                          ],
          );
      },
     
    ));
  }

  // PageView pageView() {
  //   return PageView.builder(
  //     onPageChanged: onPageChanged,
  //     physics: const BouncingScrollPhysics(),
  //     controller: controller,
  //     itemCount: onBoardingData.length,
  //     itemBuilder: (context, index) {
  //       return Column(
  //         children: [
  //           Container(
  //             height: 290,
  //             width: 343,
  //             decoration: BoxDecoration(
  //               image: DecorationImage(
  //                 image: AssetImage(
  //                   onBoardingData[index].imagePath,
  //                 ),
  //                 fit: BoxFit.fill,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(height: 24),
  //           CustomSmoothPageIndicator(controller: controller),
  //           const SizedBox(height: 32),
  //           Text(
  //             onBoardingData[index].title,
  //             style: CustomTextStyles.poppins500style24
  //                 .copyWith(fontWeight: FontWeight.bold),
  //             textAlign: TextAlign.center,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //           const SizedBox(height: 16),
  //           Text(
  //             onBoardingData[index].subTitle,
  //             style: CustomTextStyles.poppins300style16,
  //             textAlign: TextAlign.center,
  //             maxLines: 2,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ],
  //       );
  //     },
  //   );}
  }

