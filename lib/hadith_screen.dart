import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamiapp/hadith_item.dart';
import 'package:islamiapp/hadithdetailsargs.dart';
import 'package:islamiapp/main.dart';
class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        Spacer(),
        Image.asset("assets/images/Islami.png"),
        Spacer()
        ,CarouselSlider(
          options: CarouselOptions(height: height * 0.66,enlargeCenterPage: true
          ,enableInfiniteScroll: true
          ),
          items: List.generate(50, (index) => index + 1 ,)
              .map((index) {
            return Builder(
              builder: (BuildContext context) {
                return hadithItem(index: index );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}
