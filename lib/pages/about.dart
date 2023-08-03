import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/CustomSkillsCard.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
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
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 800),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      height: changeAppBar ? h * .1 : h * .2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 20),
                      child: Container(
                        height: 35,
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                width: .4,
                                color: Color.fromARGB(174, 255, 255, 255))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/profile.png",
                              height: 13,
                              width: 13,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "ABOUT",
                              style: GoogleFonts.titilliumWeb(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.easeIn,
                      height: changeAppBar ? 30 : 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 30),
                      child: Text(
                        """I'm a Frontend Web Developer building the Front-end of Websites and Web Applications that leads to the success of the overall product. Check out some of my work in the Projects section. I also like sharing content related to the stuff that I have learned over the years in Web Development so it can help other people of the Dev Community. Feel free to Connect or Follow me on my Linkedin where I post useful content related to Web Development and Programming I'm open to Job opportunities where I can contribute, learn and grow. If you have a good opportunity that matches my skills and experience then don't hesitate to contact me.""",
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.titilliumWeb(
                            color: Color.fromARGB(193, 255, 255, 255),
                            fontSize: 18,
                            height: 2,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                      height: changeAppBar ? h * .1 : h * .2,
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
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  height: changeAppBar ? h * .1 : h * .2,
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
