import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/custom_text.dart';
import 'package:islamiapp/hadithClass.dart';
import 'package:islamiapp/hadithdetailsargs.dart';

import 'main.dart' show AppRoutes;

class hadithItem extends StatefulWidget {
  final int index;

  hadithItem({required this.index});

  @override
  State<hadithItem> createState() => _hadithItemState();
}

class _hadithItemState extends State<hadithItem> {
  Hadith? hadith;

@override
  void initState() {
    // TODO: implement initState
  loadhadithfile();
  }
  @override
  Widget build(BuildContext context) {
  var height = MediaQuery.sizeOf(context).height;
  var width = MediaQuery.sizeOf(context).width;

  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, AppRoutes.hadithdetails,arguments: HadithdetailsArgs(index: widget.index, hadith: Hadith(title: hadith?.title??"", content: hadith?.content??"")));
    },
    child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Appcolors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: hadith == null ? Center(child: CircularProgressIndicator(),)  : Stack(
          children: [
            Image.asset("assets/images/all.png",fit: BoxFit.cover,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                spacing: 10,
                children: [
                  SizedBox(width: width * 0.6 ,child: CustomText(data:hadith?.title??"",color: Appcolors.black,)),
                  Expanded(child: SingleChildScrollView(child: CustomText(data: hadith?.content??"",color: Appcolors.black,)))
                ],
              ),
            )
          ],
        ),
      ),
  );
  }

  Future<void> loadhadithfile() async {
    String hadithContent = await rootBundle.loadString("assets/files/hadeeth/h${widget.index}.txt");
    String title = hadithContent.substring(0,hadithContent.indexOf("\n"));
    String content = hadithContent.substring(hadithContent.indexOf("\n") + 1 );
    hadith = Hadith(title: title, content: content);
    setState(() {

    });
  }
}

