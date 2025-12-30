import 'package:daiel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeTextWidget extends StatelessWidget {
  final String text;
  const WelcomeTextWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(text,style: CustomTextStyles.poppins600style28.copyWith(fontSize: 20),));
    
  }
}