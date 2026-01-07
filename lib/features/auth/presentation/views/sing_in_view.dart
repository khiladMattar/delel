import 'package:daiel/core/funcation/navigation.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_sign_in_form.dart';
import 'package:daiel/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:daiel/features/auth/presentation/widgets/welcome_backe_banner.dart';
import 'package:daiel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SingInView extends StatelessWidget {
  const SingInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:CustomScrollView(
        slivers: [    
          SliverToBoxAdapter( child: WelcomeBanner()),
          SliverToBoxAdapter( child: SizedBox(height: 30,)),
          SliverToBoxAdapter(child: WelcomeTextWidget(text: AppStrings.welcomeBack),),
          SliverToBoxAdapter(child: CustomSignInForm()),
          SliverToBoxAdapter(child: HaveAnAccountWidget(
              text1: AppStrings.dontHaveAnAccount, text2: AppStrings.signUp,
              onTap: (){
                 customReplacementNavigate(context, "/singUP");            }
              ),),
            SliverToBoxAdapter( child: SizedBox(height: 16,),),

            ],
      ),
    );
  }
}
