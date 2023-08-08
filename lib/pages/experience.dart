import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
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
  List<String> gravity = [
    "flutter",
    "dart",
    "github",
    "block",
    "figma",
    "adobexd"
  ];
  List<String> prmsnls = [
    "flutter",
    "react",
    "website",
    "dart",
    "github",
    "firebase",
    "block",
    "figma",
    "html5",
    "css"
  ];

  List<String> pansil = [
    "flutter",
    "springboot",
    "dart",
    "java",
    "sql",
    "adobexd",
    "figma",
    "github"
  ];
  List<String> jss = [
    "python",
    "django",
    "flask",
    "firebase",
    "html5",
    "css",
    "sql",
    "github"
  ];
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
      padding: EdgeInsets.only(
          left: w < mobileSize ? 20 : 35, right: w < mobileSize ? 20 : 35),

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
          if (w > mobileSize)
            DesktopExperience(
                w: w,
                changeAppBar: changeAppBar,
                gravity: gravity,
                prmsnls: prmsnls,
                pansil: pansil,
                jss: jss),
          if (w <= mobileSize)
            MobileExperience(
                w: w,
                changeAppBar: changeAppBar,
                gravity: gravity,
                prmsnls: prmsnls,
                pansil: pansil,
                jss: jss),
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

class MobileExperience extends StatelessWidget {
  const MobileExperience({
    Key? key,
    required this.w,
    required this.changeAppBar,
    required this.gravity,
    required this.prmsnls,
    required this.pansil,
    required this.jss,
  }) : super(key: key);

  final double w;
  final bool changeAppBar;
  final List<String> gravity;
  final List<String> prmsnls;
  final List<String> pansil;
  final List<String> jss;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Positioned(
                top: 20,
                left: 7,
                child: Container(
                  width: 4,
                  height: 2000,
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
                                  color:
                                      const Color.fromARGB(207, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  fontSize: w < mobileSize ? 18 : 22),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "May 2023 - Present  |  Lucknow, India",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            100, 255, 255, 255),
                                        fontWeight: FontWeight.w300,
                                        fontSize: w < mobileSize ? 11 : 12),
                                  ),
                                ),
                                if (w > 1200)
                                  Text(
                                    "Software Developer",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            160, 255, 255, 255),
                                        fontWeight: FontWeight.w500,
                                        fontSize: w < mobileSize ? 13 : 15),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (w < 1200)
                              Text(
                                "Software Developer",
                                style: GoogleFonts.titilliumWeb(
                                    color: const Color.fromARGB(
                                        160, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                    fontSize: w < mobileSize ? 13 : 15),
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < gravity.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${gravity[i]}.png",
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
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
                                  color:
                                      const Color.fromARGB(207, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  fontSize: w < mobileSize ? 18 : 22),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Jan 2022 - April 2023  |  Mumbai, India",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            100, 255, 255, 255),
                                        fontWeight: FontWeight.w300,
                                        fontSize: w < mobileSize ? 11 : 12),
                                  ),
                                ),
                                if (w > 1200)
                                  Text(
                                    "Team Lead",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            160, 255, 255, 255),
                                        fontWeight: FontWeight.w500,
                                        fontSize: w < mobileSize ? 13 : 15),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (w < 1200)
                              Text(
                                "Team Lead",
                                style: GoogleFonts.titilliumWeb(
                                    color: const Color.fromARGB(
                                        160, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                    fontSize: w < mobileSize ? 13 : 15),
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < prmsnls.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${prmsnls[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVC",
                                  ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVP",
                                  ),
                                ],
                              ),
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
                                  color:
                                      const Color.fromARGB(207, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  fontSize: w < mobileSize ? 18 : 22),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Sep 2020 - Jan 2022  |  Lucknow, India",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            100, 255, 255, 255),
                                        fontWeight: FontWeight.w300,
                                        fontSize: w < mobileSize ? 11 : 12),
                                  ),
                                ),
                                if (w > 1200)
                                  Text(
                                    "Software Engineer",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            160, 255, 255, 255),
                                        fontWeight: FontWeight.w500,
                                        fontSize: w < mobileSize ? 13 : 15),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (w < 1200)
                              Text(
                                "Software Engineer",
                                style: GoogleFonts.titilliumWeb(
                                    color: const Color.fromARGB(
                                        160, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                    fontSize: w < mobileSize ? 13 : 15),
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < pansil.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${pansil[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVC",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
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
                                  color:
                                      const Color.fromARGB(207, 255, 255, 255),
                                  fontWeight: FontWeight.w600,
                                  fontSize: w < mobileSize ? 18 : 22),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2016 - 2020  |  Noida, India",
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          100, 255, 255, 255),
                                      fontWeight: FontWeight.w300,
                                      fontSize: w < mobileSize ? 11 : 12),
                                ),
                                if (w > 1200)
                                  Text(
                                    "BTech",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            160, 255, 255, 255),
                                        fontWeight: FontWeight.w500,
                                        fontSize: w < mobileSize ? 13 : 15),
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            if (w < 1200)
                              Text(
                                "BTech",
                                style: GoogleFonts.titilliumWeb(
                                    color: const Color.fromARGB(
                                        160, 255, 255, 255),
                                    fontWeight: FontWeight.w500,
                                    fontSize: w < mobileSize ? 13 : 15),
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                runSpacing: 15,
                                alignment: WrapAlignment.center,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < jss.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${jss[i]}.png",
                                    ),
                                ],
                              ),
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
      ],
    );
  }
}

class DesktopExperience extends StatelessWidget {
  const DesktopExperience({
    Key? key,
    required this.w,
    required this.changeAppBar,
    required this.gravity,
    required this.prmsnls,
    required this.pansil,
    required this.jss,
  }) : super(key: key);

  final double w;
  final bool changeAppBar;
  final List<String> gravity;
  final List<String> prmsnls;
  final List<String> pansil;
  final List<String> jss;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Stack(
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
                                    color: const Color.fromARGB(
                                        207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "May 2023 - Present  |  Lucknow, India",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            100, 255, 255, 255),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  if (w > 1200)
                                    Text(
                                      "Software Developer",
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              160, 255, 255, 255),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (w < 1200)
                                Text(
                                  "Software Developer",
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          160, 255, 255, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < gravity.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${gravity[i]}.png",
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
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
                                    color: const Color.fromARGB(
                                        207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      "Jan 2022 - April 2023  |  Mumbai, India",
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              100, 255, 255, 255),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12),
                                    ),
                                  ),
                                  if (w > 1200)
                                    Text(
                                      "Team Lead",
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              160, 255, 255, 255),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (w < 1200)
                                Text(
                                  "Team Lead",
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          160, 255, 255, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < prmsnls.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${prmsnls[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVC",
                                  ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVP",
                                  ),
                                ],
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
        ),
        Expanded(
          child: Stack(
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
                                "PansilWorks Private Limited",
                                style: GoogleFonts.titilliumWeb(
                                    color: const Color.fromARGB(
                                        207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sep 2020 - Jan 2022  |  Lucknow, India",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            100, 255, 255, 255),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  if (w > 1200)
                                    Text(
                                      "Software Engineer",
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              160, 255, 255, 255),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (w < 1200)
                                Text(
                                  "Software Engineer",
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          160, 255, 255, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < pansil.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${pansil[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVC",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
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
                                    color: const Color.fromARGB(
                                        207, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "2016 - 2020  |  Noida, India",
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            100, 255, 255, 255),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12),
                                  ),
                                  if (w > 1200)
                                    Text(
                                      "BTech",
                                      style: GoogleFonts.titilliumWeb(
                                          color: const Color.fromARGB(
                                              160, 255, 255, 255),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (w < 1200)
                                Text(
                                  "BTech",
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          160, 255, 255, 255),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              const SizedBox(
                                height: 25,
                              ),
                              Wrap(
                                runSpacing: 15,
                                spacing: 15,
                                children: [
                                  for (int i = 0; i < jss.length; i++)
                                    CustomSkillShadowCard(
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${jss[i]}.png",
                                    ),
                                ],
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
        ),
      ],
    );
  }
}
