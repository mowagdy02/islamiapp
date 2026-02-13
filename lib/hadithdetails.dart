import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/SuraClass.dart';
import 'package:islamiapp/custom_text.dart';
import 'package:islamiapp/hadithdetailsargs.dart';

class hadithdetails extends StatefulWidget {
  @override
  State<hadithdetails> createState() => _hadithdetailsState();
}

class _hadithdetailsState extends State<hadithdetails> {
  Color Textcolor = Appcolors.gold;
  Color ContColor = Appcolors.black;
  late HadithdetailsArgs hadithdetailsArgs;

  @override
  Widget build(BuildContext context) {
    hadithdetailsArgs = ModalRoute.of(context)?.settings.arguments as HadithdetailsArgs;
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Appcolors.black,
      appBar: AppBar(
        backgroundColor: Appcolors.transparent,
        title: CustomText(data: "Hadith ${hadithdetailsArgs.index}",color: Appcolors.gold,) ,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Appcolors.gold,onPressed: () {
          Navigator.pop(context);
        },),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child:Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/img_left_corner.png"),
                Container(width:width*0.5,child: CustomText(data: hadithdetailsArgs.hadith.title,color: Appcolors.gold,)),
                Image.asset("assets/images/img_right_corner.png")
              ],
            ),
            Container(margin:EdgeInsets.all(10),child: Expanded(child: SingleChildScrollView(child: CustomText(data: hadithdetailsArgs.hadith.content,color: Appcolors.gold,))))
          ],
        ),
      ),
    );
  }
}

