import 'package:aviralportfolio/global.dart';
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
          width: widget.w,
          padding: EdgeInsets.only(
              left: widget.w < mobileSize ? 20 : 35,
              right: widget.w < mobileSize ? 20 : 35,
              top: widget.w < mobileSize ? 20 : 25,
              bottom: widget.w < mobileSize ? 20 : 25),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Image.asset(
              //   "assets/images/aviral.png",
              //   width: 250,
              //   height: 250,
              //   fit: BoxFit.fitHeight,
              // ),
              SizedBox(
                width: 25,
              ),
              // Container(
              //   height: 250,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Krishn.ai".toUpperCase(),
              //         style: GoogleFonts.titilliumWeb(
              //             fontSize: 35,
              //             fontWeight: FontWeight.w700,
              //             color: ishover
              //                 ? themeColor
              //                 : Color.fromARGB(255, 224, 238, 248)),
              //       )
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
