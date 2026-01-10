import 'package:daiel/core/funcation/custom_toast.dart';
import 'package:daiel/core/funcation/navigation.dart';
import 'package:daiel/core/utils/app_colors.dart';
import 'package:daiel/core/utils/app_string.dart';
import 'package:daiel/core/utils/app_text_style.dart';
import 'package:daiel/core/widgets/custom_btn.dart' show CustomBtn;
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:daiel/features/auth/presentation/widgets/custom_text_field.dart' show CustomTextFormField;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignInForm extends StatefulWidget {
  const CustomSignInForm({super.key});

  @override
  State<CustomSignInForm> createState() => _CustomSignInFormState();
}

class _CustomSignInFormState extends State<CustomSignInForm> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
            FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, "/home")
              : showToast("Please Verify Your Account");
        } else if (state is SigninFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit=BlocProvider.of<AuthCubit>(context);
    
    return Form(
      key: authCubit.signinFormKey,
      child: Padding(
        padding:  EdgeInsets.only(top: 40,left: 24,right: 24),
        child: Column(children: [
          CustomTextFormField(labelText: AppStrings.emailAddress,isEmail: true,
          onChanged: (email){ authCubit.emailAddress = email;},),
          
          CustomTextFormField(labelText: AppStrings.password,
           obscureText: authCubit.isvasspiblePassword,
          suffixIcon:IconButton(onPressed:(){
             setState(() {
               authCubit.changeVasoilePassword();
             });
          } , icon: Icon( authCubit.isvasspiblePassword?Icons.visibility_off:Icons.visibility)),
          onChanged: (password){ authCubit.password = password;},
          ),
          SizedBox(height: 16,),
           InkWell(
            onTap: () {
              customNavigate(context, "/forgotPassword");
            },
             child: Align(
              alignment: Alignment.centerRight,
              child: Text(AppStrings.forgotPassword,style: CustomTextStyles.poppins400style12,)),
           ),
                   SizedBox(height: 102,),

         state is SigninLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      onPressed: () async {
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          await authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: AppStrings.signIn),
                      SizedBox(height: 16,),
        ],),
      ),
  
    );
      },
    );
  }
}