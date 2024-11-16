import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/caseStudy.dart';
import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/service/FIrebaseService.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/Common/headingCard.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Project2 extends StatefulWidget {
  Project2({super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Project2> createState() => _Project2State();
}

class _Project2State extends State<Project2> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProject();
    // widget.scrollController.addListener(() {
    //   box ??=
    //       projectPositionKey.currentContext!.findRenderObject() as RenderBox;
    //   position = box!.localToGlobal(Offset.zero); //this is global position

    //   if (position!.dy < widget.height * .6) {
    //     if (changeAppBar == false) {
    //       setState(() {
    //         changeAppBar = true;
    //       });
    //     }
    //   } else {
    //     if (changeAppBar == true) {
    //       setState(() {
    //         changeAppBar = false;
    //       });
    //     }
    //   }
    // });
  }

  fetchProject() async {
    FirebaseService service = FirebaseService();
    await service.fetchProjectData(context);
  }

  bool changeAppBar = true;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
          top: w >= mobileSize ? 110 : 50, bottom: 50, left: 15, right: 15),
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingCard(
            icon: "assets/images/project.webp",
            text: "PROJECTS",
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 30 : 40,
          ),
          for (int i = 0;
              i <
                  Provider.of<ProjectListProvider>(context)
                      .getprojectList
                      .length;
              i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ProjectCard(
                w: w,
                index: i,
              ),
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
  ProjectCard({
    Key? key,
    required this.w,
    required this.index,
  }) : super(key: key);

  int index;

  double w;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.w < mobileSize ? 0 : 35,
          right: widget.w < mobileSize ? 0 : 35),
      child: Container(
        padding: EdgeInsets.only(
            left: widget.w < mobileSize ? 0 : 20,
            right: widget.w < mobileSize ? 0 : 20,
            top: widget.w < mobileSize ? 5 : 20,
            bottom: widget.w < mobileSize ? 5 : 20),
        child: SizedBox(
          width: widget.w,
          child: widget.w < mobileSize
              ? Column(
                  children: [
                    ProjectImageCard(
                        heading: Provider.of<ProjectListProvider>(context)
                            .getprojectList[widget.index]["name"],
                        w: widget.w,
                        index: widget.index),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25),
                      child: ProjectTextCard(
                        heading: Provider.of<ProjectListProvider>(context)
                            .getprojectList[widget.index]["name"],
                        text: Provider.of<ProjectListProvider>(context)
                            .getprojectList[widget.index]["description"],
                        ishover: ishover,
                        index: widget.index,
                        w: widget.w,
                      ),
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
                            heading: Provider.of<ProjectListProvider>(context)
                                .getprojectList[widget.index]["name"],
                            w: widget.w,
                            index: widget.index,
                          ),
                        ),
                      ),
                    if (widget.index % 2 != 0)
                      Expanded(
                          flex: 1,
                          child: ProjectTextCard(
                              index: widget.index,
                              heading: Provider.of<ProjectListProvider>(context)
                                  .getprojectList[widget.index]["name"],
                              text: Provider.of<ProjectListProvider>(context)
                                  .getprojectList[widget.index]["description"],
                              w: widget.w,
                              ishover: ishover)),
                    const SizedBox(
                      width: 25,
                    ),
                    if (widget.index % 2 == 0)
                      Expanded(
                          flex: 1,
                          child: ProjectTextCard(
                              heading: Provider.of<ProjectListProvider>(context)
                                  .getprojectList[widget.index]["name"],
                              index: widget.index,
                              text: Provider.of<ProjectListProvider>(context)
                                  .getprojectList[widget.index]["description"],
                              w: widget.w,
                              ishover: ishover)),
                    if (widget.index % 2 != 0)
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.center,
                          child: ProjectImageCard(
                            heading: Provider.of<ProjectListProvider>(context)
                                .getprojectList[widget.index]["name"],
                            w: widget.w,
                            index: widget.index,
                            // image: Provider.of<ProjectListProvider>(context)
                            //         .getprojectList[widget.index]["snapDesktop"]
                            //         .isEmpty
                            //     ? Provider.of<ProjectListProvider>(context)
                            //         .getprojectList[widget.index]["snapIA"][0]
                            //     : Provider.of<ProjectListProvider>(context)
                            //             .getprojectList[widget.index]
                            //         ["snapDesktop"][0],
                          ),
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
      required this.heading,
      required this.index,
      required this.ishover,
      required this.w})
      : super(key: key);
  double w;
  int index;

  String heading;

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
                  for (int i = 0;
                      i <
                          Provider.of<ProjectListProvider>(context)
                              .getprojectList[index]["tools"]
                              .length;
                      i++)
                    CustomSkillShadowCard(
                      name: Provider.of<ProjectListProvider>(context)
                          .getprojectList[index]["tools"][i],
                      height: 50,
                      width: 50,
                      radius: 50,
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
                      if (Provider.of<ProjectListProvider>(context)
                              .getprojectList[index]["android"] !=
                          "")
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: CustomLinkShadowCard(
                            height: 50,
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  Provider.of<ProjectListProvider>(context,
                                          listen: false)
                                      .getprojectList[index]["android"]
                                      .toString()));
                            },
                            width: 50,
                            name: "Play Store",
                            radius: 50,
                            image: "assets/images/playstore.webp",
                          ),
                        ),
                      if (Provider.of<ProjectListProvider>(context)
                              .getprojectList[index]["web"] !=
                          "")
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: CustomLinkShadowCard(
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  Provider.of<ProjectListProvider>(context,
                                          listen: false)
                                      .getprojectList[index]["web"]
                                      .toString()));
                            },
                            height: 50,
                            name: "Live Link",
                            width: 50,
                            radius: 50,
                            image: "assets/images/link.webp",
                          ),
                        ),

                      if (Provider.of<ProjectListProvider>(context)
                              .getprojectList[index]["ios"] !=
                          "")
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: CustomLinkShadowCard(
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  Provider.of<ProjectListProvider>(context,
                                          listen: false)
                                      .getprojectList[index]["ios"]
                                      .toString()));
                            },
                            height: 50,
                            name: "App Store",
                            width: 50,
                            radius: 50,
                            image: "assets/images/appstore.webp",
                          ),
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
      {Key? key, required this.w, required this.index, required this.heading})
      : super(key: key);
  int index;
  String heading;
  double w;

  @override
  State<ProjectImageCard> createState() => _ProjectImageCardState();
}

class _ProjectImageCardState extends State<ProjectImageCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.w < mobileSize)
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25),
            child: Text(
              widget.heading,
              style: GoogleFonts.titilliumWeb(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        if (widget.w < mobileSize)
          const SizedBox(
            height: 20,
          ),
        InkWell(
          onTap: () {},
          onHover: (value) {
            // setState(() {
            //   ishover = value;
            // });
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                // width: widget.w,
                // padding: EdgeInsets.only(
                //     left: widget.w < mobileSize ? 10 : 20,
                //     right: widget.w < mobileSize ? 10 : 20,
                //     top: widget.w < mobileSize ? 10 : 20,
                //     bottom: widget.w < mobileSize ? 10 : 20),
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
                            // boxShadow: const [
                            //     BoxShadow(
                            //         blurRadius: 3,
                            //         offset: Offset(-3, -3),
                            //         color: Color.fromARGB(255, 12, 12, 12)),
                            //     BoxShadow(
                            //         blurRadius: 2,
                            //         offset: Offset(3, 3),
                            //         color: Color.fromARGB(255, 32, 32, 32))
                            //   ],
                            border: Border.all(
                                color: const Color.fromARGB(255, 19, 19, 19))),
                    child: Center(
                        child:
                            //  (widget.w >= mobileSize)
                            //     ? Stack(
                            //         children: [
                            //           Image.network(
                            //             "",
                            //             // widget.image.toString(),
                            //             height: widget.w < mobileSize ? 230 : 450,
                            //             fit: BoxFit.fill,
                            //           ),
                            //           // Positioned(
                            //           //     child: AnimatedContainer(
                            //           //   duration: const Duration(milliseconds: 400),
                            //           //   color: ishover
                            //           //       ? Color.fromARGB(218, 20, 20, 20)
                            //           //       : Colors.transparent,
                            //           //   height: widget.w < mobileSize ? 230 : 450,
                            //           //   width: 1000,
                            //           //   child: ishover
                            //           //       ? Column(
                            //           //           mainAxisAlignment:
                            //           //               MainAxisAlignment.center,
                            //           //           children: [
                            //           //             Image.asset(
                            //           //               "assets/images/case2.webp",
                            //           //               height: 60,
                            //           //               width: 60,
                            //           //             ),
                            //           //             CaseStudyButton(
                            //           //               onTap: () {
                            //           //                 Navigator.push(
                            //           //                     context,
                            //           //                     PageTransition(
                            //           //                         type:
                            //           //                             PageTransitionType.fade,
                            //           //                         child: CaseStudy()));
                            //           //               },
                            //           //               isHover: ishover,
                            //           //               isLoading: false,
                            //           //             )
                            //           //           ],
                            //           //         )
                            //           //       : null,
                            //           // ))
                            //         ],
                            //       )
                            // :
                            Provider.of<ProjectListProvider>(context)
                                    .getprojectList[widget.index]["snapDesktop"]
                                    .isEmpty
                                ? SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        for (int i = 0;
                                            i <
                                                Provider.of<ProjectListProvider>(
                                                        context)
                                                    .getprojectList[
                                                        widget.index]["snapIA"]
                                                    .length;
                                            i++)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 25.0, left: 25),
                                            child: SizedBox(
                                              height: 460,
                                              child: MobileScreenCard(
                                                isHover: true,
                                                image:
                                                    Provider.of<ProjectListProvider>(
                                                                    context)
                                                                .getprojectList[
                                                            widget.index]
                                                        ["snapIA"][i],
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  )
                                // Container(
                                //     width: widget.w,
                                //     // height: ,
                                //     color: darkthemeColor,
                                //     child: AbsorbPointer(
                                //       absorbing: false,
                                //       child: CarouselSlider(
                                //         options: CarouselOptions(
                                //           padEnds: true,
                                //           // height: 1000,
                                //           height: 460,
                                //           // aspectRatio: 16 / 9,
                                //           viewportFraction: 1,
                                //           initialPage: 0,
                                //           enableInfiniteScroll: false,
                                //           reverse: false,
                                //           autoPlay: false,
                                //           autoPlayInterval:
                                //               Duration(seconds: 4),
                                //           autoPlayAnimationDuration:
                                //               Duration(milliseconds: 800),
                                //           autoPlayCurve: Curves.fastOutSlowIn,
                                //           enlargeCenterPage: true,
                                //           enlargeFactor: 0.3,
                                //           scrollDirection: Axis.horizontal,
                                //         ),
                                //         items: Provider.of<ProjectListProvider>(
                                //                 context)
                                //             .getprojectList[widget.index]
                                //                 ["snapIA"]
                                //             .map<Widget>((i) {
                                //           return Builder(
                                //             builder: (BuildContext context) {
                                //               return MobileScreenCard(
                                //                 isHover: true,
                                //                 image: i,
                                //               );
                                //             },
                                //           );
                                //         }).toList(),
                                //       ),
                                //     ))
                                : Container(
                                    width: widget.w,
                                    // height: widget.h,
                                    color: darkthemeColor,
                                    child: AbsorbPointer(
                                      absorbing: false,
                                      child: CarouselSlider(
                                        options: CarouselOptions(
                                          padEnds: true,
                                          // height: widget.w < mobileSize
                                          //     ? widget.isWeb
                                          //         ? null
                                          //         : 460
                                          // : widget.h < 670
                                          //     ? widget.h
                                          //     : null,
                                          // height: widget.w < mobileSize ? null : 460,
                                          aspectRatio: 16 / 9,
                                          viewportFraction: .9,
                                          initialPage: 0,
                                          enableInfiniteScroll: false,
                                          reverse: false,
                                          autoPlay: false,
                                          autoPlayInterval:
                                              Duration(seconds: 3),
                                          autoPlayAnimationDuration:
                                              Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.3,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                        items: Provider.of<ProjectListProvider>(
                                                context)
                                            .getprojectList[widget.index]
                                                ["snapDesktop"]
                                            .map<Widget>((i) {
                                          return Builder(
                                            builder: (BuildContext context) {
                                              return WebsiteScreenCard(
                                                isHover: true,
                                                image: i,
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ))
                        //         Image.network(
                        //             // widget.image.toString(),
                        //             "",
                        //             height: widget.w < mobileSize ? 230 : 450,
                        //             fit: BoxFit.fill,
                        //           ),
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
