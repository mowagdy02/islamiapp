import 'package:flutter/material.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/bottomNavItem.dart';
import 'package:islamiapp/custom_text.dart';
import 'package:islamiapp/hadith_screen.dart';
import 'package:islamiapp/radio_screen.dart';
import 'package:islamiapp/sebha_screen.dart';
import 'package:islamiapp/sura_screen.dart';
import 'package:islamiapp/textfield.dart';
import 'package:islamiapp/time_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedindex = 0;

  List<Widget> Screen= [SuraScreen(),HadithScreen(),SebhaScreen(),RadioScreen(),TimeScreen()];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;


    return Stack(children: [Image.asset("assets/images/Background.png",fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ),
      Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedindex,
            onTap: (value) {
              setState(() {
                selectedindex = value;
              });
            },
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,

            selectedItemColor: Appcolors.white,
            unselectedItemColor: Appcolors.black,

            items: [
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_sura.png"),
                activeIcon: selectedIcon("assets/images/ic_sura.png", "Quran"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_hadeth.png"),
                activeIcon: selectedIcon("assets/images/ic_hadeth.png", "Hadith"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_sebha.png"),
                activeIcon: selectedIcon("assets/images/ic_sebha.png", "Sebha"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_radio.png"),
                activeIcon: selectedIcon("assets/images/ic_radio.png", "Radio"),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset("assets/images/ic_time.png"),
                activeIcon: selectedIcon("assets/images/ic_time.png", "Time"),
                label: "",
              ),
            ],
          ),

          backgroundColor: Appcolors.transparent,
        body: Screen[selectedindex]

      )]);
  }
}
