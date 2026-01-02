
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
   GlobalKey<FormState> signUpFormKey=GlobalKey();
   bool? isCheckedTramesAndCondation=false;
  signUpwithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress!,
    password: password!,
  );
  emit(SignupSuccessState());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    emit(SignupFailureState(errMessage: 'The password provided is too weak.'));
  } else if (e.code == 'email-already-in-use') {
    emit(SignupFailureState(errMessage: 'The account already exists for that email.'));
  }
} catch (e) {
  emit(SignupFailureState(errMessage: e.toString()));
}
  }
  changeTermsAndConditionCheckBox({required bool newValue}) {
    isCheckedTramesAndCondation = newValue;
    emit(TermsAndConditionUpdateState());
  }
}