import 'package:flutter/material.dart';
import 'package:ui_app/presentation/page/dribbble_design_01.dart';
import 'package:ui_app/presentation/page/main_screen.dart';
import 'package:ui_app/presentation/page/model_bottom.dart';
import 'package:ui_app/presentation/page/splash_screen.dart';
import 'package:ui_app/presentation/page/user_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Test App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/main': (context) => MainScreen(),
        '/user_info': (context) => UserInfoScreen(),
        '/model_bottom': (context) => ModelBottom(),
        '/dribbble_design_01': (context) => DribbbleDesign01(),
      },
    );
  }
}