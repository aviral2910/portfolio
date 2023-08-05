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
      if (widget.scrollController.offset > widget.height * 2.2) {
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
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .2,
          ),
          HeadingCard(
            icon: "assets/images/project.png",
            text: "PROJECTS",
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 30 : 40,
          ),
          ProjectCard(w: w),
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

List<String> Krishn = [
  "flutter",
  "dart",
  "firebase",
  "github",
  "css",
  "figma",
];

class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 35, right: 35),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            ishover = value;
          });
        },
        child: Container(
          padding: EdgeInsets.only(
              left: widget.w < mobileSize ? 20 : 20,
              right: widget.w < mobileSize ? 20 : 20,
              top: widget.w < mobileSize ? 20 : 20,
              bottom: widget.w < mobileSize ? 20 : 20),
          // decoration: BoxDecoration(
          //     color: darkthemeColor2,
          //     boxShadow: const [
          //       BoxShadow(
          //           blurRadius: 4,
          //           offset: Offset(-6, -6),
          //           color: Color.fromARGB(220, 32, 32, 32)),
          //       BoxShadow(
          //           blurRadius: 5,
          //           offset: Offset(6, 6),
          //           color: Color.fromARGB(220, 15, 15, 15))
          //     ],
          //     borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: widget.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      // width: widget.w,
                      padding: EdgeInsets.only(
                          left: widget.w < mobileSize ? 20 : 20,
                          right: widget.w < mobileSize ? 20 : 20,
                          top: widget.w < mobileSize ? 20 : 20,
                          bottom: widget.w < mobileSize ? 20 : 20),
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
                      constraints: BoxConstraints(
                        maxWidth: 900,
                      ),
                      // height: 450,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
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
                                  color: Color.fromARGB(255, 19, 19, 19))),
                          child: Image.asset(
                            "assets/images/krishn.png",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      width: widget.w,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Krishn.ai",
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
                              width: widget.w,
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
                                "Talk to Divine Krishna, and resolve all your doubts and problem of life from Lord Krishna's Perspective. He can help you with modern-day problems using advanced Artificial Intelligence. \n\nGita GPT is a chatbot based on ChatGPT. We inspired it, and we love to keep innovating in this space to continue to help you achieve your mental health goals and guide you through spiritual intelligence.",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.titilliumWeb(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13,
                                    letterSpacing: 1,
                                    color: Color.fromARGB(215, 214, 214, 214)),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
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
                              height: 20,
                            ),
                            Wrap(
                              runSpacing: 20,
                              spacing: 20,
                              children: [
                                for (int i = 0; i < Krishn.length; i++)
                                  CustomSkillShadowCard(
                                    height: 50,
                                    width: 50,
                                    radius: 50,
                                    image: "assets/images/${Krishn[i]}.png",
                                  ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: ishover ? 0 : 5,
                                    bottom: ishover ? 5 : 0),
                                child: Container(
                                  height: 50,
                                  width: 200,
                                  padding: EdgeInsets.only(left: 15, right: 15),
                                  decoration: BoxDecoration(
                                      boxShadow: const [
                                        BoxShadow(
                                            blurRadius: 7,
                                            offset: Offset(-8, -8),
                                            color: Color.fromARGB(
                                                121, 32, 32, 32)),
                                        BoxShadow(
                                            blurRadius: 10,
                                            offset: Offset(8, 8),
                                            color:
                                                Color.fromARGB(121, 15, 15, 15))
                                      ],
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: ishover
                                              ? [
                                                  Color.fromARGB(
                                                      255, 15, 15, 15),
                                                  Color.fromARGB(
                                                      255, 15, 15, 15)
                                                ]
                                              : [
                                                  Color.fromARGB(
                                                      255, 19, 19, 19),
                                                  Color.fromARGB(
                                                      255, 19, 19, 19),
                                                ]),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Live Link",
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
                            )
                          ]),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
