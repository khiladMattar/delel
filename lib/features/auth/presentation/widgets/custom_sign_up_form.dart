import 'package:daiel/core/funcation/custom_toast.dart';
import 'package:daiel/core/funcation/navigation.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/widgets/custom_btn.dart';
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:daiel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showToast("Successfully,Check your email to verfiy your account");
          customReplacementNavigate(context, "/singIn");
        } else if (state is SignupFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit=BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
      child: Column(
        children: [
          CustomTextFormField(labelText: AppStrings.fristName,onChanged: (firstname){
             authCubit.fristName=firstname;
          },),
          CustomTextFormField(labelText: AppStrings.lastName,onChanged: (lastname){
              authCubit.lastName=lastname;
          },),
          CustomTextFormField(labelText: AppStrings.emailAddress,isEmail: true,onChanged: (email){
              authCubit.emailAddress=email;
          },),
          CustomTextFormField(labelText: AppStrings.password,obscureText: authCubit.isvasspiblePassword,
          
          suffixIcon:IconButton(onPressed:(){
             setState(() {
               authCubit.changeVasoilePassword();
             });
          } , icon: Icon(!authCubit.isvasspiblePassword ? Icons.visibility_off : Icons.visibility)),
          onChanged: (password){
              authCubit.password=password;
          },),
          const TermsAndConditionWidget(),
          const SizedBox(height: 88,),
          state is SignupLoadingState? CircularProgressIndicator(color: AppColors.primaryColor,):
          CustomBtn(color: !authCubit.isCheckedTramesAndCondation! ? AppColors.grey : null, 
          text: AppStrings.signUp,onPressed: () async{ 
            authCubit.isCheckedTramesAndCondation!?
            {
              if (authCubit.signUpFormKey.currentState!.validate()) {
               await authCubit.signUpwithEmailAndPassword(),
               
              }
            }
            :{
              showToast("Please agree to the terms and conditions")
              //  Fluttertoast.showToast(msg:"Please agree to the terms and conditions",
              //  toastLength: Toast.LENGTH_SHORT,
              //    gravity: ToastGravity.BOTTOM,)
               };
            
          },),
        ],
      ),
    );
      }
    );
    
    
   
  }
}