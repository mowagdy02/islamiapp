import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/custom_text.dart';
import 'package:islamiapp/home_screen.dart';

class IntroScreenDemo extends StatefulWidget {
  const IntroScreenDemo({super.key});

  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  final _introKey = GlobalKey<IntroductionScreenState>();

  void _goToHome() {
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  PageViewModel _buildPage({
    required String image,
    required String title,
    required String body,
  }) {
    return PageViewModel(
      titleWidget: const SizedBox.shrink(),
      bodyWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/img_header.png", height: 250),
          Image.asset(image, height: 250),
          SizedBox(height: 50),
          CustomText(
            data: title,
            color: Appcolors.gold,
            size: 22,
            fontweight: FontWeight.bold,
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomText(
              data: body,
              color: Appcolors.gold,
              size: 16,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: _introKey,
      globalBackgroundColor: Appcolors.black,
      pages: [
        _buildPage(
          image: "assets/images/hello.png",
          title: "Welcome To Islami App",
          body: "",
        ),
        _buildPage(
          image: "assets/images/mosque.png",
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
        ),
        _buildPage(
          image: "assets/images/quran.png",
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
        ),
        _buildPage(
          image: "assets/images/pray.png",
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
        ),
        _buildPage(
          image: "assets/images/voice.png",
          title: "Holy Quran Radio",
          body: "You can listen to the Holy Quran Radio through the application for free and easily",
        ),
      ],
       showBackButton: true,
      showNextButton: true,
      back: Text(
        "Back",
        style: TextStyle(
          color: Appcolors.gold,
          fontWeight: FontWeight.bold,
        ),
      ),
      next: Text(
        "Next",
        style: TextStyle(
          color: Appcolors.gold,
          fontWeight: FontWeight.bold,
        ),
      ),
      showDoneButton: true,
      done: Text(
        "Done",
        style: TextStyle(
          color: Appcolors.gold,
          fontWeight: FontWeight.bold,
        ),
      ),

      onDone: _goToHome,

      dotsDecorator: DotsDecorator(
        activeColor: Appcolors.gold,
        color: Appcolors.gold.withOpacity(0.4),
        size: const Size(8, 8),
        activeSize: const Size(18, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
