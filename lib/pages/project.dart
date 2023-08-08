import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/headingCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Project extends StatefulWidget {
  Project({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > widget.height * 2) {
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
  List<String> krishnData = [
    "assets/images/krishn.png",
    "Developed Webapp and android app for it with which we Talk to Divine Krishna, and resolve all your doubts and problem of life from Lord Krishna's Perspective. He can help you with modern-day problems using advanced Artificial Intelligence. \n\nGita GPT is a chatbot based on ChatGPT. We inspired it, and we love to keep innovating in this space to continue to help you achieve your mental health goals and guide you through spiritual intelligence.",
    "krishn.ai",
    "Krishn.ai",
    "Krishn.ai",
  ];
  List<String> vsparkleData = [
    "assets/images/vsparkle.png",
    "Developed the landing for the Vsparkle who are commited in developing a sustainable and eco-friendly energy future that is readily accessible. \n \nThere goal is to protect the planet and pave the way for a brighter present and even more promising future",
    "vsparkle.in",
    "Vsparkle"
  ];
  List<String> vsparkle = [
    "flutter",
    "dart",
    "firebase",
    "github",
    "css",
    "figma",
  ];
  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
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
            image: krishnData[0],
            text: krishnData[1],
            link: krishnData[2],
            heading: krishnData[3],
            w: w,
            apkLink: krishnData[4],
            index: 0,
            list: krishn,
          ),
          const SizedBox(
            height: 50,
          ),
          ProjectCard(
            image: vsparkleData[0],
            text: vsparkleData[1],
            link: vsparkleData[2],
            heading: vsparkleData[3],
            w: w,
            index: 1,
            list: vsparkle,
          ),
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
      required this.list,
      required this.index,
      required this.heading})
      : super(key: key);
  List<String> list;
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
  List<String> list;
  String heading;
  String link;
  String text;
  final bool ishover;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Container(
              // height: 200,
              width: w,
              padding: EdgeInsets.all(20),
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
                              Color.fromARGB(255, 19, 19, 19),
                              Color.fromARGB(255, 15, 15, 15)
                            ]
                          : [
                              Color.fromARGB(255, 15, 15, 15),
                              Color.fromARGB(255, 19, 19, 19),
                            ]),
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                text,
                textAlign: TextAlign.justify,
                style: GoogleFonts.titilliumWeb(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                    letterSpacing: 1,
                    color: Color.fromARGB(215, 214, 214, 214)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              "Tool Used",
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
                    ? WrapAlignment.center
                    : (index % 2 != 0)
                        ? WrapAlignment.start
                        : (w < mobileSize)
                            ? WrapAlignment.start
                            : WrapAlignment.end,
                children: [
                  for (int i = 0; i < list.length; i++)
                    CustomSkillShadowCard(
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
                    "Links",
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
                      if (apklink != null)
                        CustomSkillShadowCard(
                          height: 50,
                          width: 50,
                          radius: 50,
                          image: "assets/images/playstore.png",
                        ),
                      if (apklink != null)
                        const SizedBox(
                          width: 10,
                        ),
                      CustomSkillShadowCard(
                        height: 50,
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
          child: Container(
            // width: widget.w,
            padding: EdgeInsets.only(
                left: widget.w < mobileSize ? 10 : 20,
                right: widget.w < mobileSize ? 10 : 20,
                top: widget.w < mobileSize ? 10 : 20,
                bottom: widget.w < mobileSize ? 10 : 20),
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

            constraints: const BoxConstraints(
              maxWidth: 900,
            ),

            child: Center(
              child: Container(
                decoration: ishover
                    ? BoxDecoration()
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
                        border:
                            Border.all(color: Color.fromARGB(255, 19, 19, 19))),
                child: Center(
                  child: Image.asset(
                    widget.image.toString(),
                    height: widget.w < mobileSize ? 400 : 450,
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
