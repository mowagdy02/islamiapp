import 'package:flutter/material.dart';
import 'package:islamiapp/Appcolors.dart';
import 'package:islamiapp/custom_text.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}
bool iSreciter = false;

class _RadioScreenState extends State<RadioScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width ;
    double height = MediaQuery.sizeOf(context).height ;

    return
      Stack(
      children: [
        Image.asset("assets/images/Background (1).png",fit: BoxFit.cover,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/Logo.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.16,vertical: 8 ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: iSreciter ? Color(0x8B121010) : Appcolors.gold,
                      ),
                      child: CustomText(data: "Radio",size: 18,color: iSreciter?   Appcolors.white:Appcolors.black,),
                    ),
                      onTap: () {
                        iSreciter = false;
                        setState(() {

                        });
                      },
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.16,vertical: 8 ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: iSreciter? Appcolors.gold : Color(0x8B121010),
                      ),
                      child: CustomText(data: "Reciters",size: 16,color: iSreciter?   Appcolors.black:Appcolors.white,),
                    ),
                    onTap: () {
                      iSreciter = true;
                      setState(() {

                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: iSreciter? ListView.separated(itemBuilder: (context, index) {
                  return Container(
                    width: width,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                        color: Appcolors.gold,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Image.asset("assets/images/Mask group.png"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(data: "Radio Ibrahim Al-Akdar",color: Appcolors.black,),
                            Image.asset("assets/images/Group 8.png")
                          ],
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) =>
                    SizedBox(height: 20,), itemCount: 20):
                ListView.separated(itemBuilder: (context, index) {
                  return Container(
                    width: width,
                    height: height * 0.15,
                    decoration: BoxDecoration(
                        color: Appcolors.gold,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Image.asset("assets/images/Mask group.png"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomText(data: "Radio Ibrahim Al-Akdar",color: Appcolors.black,),
                            Image.asset("assets/images/Group 8.png")
                          ],
                        )
                      ],
                    ),
                  );
                }, separatorBuilder: (context, index) =>
                    SizedBox(height: 20,), itemCount: 20)

              )
                ],
              ),
        ),],);
  }
}
