import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';
import 'gen/colors.gen.dart';
import 'gen/fonts.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIF Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
        decoration: BoxDecoration(
          color: AppColors.gray410,
          image: DecorationImage(
            image: Assets.images.tif.provider(),
            fit: BoxFit.cover,
          ),
        ),
        child: const Text(
          'Hello World',
          style: TextStyle(
            fontFamily: Fonts.montserrat,
            color: AppColors.gray70,
          ),
        ),
      ),
    );
  }
}
