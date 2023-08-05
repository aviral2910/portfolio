import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/CustomSkillsCard.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/headingCard.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:aviralportfolio/widgets/skillCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatefulWidget {
  About({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > widget.height * .4) {
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

  bool changeAppBar = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      // height: h,
      width: w,
      // constraints: BoxConstraints(minHeight: 650, maxHeight: 850),
      color: darkthemeColor,
      child: (w < mobileSize)
          ? Column(
              children: [
                Center(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 800),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 60 : 90,
                        ),
                        HeadingCard(
                          icon: "assets/images/profile.png",
                          text: "ABOUT",
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 30 : 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: w < mobileSize ? 20 : 35,
                              right: w < mobileSize ? 20 : 30),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              text: 'I am a passionate',
                              // textAlign: TextAlign.justify,
                              style: GoogleFonts.titilliumWeb(
                                  color: Color.fromARGB(193, 255, 255, 255),
                                  fontSize: 18,
                                  height: 2,
                                  fontWeight: FontWeight.w300),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Software Engineer ',
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                  text:
                                      'with a deep fascination for cutting-edge technologies and a drive to create exceptional digital experiences',
                                  style: GoogleFonts.titilliumWeb(
                                      color: Color.fromARGB(193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text:
                                      '\n \nI am a dedicated and versatile developer with a strong focus on mobile and web app development.',
                                  style: GoogleFonts.titilliumWeb(
                                      color: Color.fromARGB(193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                    text: ' mobile and web app development. ',
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                  text: ' I specialize in Flutter, ',
                                  style: GoogleFonts.titilliumWeb(
                                      color: Color.fromARGB(193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                    text: ' Flutter, ',
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                  text:
                                      'a powerful framework for creating beautiful, fast, and native-like experiences across multiple platforms. Additionally, I have explored other frameworks, including React, Spring Boot, to broaden my expertise. Moreover, I have a keen eye for design and often utilize Figma to create stunning UI/UX designs.',
                                  style: GoogleFonts.titilliumWeb(
                                      color: Color.fromARGB(193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: w < mobileSize ? 20 : 20,
                      right: w < mobileSize ? 20 : 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 50 : 70,
                      ),
                      Text(
                        "My Expertise".toUpperCase(),
                        style: GoogleFonts.titilliumWeb(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 50,
                      ),
                      SkillsCard(w: w, changeAppBar: changeAppBar),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 60 : 90,
                      ),
                    ],
                  ),
                )
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Center(
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 800),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // AnimatedContainer(
                          //   duration: Duration(milliseconds: 500),
                          //   curve: Curves.easeIn,
                          //   height: changeAppBar ? 0 : h * .2,
                          // ),
                          HeadingCard(
                            icon: "assets/images/profile.png",
                            text: "ABOUT",
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.easeIn,
                            height: changeAppBar ? 30 : 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 35, right: 30),
                            child: RichText(
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                text: 'I am a passionate',
                                // textAlign: TextAlign.justify,
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(193, 255, 255, 255),
                                    fontSize: 18,
                                    height: 2,
                                    fontWeight: FontWeight.w300),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' Software Engineer ',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
                                          fontSize: 18,
                                          height: 2,
                                          fontWeight: FontWeight.w600)),
                                  TextSpan(
                                    text:
                                        'with a deep fascination for cutting-edge technologies and a drive to create exceptional digital experiences',
                                    style: GoogleFonts.titilliumWeb(
                                        color:
                                            Color.fromARGB(193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  TextSpan(
                                    text:
                                        '\n \nI am a dedicated and versatile developer with a strong focus on mobile and web app development.',
                                    style: GoogleFonts.titilliumWeb(
                                        color:
                                            Color.fromARGB(193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  TextSpan(
                                      text: ' mobile and web app development. ',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
                                          fontSize: 18,
                                          height: 2,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                    text: ' I specialize in Flutter, ',
                                    style: GoogleFonts.titilliumWeb(
                                        color:
                                            Color.fromARGB(193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  TextSpan(
                                      text: ' Flutter, ',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
                                          fontSize: 18,
                                          height: 2,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                    text:
                                        'a powerful framework for creating beautiful, fast, and native-like experiences across multiple platforms. Additionally, I have explored other frameworks, including React, Spring Boot, to broaden my expertise. Moreover, I have a keen eye for design and often utilize Figma to create stunning UI/UX designs.',
                                    style: GoogleFonts.titilliumWeb(
                                        color:
                                            Color.fromARGB(193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          AnimatedContainer(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.easeIn,
                            height: changeAppBar ? 40 : 60,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 20, right: 35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? h * .1 : h * .2,
                      ),
                      Text(
                        "My Expertise".toUpperCase(),
                        style: GoogleFonts.titilliumWeb(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 50,
                      ),
                      SkillsCard(w: w, changeAppBar: changeAppBar),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 40 : 60,
                      ),
                    ],
                  ),
                ))
              ],
            ),
    );
  }
}
