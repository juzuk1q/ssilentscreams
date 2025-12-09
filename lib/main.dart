import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'presentation/screen/welcome/splash.dart';
import 'core/theme/app_colors.dart';

// void main() => runApp(MyApp());
void main() => runApp(DevicePreview(builder: (context) => MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          child: SplashScreen(),
        ),
      ),
    );
  }
}
