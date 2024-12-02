import 'dart:ui';

import 'package:aviralportfolio/common/DialogService.dart';
import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/common/overlayService.dart';
import 'package:aviralportfolio/pages/NewUI/Home2.dart';
import 'package:aviralportfolio/widgets/Common/headingCard.dart';
import 'package:aviralportfolio/widgets/skillCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class About2 extends StatefulWidget {
  About2({super.key, required this.height});

  double height;
  @override
  State<About2> createState() => _About2State();
}

class _About2State extends State<About2> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  bool changeAppBar = true;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      // height: h,
      width: w,
      // constraints: BoxConstraints(minHeight: 650, maxHeight: 850),
      // color: darkthemeColor,
      child: (w < mobileSize)
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 50, left: 15, right: 15),
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingCard(
                        icon: "assets/images/profile.webp",
                        text: "ABOUT",
                      )
                          .animate()
                          .fadeIn(delay: .1.seconds, duration: .7.seconds)
                          .slideY(delay: .1.seconds, duration: .7.seconds),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
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
                              text: 'I am an enthusiastic',
                              // textAlign: TextAlign.justify,
                              style: GoogleFonts.titilliumWeb(
                                  color:
                                      const Color.fromARGB(193, 255, 255, 255),
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
                                      'with a profound interest in avant-garde technologies and a determination to craft outstanding digital experiences',
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                                TextSpan(
                                  text:
                                      '\n \nMy dedication as a versatile developer is primarily directed towards',
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          193, 255, 255, 255),
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
                                  text: ' My specialization lies in',
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          193, 255, 255, 255),
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
                                      'a potent framework renowned for its capacity to produce aesthetically pleasing, rapid, and native-like encounters across various platforms. In addition, I have delved into other frameworks such as ReactJs and Spring Boot, augmenting my skill set. Furthermore, I possess a discerning design sensibility and frequently employ Figma to fashion remarkable UI/UX designs',
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(delay: .1.seconds, duration: .7.seconds)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 50, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 50 : 70,
                      ),
                      Text(
                        "My Expertise".toUpperCase(),
                        style: GoogleFonts.titilliumWeb(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      )
                          .animate()
                          .fadeIn(delay: .4.seconds, duration: .7.seconds)
                          .slideX(delay: .4.seconds, duration: .7.seconds),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 30 : 50,
                      ),
                      SkillsCard(w: w, changeAppBar: changeAppBar),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        height: changeAppBar ? 60 : 90,
                      ),
                    ],
                  ),
                )
              ],
            )
          : Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, bottom: 50, left: 15, right: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingCard(
                              icon: "assets/images/profile.webp",
                              text: "ABOUT",
                            )
                                .animate()
                                .fadeIn(delay: .1.seconds, duration: .7.seconds)
                                .slideY(
                                    delay: .1.seconds, duration: .7.seconds),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeIn,
                              height: changeAppBar ? 30 : 50,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 35, right: 30),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  text: 'I am an enthusiastic',
                                  // textAlign: TextAlign.justify,
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          193, 255, 255, 255),
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
                                          'with a profound interest in avant-garde technologies and a determination to craft outstanding digital experiences',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
                                          fontSize: 18,
                                          height: 2,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    TextSpan(
                                      text:
                                          '\n \nMy dedication as a versatile developer is primarily directed towards',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
                                          fontSize: 18,
                                          height: 2,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    TextSpan(
                                        text:
                                            ' mobile and web app development. ',
                                        style: GoogleFonts.titilliumWeb(
                                            color: const Color.fromARGB(
                                                193, 255, 255, 255),
                                            fontSize: 18,
                                            height: 2,
                                            fontWeight: FontWeight.w700)),
                                    TextSpan(
                                      text: ' My specialization lies in',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
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
                                          'a potent framework renowned for its capacity to produce aesthetically pleasing, rapid, and native-like encounters across various platforms. In addition, I have delved into other frameworks such as ReactJs and Spring Boot, augmenting my skill set. Furthermore, I possess a discerning design sensibility and frequently employ Figma to fashion remarkable UI/UX designs',
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              193, 255, 255, 255),
                                          fontSize: 18,
                                          height: 2,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ],
                                ),
                              ),
                            ).animate().fadeIn(
                                delay: .1.seconds, duration: .7.seconds),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 800),
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
                    padding: const EdgeInsets.only(left: 20, right: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          height: changeAppBar ? h * .1 : h * .2,
                        ),
                        Text(
                          "My Expertise".toUpperCase(),
                          style: GoogleFonts.titilliumWeb(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24),
                        )
                            .animate()
                            .fadeIn(delay: .1.seconds, duration: .7.seconds)
                            .slideY(delay: .1.seconds, duration: .7.seconds),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 30 : 50,
                        ),
                        SkillsCard(w: w, changeAppBar: changeAppBar)
                            .animate()
                            .fadeIn(delay: .1.seconds, duration: .4.seconds),
                        // .slideX(
                        //     delay: .1.seconds,
                        //     duration: .6.seconds,
                        //     end: 0,
                        //     begin: .3),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 40 : 60,
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            ),
    );
  }
}
