import 'package:flutter/material.dart';
import 'package:islamiapp/home_screen.dart';
import 'package:islamiapp/introduction.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => IntroScreenDemo()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Image.asset(
          "assets/images/full_splash.png", // 👈 your full image
          fit: BoxFit.cover, // ✅ FULL SCREEN
        ),
      ),
    );
  }
}
