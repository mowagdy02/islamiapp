import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/SuraClass.dart';
import 'package:islamiapp/custom_text.dart';
import 'package:islamiapp/most_recent_provider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
List<String> verses = [];
 Color Textcolor = Appcolors.gold;
 Color ContColor = Appcolors.black;
late int index;
late MostRecentprovider mostRecentprovider ;

int selectedIndex = -1;
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentprovider.GetRecentList();
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)?.settings.arguments as int;
    if(verses.isEmpty){
      LoadSura(index);
    }
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    mostRecentprovider = Provider.of<MostRecentprovider>(context);

    return Scaffold(
      backgroundColor: Appcolors.black,
      appBar: AppBar(
        backgroundColor: Appcolors.transparent,
        title: CustomText(data: QuranRes.englishQuranSurahs[index],color: Appcolors.gold,) ,
        leading: IconButton(icon: Icon(Icons.arrow_back),color: Appcolors.gold,onPressed: () {
          Navigator.pop(context);
        },),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child:verses.isEmpty ? Center(child: CircularProgressIndicator()) : Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/img_left_corner.png"),
                CustomText(data: QuranRes.arabicAuranSuras[index],color: Appcolors.gold,),
                Image.asset("assets/images/img_right_corner.png")
              ],
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Appcolors.gold
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Appcolors.black
                            : Appcolors.gold,
                        width: 2,
                      ),
                    ),
                    child: CustomText(
                      data: "${verses[index]} [${index + 1}]",
                      color: selectedIndex == index
                          ? Appcolors.black
                          : Appcolors.gold,
                    ),
                  ),
                );


              }, separatorBuilder: (context, index) {
                return SizedBox();
              }, itemCount: verses.length,),
            )


          ],
        ),
      ),
    );
  }

Future<void> LoadSura(int index) async {
String filecontent = await rootBundle.loadString("assets/files/suras/${index + 1 }.txt");
print(filecontent);
List<String> Lines = filecontent.split("\n");
verses = Lines;
print(verses);
setState(() {

});
}
}

