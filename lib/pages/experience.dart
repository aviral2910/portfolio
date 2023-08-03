import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/experienceCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Experience extends StatefulWidget {
  Experience({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > widget.height * 1.2) {
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
      padding: EdgeInsets.only(left: 35, right: 35),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Experience & Education".toUpperCase(),
            style: GoogleFonts.titilliumWeb(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 30 : 50,
          ),
          Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 35,
                  child: Container(
                    width: 4,
                    height: 700,
                    color: Colors.black,
                  )),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // height: 450,
                    width: w,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 20 : 50,
                        ),
                        ExperienceCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Gravity Orienting Intellingence",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "May 2023 - Present  |  Lucknow, India",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(100, 255, 255, 255),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 20 : 50,
                        ),
                        ExperienceCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Permissionless",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Jan 2022 - April 2023  |  Mumbai, India",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(100, 255, 255, 255),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 20 : 50,
                        ),
                        ExperienceCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PansilWorks Private Limited",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Sep 2020 - Jan 2022  |  Lucknow, India",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(100, 255, 255, 255),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeIn,
                          height: changeAppBar ? 20 : 50,
                        ),
                        ExperienceCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "JSS Academy of Technical Education",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "2016 - 2020  |  Noida, India",
                                style: GoogleFonts.titilliumWeb(
                                    color: Color.fromARGB(100, 255, 255, 255),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .2,
          ),
        ],
      ),
    );
  }
}
