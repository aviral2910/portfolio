import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/headingCard.dart';
import 'package:aviralportfolio/widgets/inwardTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatefulWidget {
  Contact({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      box ??= positionKey.currentContext!.findRenderObject() as RenderBox;
      position = box!.localToGlobal(Offset.zero); //this is global position

      if (position!.dy < widget.height * .6) {
        if (changeAppBar == false) {
          setState(() {
            changeAppBar = true;
          });
        }
      } else {
        if (changeAppBar == true) {
          setState(() {
            changeAppBar = false;
          });
        }
      }
    });
  }

  final positionKey = GlobalKey();

  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      key: positionKey,
      padding: EdgeInsets.only(
          left: w < mobileSize ? 20 : 0, right: w < mobileSize ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .15,
          ),
          HeadingCard(
            icon: "assets/images/contact.png",
            text: "CONTACT",
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeIn,
            height: changeAppBar ? 25 : 50,
          ),
          SizedBox(
            width: w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Feel free to Contact me by submitting the form below and I will get back to you as soon as possible",
                  style: GoogleFonts.titilliumWeb(
                      color: const Color.fromARGB(207, 255, 255, 255),
                      fontWeight: FontWeight.w400,
                      fontSize: w < mobileSize ? 13 : 16),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeIn,
                  height: changeAppBar ? 45 : 60,
                ),
                Container(
                  padding: EdgeInsets.all(w < mobileSize ? 15 : 35),
                  width: w < mobileSize ? w * .9 : w * .6,
                  // height: 700,
                  decoration: BoxDecoration(
                      color: darkthemeColor,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 4,
                            offset: Offset(-6, -6),
                            color: Color.fromARGB(220, 32, 32, 32)),
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(6, 6),
                            color: Color.fromARGB(220, 15, 15, 15))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "YOUR NAME",
                            style: GoogleFonts.titilliumWeb(
                                color: const Color.fromARGB(255, 214, 231, 240),
                                fontWeight: FontWeight.w200,
                                fontSize: w < mobileSize ? 13 : 16),
                          ),
                          const SizedBox(height: 15),
                          InwardTextFormField(
                            maxlines: 1,
                          )
                        ],
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "PHONE NUMBER",
                            style: GoogleFonts.titilliumWeb(
                                color: const Color.fromARGB(255, 214, 231, 240),
                                fontWeight: FontWeight.w200,
                                fontSize: w < mobileSize ? 13 : 16),
                          ),
                          const SizedBox(height: 15),
                          InwardTextFormField(
                            maxlines: 1,
                          )
                        ],
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "EMAIL",
                            style: GoogleFonts.titilliumWeb(
                                color: const Color.fromARGB(255, 214, 231, 240),
                                fontWeight: FontWeight.w200,
                                fontSize: w < mobileSize ? 13 : 16),
                          ),
                          const SizedBox(height: 15),
                          InwardTextFormField(
                            maxlines: 1,
                          )
                        ],
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 45,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "MESSAGE",
                            style: GoogleFonts.titilliumWeb(
                                color: const Color.fromARGB(255, 214, 231, 240),
                                fontWeight: FontWeight.w200,
                                fontSize: w < mobileSize ? 13 : 16),
                          ),
                          const SizedBox(height: 15),
                          InwardTextFormField(
                            maxlines: 7,
                          )
                        ],
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 45,
                      ),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: CustomShadowButton()),
                      const SizedBox(height: 50),
                    ],
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 100 : 110,
          ),
        ],
      ),
    );
  }
}

class CustomShadowButton extends StatefulWidget {
  const CustomShadowButton({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomShadowButton> createState() => _CustomShadowButtonState();
}

class _CustomShadowButtonState extends State<CustomShadowButton> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      child: Container(
        padding: EdgeInsets.only(top: ishover ? 0 : 5, bottom: ishover ? 5 : 0),
        child: Container(
          height: 50,
          width: 200,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 7,
                    offset: Offset(-8, -8),
                    color: Color.fromARGB(121, 32, 32, 32)),
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(8, 8),
                    color: Color.fromARGB(121, 15, 15, 15))
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ishover
                      ? [
                          const Color.fromARGB(255, 15, 15, 15),
                          const Color.fromARGB(255, 15, 15, 15)
                        ]
                      : [
                          const Color.fromARGB(255, 19, 19, 19),
                          const Color.fromARGB(255, 19, 19, 19),
                        ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "SEND MESSAGE",
              textAlign: TextAlign.center,
              style: GoogleFonts.titilliumWeb(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 1,
                  color: themeColor),
            ),
          ),
        ),
      ),
    );
  }
}
