import 'package:flutter/material.dart';
import 'package:islamiapp/Appcolors.dart';

Widget selectedIcon(String iconPath, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: Color(0xBD121010),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Image.asset(
          iconPath,
          width: 24,
          height: 24,
          color: Appcolors.white,
        ),
      ),
       SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          color: Appcolors.white,
          fontSize: 12,
        ),
      ),
    ],
  );
}
