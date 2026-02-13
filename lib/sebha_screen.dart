import 'package:flutter/material.dart';
import 'package:islamiapp/custom_text.dart';

class SebhaScreen extends StatefulWidget {
  SebhaScreen({super.key}); // ❌ NOT const

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {

  // Tasbeeh words
  final List<String> data = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];

  int index = 0;
  int counter = 0;

  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/Background4.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Image.asset("assets/images/Logo.png"),

              CustomText(
                data: "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                size: 32,
              ),

              InkWell(
                onTap: () {
                  // rotate image
                  _rotationController.forward(from: 0);

                  // counter logic
                  counter++;
                  if (counter == 33) {
                    counter = 0;
                    index++;
                    if (index == data.length) {
                      index = 0;
                    }
                  }

                  setState(() {});
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RotationTransition(
                        turns: Tween<double>(begin: 0, end: 0.08)
                            .animate(_rotationController),
                        child: Image.asset(
                          "assets/images/SebhaBody 1.png",
                        ),
                      ),
                    ),

                    /// Text + Counter
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          data: data[index],
                          size: 32,
                        ),
                        const SizedBox(height: 16),
                        CustomText(
                          data: counter.toString(),
                          size: 48,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
