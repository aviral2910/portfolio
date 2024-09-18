import 'package:aviralportfolio/common/global.dart';
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

final experiencePositionKey = GlobalKey();

class _ExperienceState extends State<Experience> {
  List<String> gravity = [
    "flutter",
    "dart",
    "github",
    "block",
    "figma",
    "adobexd"
  ];
  List<String> gravityName = [
    "Flutter",
    "Dart",
    "Github",
    "Block",
    "Figma",
    "Adobe Xd"
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
  List<String> prmsnlsName = [
    "Flutter",
    "React",
    "Web 3",
    "Dart",
    "Github",
    "Firebase",
    "Block",
    "Figma",
    "Html 5",
    "CSS"
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
  List<String> pansilName = [
    "Flutter",
    "Spring Boot",
    "Dart",
    "Java",
    "Sql",
    "Adobe Xd",
    "Figma",
    "Github"
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
  List<String> jssName = [
    "Python",
    "Django",
    "Flask",
    "Firebase",
    "Html 5",
    "CSS",
    "Sql",
    "Github"
  ];
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.scrollController.addListener(() {
      box ??=
          experiencePositionKey.currentContext!.findRenderObject() as RenderBox;
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

  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      key: experiencePositionKey,
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
            duration: const Duration(milliseconds: 500),
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
                jss: jss,
                gravityName: gravityName,
                prmsnlsName: prmsnlsName,
                pansilName: pansilName,
                jssName: jssName),
          if (w <= mobileSize)
            MobileExperience(
                w: w,
                changeAppBar: changeAppBar,
                gravity: gravity,
                prmsnls: prmsnls,
                pansil: pansil,
                jss: jss,
                gravityName: gravityName,
                prmsnlsName: prmsnlsName,
                pansilName: pansilName,
                jssName: jssName),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
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
    required this.gravityName,
    required this.prmsnlsName,
    required this.pansilName,
    required this.jssName,
  }) : super(key: key);

  final double w;
  final bool changeAppBar;
  final List<String> gravity;
  final List<String> prmsnls;
  final List<String> pansil;
  final List<String> jss;
  final List<String> gravityName;
  final List<String> prmsnlsName;
  final List<String> pansilName;
  final List<String> jssName;

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
                SizedBox(
                  // height: 450,
                  width: w,
                  child: Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
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
                                      name: gravityName[i],
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
                                      name: prmsnlsName[i],
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${prmsnls[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    name: "MVC",
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVC",
                                  ),
                                  CustomSkillShadowCard(
                                    height: 50,
                                    name: "MVP",
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
                        duration: const Duration(milliseconds: 500),
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
                                      name: pansilName[i],
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${pansil[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    name: "MVC",
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
                                      name: jssName[i],
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
    required this.gravityName,
    required this.prmsnlsName,
    required this.pansilName,
    required this.jssName,
  }) : super(key: key);

  final double w;
  final bool changeAppBar;
  final List<String> gravity;
  final List<String> prmsnls;
  final List<String> pansil;
  final List<String> jss;
  final List<String> gravityName;
  final List<String> prmsnlsName;
  final List<String> pansilName;
  final List<String> jssName;
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
                  SizedBox(
                    // height: 450,
                    width: w,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
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
                                      name: gravityName[i],
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
                                      name: prmsnlsName[i],
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${prmsnls[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    name: "MVC",
                                    height: 50,
                                    width: 50,
                                    radius: 1000,
                                    image: "MVC",
                                  ),
                                  CustomSkillShadowCard(
                                    name: "MVP",
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
                  SizedBox(
                    // height: 450,
                    width: w,
                    child: Column(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
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
                                      name: pansilName[i],
                                      height: 50,
                                      width: 50,
                                      radius: 50,
                                      image: "assets/images/${pansil[i]}.png",
                                    ),
                                  CustomSkillShadowCard(
                                    name: "MVC",
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
                                      name: jssName[i],
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
