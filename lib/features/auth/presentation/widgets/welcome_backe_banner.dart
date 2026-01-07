import 'package:daiel/core/utils/app_assets.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
       
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(child: Text( AppStrings.appName,
          style: CustomTextStyles.saira700style32,
          
          )),
          SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            SvgPicture.asset(Assets.assetsImagesVector1),
            SvgPicture.asset(Assets.assetsImagesVector2),

          ],)
        ],
      ),
    );
  }
}