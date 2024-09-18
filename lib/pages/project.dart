import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/caseStudy.dart';
import 'package:aviralportfolio/pages/contact.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/ProjectWidget/caseStudyButton.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/Common/headingCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Project extends StatefulWidget {
  Project({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Project> createState() => _ProjectState();
}

final projectPositionKey = GlobalKey();

class _ProjectState extends State<Project> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      box ??=
          projectPositionKey.currentContext!.findRenderObject() as RenderBox;
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

  List<String> krishn = [
    "flutter",
    "dart",
    "firebase",
    "github",
    "css",
    "figma",
  ];
  List<String> krishnName = [
    "Flutter",
    "Dart",
    "Firebase",
    "Github",
    "CSS",
    "Figma",
  ];
  List<String> tracker = [
    "flutter",
    "dart",
    "firebase",
    "github",
  ];
  List<String> gravity = [
    "flutter",
    "dart",
    "block",
    "figma",
    "github",
  ];
  List<String> shubham = [
    "flutter",
    "dart",
    "block",
    "figma",
    "github",
  ];
  List<String> shubhamName = [
    "Flutter",
    "Dart",
    "Bloc",
    "Figma",
    "Github",
  ];
  List<String> gravityName = [
    "Flutter",
    "Dart",
    "Bloc",
    "Figma",
    "Github",
  ];
  List<String> shubhamData = [
    "assets/images/shubhamDark.png",
    "Developed a comprehensive portfolio showcasing the client's outstanding work as a graphic designer specializing in UI and UX. This portfolio serves as a testament to the client's proficiency in the field, capturing the essence of their design journey and leaving a lasting impression on viewers. With a keen eye for detail and a commitment to excellence, the portfolio stands as a powerful representation of the client's expertise in graphic design for UI and UX.",
    "https://shubham-singh.in",
    "Shubham's Portfolio",
  ];
  List<String> gravityData = [
    "assets/images/gravity.png",
    "Developed an Android app, Gravity 9.8, the revolutionary exam-taking and results-displaying application that simplifies the educational journey. Gravity 9.8 provides a seamless and efficient platform for taking exams and receiving immediate results, allowing users to gauge their performance and track their progress effortlessly.\n\nThis app has crossed 4.5+ rating and downloaded by 1.5k+ users on playstore within a day of launch.",
    "",
    "Gravity 9.8",
    "market://details?id=com.gravity.gravity98"
  ];
  List<String> trackerName = [
    "Flutter",
    "Dart",
    "Firebase",
    "Github",
  ];
  List<String> krishnData = [
    "assets/images/krishn.png",
    "Developed Webapp and android app with which we Talk to Divine Krishna, and resolve all your doubts and problem of life from Lord Krishna's Perspective. He can help you with modern-day problems using advanced Artificial Intelligence. \n\nGita GPT is a chatbot based on ChatGPT. We inspired it, and we love to keep innovating in this space to continue to help you achieve your mental health goals and guide you through spiritual intelligence.",
    "https://krishn.ai/",
    "Krishn.ai",
    "market://details?id=com.puterlabs.krishnai"
  ];
  List<String> vsparkleData = [
    "assets/images/vsparkle.png",
    "Developed the landing for the Vsparkle who are commited in developing a sustainable and eco-friendly energy future that is readily accessible. \n \nThere goal is to protect the planet and pave the way for a brighter present and even more promising future",
    "https://vsparkle.in/",
    "Vsparkle"
  ];
  List<String> trackerData = [
    "assets/images/trackers.png",
    "This application allows users to create instances for specific tasks or events and then conveniently track their progress.\n\nAdditionally, the app features an Anxiety Tracker, which aids users in tracking their anxiety levels over time. This Anxiety Tracker comes equipped with a range of Breathing exercises designed to help manage anxiety. it also allows users to customize the breathing exercises to suit their individual needs and preferences.",
    "https://drive.google.com/file/d/18JdxjWRsEcCyR4NI2FTZQMUYBDt37gsj/view?usp=sharing",
    "Tracker"
  ];
  List<String> vsparkle = [
    "flutter",
    "dart",
    "firebase",
    "github",
    "css",
    "figma",
  ];
  List<String> vsparkleName = [
    "Flutter",
    "Dart",
    "Firebase",
    "Github",
    "CSS",
    "Figma",
  ];
  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      width: w,
      key: projectPositionKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .2,
          ),
          HeadingCard(
            icon: "assets/images/project.png",
            text: "PROJECTS",
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 30 : 40,
          ),
          ProjectCard(
              image: shubhamData[0],
              text: shubhamData[1],
              link: shubhamData[2],
              heading: shubhamData[3],
              w: w,
              // apkLink: shubhamData[4],
              index: 0,
              list: shubham,
              listName: shubhamName),
          const SizedBox(
            height: 50,
          ),
          ProjectCard(
              image: gravityData[0],
              text: gravityData[1],
              link: gravityData[2],
              heading: gravityData[3],
              w: w,
              apkLink: gravityData[4],
              index: 1,
              list: gravity,
              listName: gravityName),
          const SizedBox(
            height: 50,
          ),
          ProjectCard(
              image: krishnData[0],
              text: krishnData[1],
              link: krishnData[2],
              heading: krishnData[3],
              w: w,
              apkLink: krishnData[4],
              index: 2,
              list: krishn,
              listName: krishnName),
          const SizedBox(
            height: 50,
          ),
          ProjectCard(
              image: vsparkleData[0],
              text: vsparkleData[1],
              link: vsparkleData[2],
              heading: vsparkleData[3],
              w: w,
              index: 3,
              list: vsparkle,
              listName: vsparkleName),
          const SizedBox(
            height: 50,
          ),
          ProjectCard(
            image: trackerData[0],
            text: trackerData[1],
            link: trackerData[2],
            heading: trackerData[3],
            w: w,
            index: 4,
            list: tracker,
            listName: trackerName,
          ),
          // const SizedBox(
          //   height: 50,
          // ),
          // ProjectCard(
          //   image: vsparkleData[0],
          //   text: vsparkleData[1],
          //   link: vsparkleData[2],
          //   heading: vsparkleData[3],
          //   w: w,
          //   index: 3,
          //   list: vsparkle,
          // ),
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

class ProjectCard extends StatefulWidget {
  ProjectCard(
      {Key? key,
      required this.w,
      required this.text,
      required this.link,
      required this.image,
      this.apkLink,
      required this.listName,
      required this.list,
      required this.index,
      required this.heading})
      : super(key: key);
  List<String> list;
  List<String> listName;
  String link;
  String? apkLink;
  String image;

  String heading;
  int index;
  String text;
  final double w;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.w < mobileSize ? 15 : 35,
          right: widget.w < mobileSize ? 15 : 35),
      child: Container(
        padding: EdgeInsets.only(
            left: widget.w < mobileSize ? 5 : 20,
            right: widget.w < mobileSize ? 5 : 20,
            top: widget.w < mobileSize ? 5 : 20,
            bottom: widget.w < mobileSize ? 5 : 20),
        child: SizedBox(
          width: widget.w,
          child: widget.w < mobileSize
              ? Column(
                  children: [
                    ProjectImageCard(
                        heading: widget.heading,
                        w: widget.w,
                        image: widget.image),
                    const SizedBox(
                      height: 20,
                    ),
                    ProjectTextCard(
                      listName: widget.listName,
                      apklink: widget.apkLink,
                      heading: widget.heading,
                      text: widget.text,
                      ishover: ishover,
                      index: widget.index,
                      link: widget.link,
                      w: widget.w,
                      list: widget.list,
                    )
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (widget.index % 2 == 0)
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: ProjectImageCard(
                              heading: widget.heading,
                              w: widget.w,
                              image: widget.image),
                        ),
                      ),
                    if (widget.index % 2 != 0)
                      Expanded(
                          flex: 1,
                          child: ProjectTextCard(
                              apklink: widget.apkLink,
                              index: widget.index,
                              heading: widget.heading,
                              link: widget.link,
                              listName: widget.listName,
                              text: widget.text,
                              list: widget.list,
                              w: widget.w,
                              ishover: ishover)),
                    const SizedBox(
                      width: 25,
                    ),
                    if (widget.index % 2 == 0)
                      Expanded(
                          flex: 1,
                          child: ProjectTextCard(
                              apklink: widget.apkLink,
                              heading: widget.heading,
                              index: widget.index,
                              link: widget.link,
                              text: widget.text,
                              listName: widget.listName,
                              list: widget.list,
                              w: widget.w,
                              ishover: ishover)),
                    if (widget.index % 2 != 0)
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: ProjectImageCard(
                              heading: widget.heading,
                              w: widget.w,
                              image: widget.image),
                        ),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

class ProjectTextCard extends StatelessWidget {
  ProjectTextCard(
      {Key? key,
      required this.text,
      required this.list,
      required this.listName,
      this.apklink,
      required this.heading,
      required this.index,
      required this.link,
      required this.ishover,
      required this.w})
      : super(key: key);
  double w;
  int index;
  String? apklink;
  List<String> listName;
  List<String> list;
  String heading;
  String link;
  String text;
  final bool ishover;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: Column(
          crossAxisAlignment: (index % 2 == 0)
              ? (w < mobileSize)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (w >= mobileSize)
              Text(
                heading,
                style: GoogleFonts.titilliumWeb(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            const SizedBox(
              height: 20,
            ),
            ProjectIlluminatedTextCard(w: w, ishover: ishover, text: text),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Technologies Used",
              textAlign: TextAlign.center,
              style: GoogleFonts.titilliumWeb(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  letterSpacing: 1,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                alignment: w < mobileSize
                    ? WrapAlignment.start
                    : (index % 2 != 0)
                        ? WrapAlignment.start
                        : (w < mobileSize)
                            ? WrapAlignment.start
                            : WrapAlignment.end,
                children: [
                  for (int i = 0; i < list.length; i++)
                    CustomSkillShadowCard(
                      name: listName[i],
                      height: 50,
                      width: 50,
                      radius: 50,
                      image: "assets/images/${list[i]}.png",
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: Column(
                crossAxisAlignment: (w < mobileSize)
                    ? CrossAxisAlignment.end
                    : (index % 2 != 0)
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: [
                  Text(
                    "Case Study & Links",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.titilliumWeb(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: w < mobileSize
                        ? MainAxisAlignment.end
                        : (index % 2 != 0)
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                    children: [
                      CustomSkillShadowCard(
                        height: 50,
                        onTap: () async {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fade,
                                  child: CaseStudy()));
                        },
                        width: 50,
                        name: "Case Study",
                        radius: 50,
                        image: "assets/images/case1.png",
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (apklink != null)
                        CustomSkillShadowCard(
                          height: 50,
                          onTap: () async {
                            await launchUrl(Uri.parse(apklink.toString()));
                          },
                          width: 50,
                          name: "Play Store",
                          radius: 50,
                          image: "assets/images/playstore.png",
                        ),
                      if (apklink != null)
                        const SizedBox(
                          width: 10,
                        ),
                      if (link != "")
                        CustomSkillShadowCard(
                          onTap: () async {
                            await launchUrl(Uri.parse(link));
                          },
                          height: 50,
                          name: "Live Link",
                          width: 50,
                          radius: 50,
                          image: "assets/images/link.png",
                        ),
                      // Container(
                      //   padding: EdgeInsets.only(
                      //       top: ishover ? 0 : 5, bottom: ishover ? 5 : 0),
                      //   child: Container(
                      //     height: 50,
                      //     width: apklink != null ? 120 : 160,
                      //     padding: const EdgeInsets.only(left: 0, right: 0),
                      //     decoration: BoxDecoration(
                      //         boxShadow: const [
                      //           BoxShadow(
                      //               blurRadius: 7,
                      //               offset: Offset(-8, -8),
                      //               color: Color.fromARGB(121, 32, 32, 32)),
                      //           BoxShadow(
                      //               blurRadius: 10,
                      //               offset: Offset(8, 8),
                      //               color: Color.fromARGB(121, 15, 15, 15))
                      //         ],
                      //         gradient: LinearGradient(
                      //             begin: Alignment.topLeft,
                      //             end: Alignment.bottomRight,
                      //             colors: ishover
                      //                 ? const [
                      //                     Color.fromARGB(255, 15, 15, 15),
                      //                     Color.fromARGB(255, 15, 15, 15)
                      //                   ]
                      //                 : const [
                      //                     Color.fromARGB(255, 19, 19, 19),
                      //                     Color.fromARGB(255, 19, 19, 19),
                      //                   ]),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: Center(
                      //       child: Text(
                      //         "Live Link",
                      //         textAlign: TextAlign.center,
                      //         style: GoogleFonts.titilliumWeb(
                      //             fontWeight: FontWeight.w600,
                      //             fontSize: 15,
                      //             letterSpacing: 1,
                      //             color: themeColor),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            )
          ]),
    );
  }
}

class ProjectIlluminatedTextCard extends StatefulWidget {
  const ProjectIlluminatedTextCard({
    super.key,
    required this.w,
    required this.ishover,
    required this.text,
  });

  final double w;
  final bool ishover;
  final String text;

  @override
  State<ProjectIlluminatedTextCard> createState() =>
      _ProjectIlluminatedTextCardState();
}

class _ProjectIlluminatedTextCardState
    extends State<ProjectIlluminatedTextCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (val) {
        ishover = val;
        setState(() {});
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        // height: 200,
        width: widget.w,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: ishover ? 2 : 7,
                  offset: ishover ? Offset(-1, -1) : Offset(-8, -8),
                  color: !ishover
                      ? Color.fromARGB(121, 32, 32, 32)
                      : Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.7)),
              BoxShadow(
                  blurRadius: ishover ? 2 : 10,
                  offset: ishover ? Offset(1, 1) : Offset(8, 8),
                  color: !ishover
                      ? Color.fromARGB(121, 15, 15, 15)
                      : Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.7))
              // BoxShadow(
              //     blurRadius: 7,
              //     offset: Offset(-8, -8),
              //     color: Color.fromARGB(121, 32, 32, 32)),
              // BoxShadow(
              //     blurRadius: 10,
              //     offset: Offset(8, 8),
              //     color: Color.fromARGB(121, 15, 15, 15))
            ],
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: widget.ishover
                    ? [
                        const Color.fromARGB(255, 19, 19, 19),
                        const Color.fromARGB(255, 15, 15, 15)
                      ]
                    : [
                        const Color.fromARGB(255, 15, 15, 15),
                        const Color.fromARGB(255, 19, 19, 19),
                      ]),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          widget.text,
          textAlign: TextAlign.justify,
          style: GoogleFonts.titilliumWeb(
              fontWeight: FontWeight.w300,
              fontSize: 13,
              letterSpacing: 1,
              color: const Color.fromARGB(215, 214, 214, 214)),
        ),
      ),
    );
  }
}

class ProjectImageCard extends StatefulWidget {
  ProjectImageCard(
      {Key? key, required this.w, required this.image, required this.heading})
      : super(key: key);
  String image;
  String heading;
  double w;

  @override
  State<ProjectImageCard> createState() => _ProjectImageCardState();
}

class _ProjectImageCardState extends State<ProjectImageCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.w < mobileSize)
          Text(
            widget.heading,
            style: GoogleFonts.titilliumWeb(
                fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        if (widget.w < mobileSize)
          const SizedBox(
            height: 20,
          ),
        InkWell(
          onTap: () {},
          onHover: (value) {
            setState(() {
              ishover = value;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            // width: widget.w,
            padding: EdgeInsets.only(
                left: widget.w < mobileSize ? 10 : 20,
                right: widget.w < mobileSize ? 10 : 20,
                top: widget.w < mobileSize ? 10 : 20,
                bottom: widget.w < mobileSize ? 10 : 20),
            decoration: BoxDecoration(
                color: darkthemeColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 4,
                      offset: Offset(-6, -6),
                      color: ishover
                          ? Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.4)
                          : Color.fromARGB(220, 32, 32, 32)),
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(6, 6),
                      color: ishover
                          ? Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.4)
                          : Color.fromARGB(220, 15, 15, 15))
                ],
                borderRadius: BorderRadius.circular(10)),

            constraints: const BoxConstraints(
              maxWidth: 900,
            ),

            child: Center(
              child: Container(
                decoration: !ishover
                    ? const BoxDecoration()
                    : BoxDecoration(
                        boxShadow: const [
                            BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-3, -3),
                                color: Color.fromARGB(255, 12, 12, 12)),
                            BoxShadow(
                                blurRadius: 2,
                                offset: Offset(3, 3),
                                color: Color.fromARGB(255, 32, 32, 32))
                          ],
                        border: Border.all(
                            color: const Color.fromARGB(255, 19, 19, 19))),
                child: Center(
                  child: (widget.w >= mobileSize)
                      ? Stack(
                          children: [
                            Image.asset(
                              widget.image.toString(),
                              height: widget.w < mobileSize ? 230 : 450,
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                                child: AnimatedContainer(
                              duration: const Duration(milliseconds: 400),
                              color: ishover
                                  ? Color.fromARGB(218, 20, 20, 20)
                                  : Colors.transparent,
                              height: widget.w < mobileSize ? 230 : 450,
                              width: 1000,
                              child: ishover
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          "assets/images/case2.png",
                                          height: 60,
                                          width: 60,
                                        ),
                                        CaseStudyButton(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child: CaseStudy()));
                                          },
                                          isHover: ishover,
                                          isLoading: false,
                                        )
                                      ],
                                    )
                                  : null,
                            ))
                          ],
                        )
                      : Image.asset(
                          widget.image.toString(),
                          height: widget.w < mobileSize ? 230 : 450,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
