import 'package:daiel/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Daiel());
}

class Daiel extends StatelessWidget {
  const Daiel({super.key});

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
        child: Image.asset(Assets.assetsImagesOnBording1)
      ),
    ));
  }
}
