
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
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
      GlobalKey<FormState> forgotPasswordFormKey=GlobalKey();

   bool? isCheckedTramesAndCondation=false;
   


     addUserProfile()async {
      CollectionReference users = FirebaseFirestore.instance.collection('users');

      // Call the user's CollectionReference to add a new user
   await users .add({
            'email': emailAddress,
            'first_name': fristName, // John Doe
            'last_name': lastName, // Stokes and Sons
             // 42
          });
    }

  signUpwithEmailAndPassword() async {
    try {
    emit(SignupLoadingState());
    print('xxxxxx');
     UserCredential userCredential =
    await  FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailAddress!,
    password: password!,
  );
      await addUserProfile();
      await userCredential.user!.sendEmailVerification();

  emit(SignupSuccessState());
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    emit(SignupFailureState(errMessage: 'The password provided is too weak.'));
     print('ppppp');
  } else if (e.code == 'email-already-in-use') {
    emit(SignupFailureState(errMessage: 'The account already exists for that email.'));
     print('ccccc');
  }else {
        emit(SignupFailureState(errMessage: e.message.toString()));
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
    emailVerified() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

  }
  resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailAddress!,
      );
      emit(ResetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.message.toString()));
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }

  
  
}