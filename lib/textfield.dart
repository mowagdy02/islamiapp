import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:islamiapp/SuraClass.dart';

import 'Appcolors.dart';

class CustomSearch extends StatelessWidget {

  String search;
  void Function(String) searchbynewtext;
  CustomSearch({required this.search,required this.searchbynewtext});
  @override
  Widget build(BuildContext context) {
    return               TextField(
      onChanged: (newtext) {
        searchbynewtext(newtext);
      },
      style: TextStyle(color: Appcolors.white,fontSize: 18,fontWeight: FontWeight.w700),
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xBD121010),

        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            "assets/images/sura_icon.png",
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
        ),

        prefixIconConstraints: BoxConstraints(
          minWidth: 48,
          minHeight: 48,
        ),

        hintText: search,
        hintStyle: TextStyle(color: Appcolors.white),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.gold),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.gold),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    )
    ;
  }
}
