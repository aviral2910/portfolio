import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:aviralportfolio/service/FIrebaseService.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/features/experience/widgets/experienceCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Experience2 extends StatefulWidget {
  Experience2({
    super.key,
    required this.height,
  });

  double height;

  @override
  State<Experience2> createState() => _Experience2State();
}

class _Experience2State extends State<Experience2> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchExpereince();
    // widget.scrollController.addListener(() {
    //   box ??=
    //       experiencePositionKey.currentContext!.findRenderObject() as RenderBox;
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

  fetchExpereince() {
    FirebaseService firebaseService = FirebaseService();
    firebaseService.fetchExperinceData(context);
  }

  bool changeAppBar = true;
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
          if (w > mobileSize)
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 100, left: 15, right: 15),
              child: DesktopExperience(
                w: w,
                changeAppBar: changeAppBar,
              ),
            ),
          if (w <= mobileSize)
            Padding(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 50, left: 15, right: 15),
              child: MobileExperience(
                w: w,
                changeAppBar: changeAppBar,
              ),
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
  }) : super(key: key);

  final double w;
  final bool changeAppBar;

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
                      for (int i = 0;
                          i <
                              Provider.of<ExperinceListProvider>(context)
                                  .getexperienceList
                                  .length;
                          i++)
                        Column(
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
                                    Provider.of<ExperinceListProvider>(context)
                                        .getexperienceList[i]["name"],
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            207, 255, 255, 255),
                                        fontWeight: FontWeight.w600,
                                        fontSize: w < mobileSize ? 18 : 22),
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
                                          "${Provider.of<ExperinceListProvider>(context).getexperienceList[i]["duration"]}  |  ${Provider.of<ExperinceListProvider>(context).getexperienceList[i]["place"]}",
                                          style: GoogleFonts.titilliumWeb(
                                              color: const Color.fromARGB(
                                                  100, 255, 255, 255),
                                              fontWeight: FontWeight.w300,
                                              fontSize:
                                                  w < mobileSize ? 11 : 12),
                                        ),
                                      ),
                                      if (w > 1200)
                                        Text(
                                          Provider.of<ExperinceListProvider>(
                                                  context)
                                              .getexperienceList[i]["role"],
                                          style: GoogleFonts.titilliumWeb(
                                              color: const Color.fromARGB(
                                                  160, 255, 255, 255),
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  w < mobileSize ? 13 : 15),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  if (w < 1200)
                                    Text(
                                      Provider.of<ExperinceListProvider>(
                                              context)
                                          .getexperienceList[i]["role"],
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
                                        for (int j = 0;
                                            j <
                                                Provider.of<ExperinceListProvider>(
                                                        context,
                                                        listen: false)
                                                    .getexperienceList[i]
                                                        ["technologies"]
                                                    .length;
                                            j++)
                                          CustomSkillShadowCard(
                                            name:
                                                Provider.of<ExperinceListProvider>(
                                                            context,
                                                            listen: false)
                                                        .getexperienceList[i]
                                                    ["technologies"][j],
                                            height: 50,
                                            width: 50,
                                            radius: 50,
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
  }) : super(key: key);

  final double w;
  final bool changeAppBar;

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
                        for (int i = 0;
                            i <
                                Provider.of<ExperinceListProvider>(context)
                                    .getexperienceList
                                    .length;
                            i++)
                          if (Provider.of<ExperinceListProvider>(context)
                                      .getexperienceList[i]["rank"] %
                                  2 !=
                              0)
                            Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                  height: changeAppBar ? 20 : 50,
                                ),
                                ExperienceCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<ExperinceListProvider>(
                                                context)
                                            .getexperienceList[i]["name"],
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
                                            "${Provider.of<ExperinceListProvider>(context).getexperienceList[i]["duration"]}  |  ${Provider.of<ExperinceListProvider>(context).getexperienceList[i]["place"]}",
                                            style: GoogleFonts.titilliumWeb(
                                                color: const Color.fromARGB(
                                                    100, 255, 255, 255),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12),
                                          ),
                                          if (w > 1200)
                                            Text(
                                              Provider.of<ExperinceListProvider>(
                                                      context)
                                                  .getexperienceList[i]["role"],
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
                                          Provider.of<ExperinceListProvider>(
                                                  context)
                                              .getexperienceList[i]["role"],
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
                                          for (int j = 0;
                                              j <
                                                  Provider.of<ExperinceListProvider>(
                                                          context,
                                                          listen: false)
                                                      .getexperienceList[i]
                                                          ["technologies"]
                                                      .length;
                                              j++)
                                            CustomSkillShadowCard(
                                              name:
                                                  Provider.of<ExperinceListProvider>(
                                                              context,
                                                              listen: false)
                                                          .getexperienceList[i]
                                                      ["technologies"][j],
                                              height: 50,
                                              width: 50,
                                              radius: 50,
                                            ),
                                        ],
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
                        for (int i = 0;
                            i <
                                Provider.of<ExperinceListProvider>(context)
                                    .getexperienceList
                                    .length;
                            i++)
                          if (Provider.of<ExperinceListProvider>(context)
                                      .getexperienceList[i]["rank"] %
                                  2 ==
                              0)
                            Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                  height: changeAppBar ? 20 : 50,
                                ),
                                ExperienceCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Provider.of<ExperinceListProvider>(
                                                context)
                                            .getexperienceList[i]["name"],
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
                                            "${Provider.of<ExperinceListProvider>(context).getexperienceList[i]["duration"]}  |  ${Provider.of<ExperinceListProvider>(context).getexperienceList[i]["place"]}",
                                            style: GoogleFonts.titilliumWeb(
                                                color: const Color.fromARGB(
                                                    100, 255, 255, 255),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12),
                                          ),
                                          if (w > 1200)
                                            Text(
                                              Provider.of<ExperinceListProvider>(
                                                      context)
                                                  .getexperienceList[i]["role"],
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
                                          Provider.of<ExperinceListProvider>(
                                                  context)
                                              .getexperienceList[i]["role"],
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
                                          for (int j = 0;
                                              j <
                                                  Provider.of<ExperinceListProvider>(
                                                          context,
                                                          listen: false)
                                                      .getexperienceList[i]
                                                          ["technologies"]
                                                      .length;
                                              j++)
                                            CustomSkillShadowCard(
                                              name:
                                                  Provider.of<ExperinceListProvider>(
                                                              context,
                                                              listen: false)
                                                          .getexperienceList[i]
                                                      ["technologies"][j],
                                              height: 50,
                                              width: 50,
                                              radius: 50,
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        // Column(
                        //   children: [
                        //     AnimatedContainer(
                        //       duration: const Duration(milliseconds: 1000),
                        //       curve: Curves.easeIn,
                        //       height: changeAppBar ? 20 : 50,
                        //     ),
                        //     ExperienceCard(
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             "JSS Academy of Technical Education",
                        //             style: GoogleFonts.titilliumWeb(
                        //                 color: const Color.fromARGB(
                        //                     207, 255, 255, 255),
                        //                 fontWeight: FontWeight.w600,
                        //                 fontSize: 22),
                        //           ),
                        //           const SizedBox(
                        //             height: 5,
                        //           ),
                        //           Row(
                        //             mainAxisAlignment:
                        //                 MainAxisAlignment.spaceBetween,
                        //             children: [
                        //               Text(
                        //                 "2016 - 2020  |  Noida, India",
                        //                 style: GoogleFonts.titilliumWeb(
                        //                     color: const Color.fromARGB(
                        //                         100, 255, 255, 255),
                        //                     fontWeight: FontWeight.w300,
                        //                     fontSize: 12),
                        //               ),
                        //               if (w > 1200)
                        //                 Text(
                        //                   "BTech",
                        //                   style: GoogleFonts.titilliumWeb(
                        //                       color: const Color.fromARGB(
                        //                           160, 255, 255, 255),
                        //                       fontWeight: FontWeight.w500,
                        //                       fontSize: 15),
                        //                 ),
                        //             ],
                        //           ),
                        //           const SizedBox(
                        //             height: 5,
                        //           ),
                        //           if (w < 1200)
                        //             Text(
                        //               "BTech",
                        //               style: GoogleFonts.titilliumWeb(
                        //                   color: const Color.fromARGB(
                        //                       160, 255, 255, 255),
                        //                   fontWeight: FontWeight.w500,
                        //                   fontSize: 15),
                        //             ),
                        //           const SizedBox(
                        //             height: 25,
                        //           ),
                        //           Wrap(
                        //             runSpacing: 15,
                        //             spacing: 15,
                        //             children: [
                        //               for (int i = 0; i < jss.length; i++)
                        //                 CustomSkillShadowCard(
                        //                   name: jssName[i],
                        //                   height: 50,
                        //                   width: 50,
                        //                   radius: 50,
                        //                   image: "assets/images/${jss[i]}.webp",
                        //                 ),
                        //             ],
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // ),
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
