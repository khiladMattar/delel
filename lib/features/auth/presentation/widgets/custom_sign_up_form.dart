import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/widgets/custom_btn.dart';
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:daiel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          // showToast("Successfully,Check your email to verfiy your account");
          // customReplacementNavigate(context, "/signIn");
        } else if (state is SignupFailureState) {
          // showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        return Form(
      child: Column(
        children: [
          CustomTextFormField(labelText: AppStrings.fristName,onChanged: (firstname){
             BlocProvider.of<AuthCubit>(context).fristName=firstname;
          },),
          CustomTextFormField(labelText: AppStrings.lastName,onChanged: (lastname){
              BlocProvider.of<AuthCubit>(context).lastName=lastname;
          },),
          CustomTextFormField(labelText: AppStrings.emailAddress,onChanged: (email){
              BlocProvider.of<AuthCubit>(context).emailAddress=email;
          },),
          CustomTextFormField(labelText: AppStrings.password,obscureText: true,suffixIcon: Icon(Icons.visibility_off),
          onChanged: (password){
              BlocProvider.of<AuthCubit>(context).password=password;
          },),
          const TermsAndConditionWidget(),
          const SizedBox(height: 88,),
          CustomBtn(text: AppStrings.signUp,onPressed: () { 
            BlocProvider.of<AuthCubit>(context).signUpwithEmailAndPassword();
          },),
        ],
      ),
    );
      }
    );
    
    
   
  }
}