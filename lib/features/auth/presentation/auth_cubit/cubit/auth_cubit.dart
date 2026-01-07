
// ignore: depend_on_referenced_packages
import 'package:daiel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
   String?fristName;
   String? lastName;
   String? emailAddress;
   String ?password;
   bool isvasspiblePassword=true;
   GlobalKey<FormState> signUpFormKey=GlobalKey();
      GlobalKey<FormState> signinFormKey=GlobalKey();

   bool? isCheckedTramesAndCondation=false;
  signUpwithEmailAndPassword() async {
    try {
    emit(SignupLoadingState());
    print('xxxxxx');
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress!,
    password: password!,
  );
  emit(SignupSuccessState());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    emit(SignupFailureState(errMessage: 'The password provided is too weak.'));
     print('ppppp');
  } else if (e.code == 'email-already-in-use') {
    emit(SignupFailureState(errMessage: 'The account already exists for that email.'));
     print('ccccc');
  }else {
        emit(SignupFailureState(errMessage: 'Check your Information!'));
         print('bbbbb');
      }
} catch (e) {
  emit(SignupFailureState(errMessage: e.toString()));
  print('kkkkkk');
}
  }
  changeTermsAndConditionCheckBox({required bool newValue}) {
    isCheckedTramesAndCondation = newValue;
    emit(TermsAndConditionUpdateState());
  }
  changeVasoilePassword() {
    isvasspiblePassword = !isvasspiblePassword;
    emit(ObscurePasswordTextUpdateState());
  }

 Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailureState(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailureState(errMessage: 'Check your Email and password!'));
      }
    } catch (e) {
      emit(
        SigninFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }
}