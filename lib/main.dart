import 'package:daiel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const daiel());
}

class daiel extends StatelessWidget {
  const daiel({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
     title: "daiel",
    home: Scaffold(
      appBar: AppBar(
        title: const Text("daiel"),
      ),
      body: Center(
        child: Image.asset(Assets.assetsImagesOnBording2)
      ),
    ));
  }
}
