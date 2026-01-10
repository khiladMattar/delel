import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_forgot_password_form.dart';
import 'package:daiel/features/auth/presentation/widgets/forgot_password_image.dart';
import 'package:daiel/features/auth/presentation/widgets/forgot_password_sup_title.dart';
import 'package:daiel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) { return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 100)),
          SliverToBoxAdapter(
              child: WelcomeTextWidget(text: AppStrings.forgotPassword)),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgotPasswrodImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
        ],
      ),
    ); 
  }
}
