// import 'package:dalel/core/functions/navigation.dart';
// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/core/utils/app_text_styles.dart';
// import 'package:dalel/core/widgets/custom_btn.dart';
// import 'package:dalel/features/on_boarding/data/models/on_boarding_model.dart';
// import 'package:dalel/features/on_boarding/presentation/views/functions/on_boarding.dart';
// import 'package:flutter/material.dart';

// class GetButtons extends StatelessWidget {
//   const GetButtons(
//       {super.key, required this.currentIndex, required this.controller});
//   final int currentIndex;
//   final PageController controller;
//   @override
//   Widget build(BuildContext context) {
//     if (currentIndex == onBoardingData.length - 1) {
//       return Column(
//         children: [
//           CustomBtn(
//             text: AppStrings.createAccount,
//             onPressed: () {
//               onBoardingVisited();
//               customReplacementNavigate(context, "/signUp");
//             },
//           ),
//           const SizedBox(height: 16),
//           GestureDetector(
//             onTap: () {
//               onBoardingVisited();
//               customReplacementNavigate(context, "/signIn");
//             },
//             child: Text(
//               AppStrings.loginNow,
//               style: CustomTextStyles.poppins300style16.copyWith(
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ),
//         ],
//       );
//     } else {
//       return CustomBtn(
//         text: AppStrings.next,
//         onPressed: () {
//           controller.nextPage(
//             duration: const Duration(microseconds: 200),
//             curve: Curves.bounceIn,
//           );
//         },
//       );
//     }
//   }
// }
import 'package:daiel/core/funcation/navigation.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/core/widgets/custom_btn.dart';
import 'package:daiel/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:daiel/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:flutter/material.dart';

class CurrentIndex extends StatelessWidget {
  const CurrentIndex({super.key,required this.controller,required this.currentIndex});
  final int currentIndex;
  final PageController controller ;

  @override
  Widget build(BuildContext context) {
    return   currentIndex == onBoardingData.length -1 ?
                Column(
                  children: [
                    CustomBtn(text: AppStrings.createAccount, 
                     onPressed: (){ 
                      onBoardingVisited();
                      customReplacementNavigate(context, path: "/singUP");
                     
                                   },
                                   ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {
                        onBoardingVisited();
                        
                        customReplacementNavigate(context, path: "/singIn");
                      },
                      child: Text(AppStrings.loginNow,style: CustomTextStyles.poppins300style16.copyWith(fontWeight: FontWeight.w400),))
         
                  ],
                ):
                CustomBtn(text: AppStrings.next, 
               onPressed: (){
                controller.nextPage(duration: Duration(microseconds: 200), curve: Curves.bounceIn);
               },
               );
  }
}
