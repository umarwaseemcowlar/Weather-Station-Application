import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStartingPoint extends StatelessWidget {
  const AppStartingPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
