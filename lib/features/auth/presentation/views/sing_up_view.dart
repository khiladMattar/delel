import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/core/widgets/custom_btn.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:daiel/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:daiel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:daiel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [    
            SliverToBoxAdapter( child: SizedBox(height: 152,),),
            SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.welcome),),
            SliverToBoxAdapter( child: SizedBox(height: 16,),),
            SliverToBoxAdapter(child: CustomSignUpForm()),
            SliverToBoxAdapter( child: SizedBox(height: 16,),),
            SliverToBoxAdapter(child: HaveAnAccountWidget(text1: AppStrings.alreadyHaveAnAccount, text2: AppStrings.signIn,),),
            SliverToBoxAdapter( child: SizedBox(height: 16,),),

              ],
        ),
      ),
    );
  }
}

 