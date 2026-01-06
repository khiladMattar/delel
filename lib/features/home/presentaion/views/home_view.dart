import 'package:daiel/core/funcation/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: (){
          FirebaseAuth.instance.signOut();
          customNavigate(context, "/singIn");
        }, icon:  Icon(Icons.logout))],
      ),
      body: Center(child: Text("Home View")),
    );
  }
}