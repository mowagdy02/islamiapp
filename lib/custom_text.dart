import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamiapp/Appcolors.dart';
class CustomText extends StatelessWidget {
  String data;
  Color color;
  double size;
  FontWeight fontweight;
  TextAlign textAlign;
   CustomText({required this.data,this.color=Appcolors.white,this.size = 24 , this.fontweight = FontWeight.w700,  this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(data,style: GoogleFonts.cairo(
      color: color,
      fontWeight: fontweight,
      fontSize: size,
    ),textAlign: textAlign,textDirection: TextDirection.rtl,);
  }
}
