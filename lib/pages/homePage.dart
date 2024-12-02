import 'dart:math';

import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/about.dart';
import 'package:aviralportfolio/pages/contact.dart';
import 'package:aviralportfolio/pages/experience.dart';
import 'package:aviralportfolio/pages/home.dart';
import 'package:aviralportfolio/pages/project.dart';
import 'package:aviralportfolio/pages/testimonial.dart';
import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/service/FIrebaseService.dart';

import 'package:aviralportfolio/widgets/Common/customAppBar.dart';
import 'package:aviralportfolio/widgets/Common/headingCard.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/Common/colorChanger.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double mouseX = 0;

  double mouseY = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSkillData();
  }

  FirebaseService firebaseService = FirebaseService();
  fetchSkillData() async {
    firebaseService.fetchSkillData(context);
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // print("object");
    return Scaffold(
        floatingActionButton: const ColorChanger(),
        // extendBody: true,
        extendBodyBehindAppBar: true,
        // backgroundColor: darkthemeColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: CustomAppBar(
              scrollController: _scrollController,
            )),
        body: Container(
            height: h,
            width: w,
            // padding: EdgeInsets.only(
            //     left: w < mobileSize ? 10 : 20, right: w < mobileSize ? 10 : 20),
            color: darkthemeColor,
            child: ScrollTransformView(
              children: [
                if (w < mobileSize)
                  ScrollTransformItem(
                    offsetBuilder: ((scrollOffset) =>
                        Offset(0, scrollOffset > h ? h : scrollOffset)),
                    builder: (screenOffset) {
                      final offsetPercentage = min(screenOffset / h * 2, 1);
                      return MobileOverlaySection(
                          w: w, h: h, offsetPercentage: offsetPercentage);
                    },
                  ),
                if (w < mobileSize)
                  ScrollTransformItem(
                      offsetBuilder: ((scrollOffset) => Offset(0, -h)),
                      builder: (scrollOffset) {
                        return MobileImageSection(h: h, w: w);
                      }),
                if (w >= mobileSize)
                  ScrollTransformItem(
                    builder: (screenOffset) {
                      final offsetPercentage = min(screenOffset / w * 2, 1);

                      return WebOverlaySection(
                          h: h, w: w, offsetPercentage: offsetPercentage);
                    },
                    offsetBuilder: ((scrollOffset) =>
                        Offset(0, scrollOffset > h ? h : scrollOffset)),
                  ),
                if (w >= mobileSize)
                  ScrollTransformItem(
                    offsetBuilder: ((scrollOffset) => Offset(0, -h)),
                    builder: (screenOffset) {
                      final offsetPercentage = min(screenOffset / h * .9, 1);
                      return WebImageSection(
                          w: w, h: h, offsetPercentage: offsetPercentage);
                    },
                  ),
                // if (w < mobileSize)
                ScrollTransformItem(
                  key: const ValueKey("about"),
                  builder: (screenOffset) {
                    return About(
                        scrollController: _scrollController, height: h);
                  },
                ),
                ScrollTransformItem(builder: (screenOffset) {
                  return Experience(
                      scrollController: _scrollController, height: h);
                }),
                // if (w >= mobileSize)
                ScrollTransformItem(
                  key: const ValueKey("project"),
                  builder: (screenOffset) {
                    return Project(
                        scrollController: _scrollController, height: h);
                  },
                ),
                ScrollTransformItem(
                  key: const ValueKey("testimonial"),
                  builder: (screenOffset) {
                    return Testimonial(
                        scrollController: _scrollController, height: h);
                  },
                ),
                ScrollTransformItem(
                  key: const ValueKey("contact"),
                  builder: (screenOffset) {
                    return Contact(
                        scrollController: _scrollController, height: h);
                  },
                ),
              ],
            )
            //  ListView.builder(
            //     controller: _scrollController,
            //     itemCount: 1,
            //     itemBuilder: (context, index) {
            //       return Column(children: [
            //         Padding(
            //           padding: EdgeInsets.only(
            //               left: w < mobileSize ? 10 : 20,
            //               right: w < mobileSize ? 10 : 20),
            //           child: Home(h: h, w: w),
            //         ),
            //         const Divider(
            //           height: 0,
            //           thickness: 1,
            //           color: Color.fromARGB(170, 67, 66, 66),
            //         ),

            //         Column(
            //           children: [
            //             Padding(
            //               padding: EdgeInsets.only(
            //                   left: w < mobileSize ? 10 : 20,
            //                   right: w < mobileSize ? 10 : 20),
            //               child: About(
            //                 height: h,
            //                 scrollController: _scrollController,
            //               ),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.only(
            //                   left: w < mobileSize ? 10 : 20,
            //                   right: w < mobileSize ? 10 : 20),
            //               child: Experience(
            //                 scrollController: _scrollController,
            //                 height: h,
            //               ),
            //             ),
            //             const Divider(
            //               height: 0,
            //               thickness: 1,
            //               color: Color.fromARGB(170, 67, 66, 66),
            //             ),
            //             Padding(
            //               padding: EdgeInsets.only(
            //                   left: w < mobileSize ? 0 : 20,
            //                   right: w < mobileSize ? 0 : 20),
            //               child: Project(
            //                 scrollController: _scrollController,
            //                 height: h,
            //               ),
            //             ),
            //           ],
            //         ),

            //         const Divider(
            //           height: 0,
            //           thickness: 1,
            //           color: Color.fromARGB(170, 67, 66, 66),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(
            //               left: w < mobileSize ? 10 : 20,
            //               right: w < mobileSize ? 10 : 20),
            //           child: Testimonial(
            //             scrollController: _scrollController,
            //             height: h,
            //           ),
            //         ),
            //         const Divider(
            //           height: 0,
            //           thickness: 1,
            //           color: Color.fromARGB(170, 67, 66, 66),
            //         ),
            //         Padding(
            //           padding: EdgeInsets.only(
            //               left: w < mobileSize ? 10 : 20,
            //               right: w < mobileSize ? 10 : 20),
            //           child: Contact(
            //             scrollController: _scrollController,
            //             height: h,
            //           ),
            //         ),
            //         // Stack(
            //         //   children: [
            //         //     MouseRegion(
            //         //         onHover: (event) {
            //         //           Provider.of<MousePointerProvider>(context,
            //         //                   listen: false)
            //         //               .setMousePointer(event.localPosition.dx,
            //         //                   event.localPosition.dy);
            //         //         },
            //         //         child: Home(h: h, w: w)),
            //         //     Consumer<MousePointerProvider>(builder: (_, a, context) {
            //         //       return Positioned(
            //         //           // top: 0,
            //         //           top: a.getMouseY,
            //         //           left: a.getMouseX,
            //         //           child: Container(
            //         //             height: 35,
            //         //             width: 35,
            //         //             decoration: BoxDecoration(
            //         //                 border: Border.all(color: themeColor),
            //         //                 borderRadius: BorderRadius.circular(35)),
            //         //             child: Center(
            //         //               child: Container(
            //         //                 height: 5,
            //         //                 width: 5,
            //         //                 decoration: BoxDecoration(
            //         //                     color: themeColor,
            //         //                     borderRadius: BorderRadius.circular(5)),
            //         //               ),
            //         //             ),
            //         //           ));
            //         //     })
            //         //   ],
            //         // ),
            //         // Stack(
            //         //   children: [
            //         //     MouseRegion(
            //         //       onHover: (event) {
            //         //         Provider.of<MousePointerProvider>(context,
            //         //                 listen: false)
            //         //             .setMousePointer(
            //         //                 event.localPosition.dx, event.localPosition.dy);
            //         //       },
            //         //       child: Container(
            //         //         height: 1000,
            //         //       ),
            //         //     ),
            //         //     Consumer<MousePointerProvider>(builder: (_, a, context) {
            //         //       return Positioned(
            //         //           // top: 0,
            //         //           top: a.getMouseY,
            //         //           left: a.getMouseX,
            //         //           child: (a.getMouseY < 0)
            //         //               ? SizedBox()
            //         //               : Container(
            //         //                   height: 35,
            //         //                   width: 35,
            //         //                   decoration: BoxDecoration(
            //         //                       border: Border.all(color: themeColor),
            //         //                       borderRadius: BorderRadius.circular(35)),
            //         //                   child: Center(
            //         //                     child: Container(
            //         //                       height: 5,
            //         //                       width: 5,
            //         //                       decoration: BoxDecoration(
            //         //                           color: themeColor,
            //         //                           borderRadius:
            //         //                               BorderRadius.circular(5)),
            //         //                     ),
            //         //                   ),
            //         //                 ));
            //         //     })
            //         //   ],
            //         // )
            //       ]);
            //     }),
            ));
  }
}
