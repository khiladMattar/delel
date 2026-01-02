import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: AppStrings.iHaveAgreeToOur,
                  style: CustomTextStyles.poppins400style12.copyWith(fontSize: 9)),
              TextSpan(
                  text: AppStrings.termsAndCondition,
                  style: CustomTextStyles.poppins400style12.copyWith(fontSize: 9)
                      .copyWith(decoration: TextDecoration.underline)),
            ],
          ),
        ),
      ],
    );
  }
}