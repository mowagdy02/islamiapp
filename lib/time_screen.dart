import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/custom_text.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        Image.asset("assets/images/Background (2).png", fit: BoxFit.cover),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Image.asset("assets/images/Logo.png"),
              Stack(
                children: [
                  Container(
                    height: height * 0.36,
                    clipBehavior: Clip.hardEdge, // or Clip.antiAlias
                    decoration: BoxDecoration(
                      color: Color(0xFF856B3F),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Image.asset(
                      "assets/images/vector_shape.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 120
                              ,
                              child:CustomText(data: "16 Jul, 2024"),
                            ),
                            Spacer(),
                            SizedBox(
                              child:Column(
                                children: [
                                  CustomText(data: "Pray Time",color: Color(0xFF856B3F),),
                                  CustomText(data: "Tuesday",color: Appcolors.black,)
                                ],
                              ),
                            ),
                            Spacer(),
                            SizedBox(
                              width: 120
                              ,
                              child:CustomText(data: "16 Jul, 2024"),
                            )
                          ],
                        ),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(
                          height: height *0.18, //
                          viewportFraction: 0.32, // card width ratio
                          enlargeCenterPage: true,
                          enlargeFactor: 0.15,
                          enableInfiniteScroll: true,
                        ),
                        items: List.generate(5, (index) => index).map((index) {
                          return Container(
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(26),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF2F2C26), // dark top
                                  Color(0xFF6B5B3E), // mid
                                  Color(0xFFC9AD77), // golden bottom
                                ],
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "ASR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "04:38",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "PM",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        spacing: 40,
                        children: [
                          CustomText(data: "Next Pray - 02:32",color: Appcolors.black,),
                          IconButton(onPressed: () {
                            
                          }, icon: Icon(Icons.voice_over_off,size: 30,),color: Appcolors.black,)
                        ],
                      ),
                    ],
                  )
                ],
              ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                   width: width * 0.4,
                   height: height * 0.24,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Appcolors.transparent,
                       border: BoxBorder.all(color: Appcolors.gold,width: 2)
                   ),
                   child: Column(
                     children: [
                       Image.asset("assets/images/bell-icon 1.png"),
                       CustomText(data: "Evening Azkar")

                     ],
                   ),
                 ),
                 Container(
                   width: width * 0.4,
                   height: height * 0.24,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20),
                       color: Appcolors.transparent,
                       border: BoxBorder.all(color: Appcolors.gold,width: 2)
                   ),
                   child: Column(
                     children: [
                       Image.asset("assets/images/bell-icon 1.png"),
                       CustomText(data: "Evening Azkar")

                     ],
                   ),
                 ),
               ],
             )
            ],
          ),
        ),
      ],
    );
  }
}
