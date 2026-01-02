import 'package:daiel/app/dalel_app.dart';
import 'package:daiel/core/cashe/cashe_helper.dart';
import 'package:daiel/core/funcation/check_state_changes.dart';
import 'package:daiel/core/services/service_locator.dart';
import 'package:daiel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( options: DefaultFirebaseOptions.currentPlatform);
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const Daiel());
  checkStateChanges();

}



