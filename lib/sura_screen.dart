import 'package:flutter/material.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/SuraClass.dart';
import 'package:islamiapp/custom_text.dart';
import 'package:islamiapp/main.dart';
import 'package:islamiapp/shared_prefs_utils.dart';
import 'package:islamiapp/textfield.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:islamiapp/most_recent_provider.dart';
class SuraScreen extends StatefulWidget {
  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<int> filterQuran = List.generate(114, (index) => index);

  late MostRecentprovider mostRecentprovider ;
  late final mostRecent = mostRecentprovider.mostrecent;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentprovider.GetRecentList();
    },);
  }





  @override
  Widget build(BuildContext context) {
    mostRecentprovider = Provider.of<MostRecentprovider>(context);
    final mostRecent = mostRecentprovider.mostrecent;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/img_header.png"),
            ],
          ),

          CustomSearch(
            search: "Sura name",
            searchbynewtext: searchbynewtext,
          ),

          if (mostRecent.isNotEmpty)
            CustomText(data: "Most Recently"),

          /// MOST RECENT LIST
          if (mostRecent.isNotEmpty)
            Expanded(
              flex: 3,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: mostRecent.length,
                separatorBuilder: (_, __) =>
                const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  int suraIndex = mostRecent[index];
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Appcolors.gold,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child:Row(
                      mainAxisSize: MainAxisSize.min, // ⭐ IMPORTANT
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(
                              data: QuranRes.englishQuranSurahs[suraIndex],
                              color: Appcolors.black,
                            ),
                            CustomText(
                              data: QuranRes.arabicAuranSuras[suraIndex],
                              color: Appcolors.black,
                            ),
                            CustomText(
                              data: "${QuranRes.AyaNumber[suraIndex]} verses",
                              color: Appcolors.black,
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Image.asset(
                            "assets/images/qurasura.png",
                            width: 120,
                          ),
                        ),
                      ],
                    )
                    ,
                  );
                },
              ),
            ),

          CustomText(data: "Suras List"),

          /// SURAS LIST
          Expanded(
            flex: 5,
            child: filterQuran.isEmpty
                ? Center(child: CustomText(data: "No sura found"))
                : ListView.separated(
              itemCount: filterQuran.length,
              separatorBuilder: (_, __) =>
              const Divider(),
              itemBuilder: (context, index) {
                int suraIndex = filterQuran[index];
                return InkWell(
                    onTap: () async {
                      await SaveLastSuraIndex(suraIndex);
                      mostRecentprovider.GetRecentList();

                      Navigator.pushNamed(
                        context,
                        AppRoutes.suradetails,
                        arguments: suraIndex,
                      );
                    },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12),
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                                "assets/images/frame.png"),
                            CustomText(
                                data: "${suraIndex + 1}",
                                size: 18),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              data: QuranRes
                                  .englishQuranSurahs[suraIndex],
                            ),
                            CustomText(
                              data:
                              "${QuranRes.AyaNumber[suraIndex]} verses",
                            ),
                          ],
                        ),
                        const Spacer(),
                        CustomText(
                          data: QuranRes
                              .arabicAuranSuras[suraIndex],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void searchbynewtext(String newtext) {
    filterQuran = List.generate(114, (index) => index)
        .where((i) =>
    QuranRes.englishQuranSurahs[i]
        .toLowerCase()
        .contains(newtext.toLowerCase()) ||
        QuranRes.arabicAuranSuras[i].contains(newtext))
        .toList();
    setState(() {});
  }

  void addToMostRecent(int index) {
    mostRecent.remove(index);
    mostRecent.insert(0, index);
    if (mostRecent.length > 5) mostRecent.removeLast();
    setState(() {});
  }
}



