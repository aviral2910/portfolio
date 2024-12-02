import 'dart:ui';

import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/NewUI/About2.dart';
import 'package:aviralportfolio/pages/NewUI/Contact2.dart';
import 'package:aviralportfolio/pages/NewUI/Experience2.dart';
import 'package:aviralportfolio/pages/NewUI/Home2.dart';
import 'package:aviralportfolio/pages/NewUI/Project2.dart';
import 'package:aviralportfolio/pages/NewUI/SpiderDot.dart';
import 'package:aviralportfolio/pages/NewUI/Testimonial2.dart';

import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/service/FIrebaseService.dart';
import 'package:aviralportfolio/widgets/Common/colorChanger.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int _selectedIndex = 0;
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

  final List<String> _mobiletitles = [
    'Home',
    'About',
    'Projects',
    'Contact',
  ];
  final List<String> _titles = [
    'Home',
    'About',
    'Projects',
    'Testimonial',
    'Contact',
  ];
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: darkthemeColor,
      bottomNavigationBar: w < mobileSize
          ? Stack(
              children: [
                Container(
                  width: w,
                  height: 60,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  decoration: BoxDecoration(
                    color: darkthemeColor2, // Semi-transparent background,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(-2, -2),
                          color: Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.5)),
                      BoxShadow(
                          blurRadius: 4,
                          offset: const Offset(2, 2),
                          color: Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.5))
                    ],
                    border: Border(
                      top: BorderSide(
                          color: Provider.of<ThemeProvider>(context)
                              .getThemeColor),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(_mobiletitles.length, (index) {
                      final bool isSelected = index == _selectedIndex;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = index;
                            _scrollController.jumpTo(0);
                          });
                        },
                        child: Container(
                          // duration: const Duration(milliseconds: 300),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                        blurRadius: 4,
                                        offset: const Offset(-2, -2),
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                .getThemeColor
                                                .withOpacity(.5)),
                                    BoxShadow(
                                        blurRadius: 4,
                                        offset: const Offset(2, 2),
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                .getThemeColor
                                                .withOpacity(.5))
                                  ]
                                : null,
                            border: isSelected
                                ? Border.all(
                                    color: Provider.of<ThemeProvider>(context)
                                        .getThemeColor
                                        .withOpacity(.6))
                                : Border(
                                    top: BorderSide(
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                .getThemeColor
                                                .withOpacity(.4)),
                                  ),
                            color: darkthemeColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            _mobiletitles[index].toUpperCase(),
                            style: GoogleFonts.titilliumWeb(
                              fontSize: 11,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(
                            delay: (.2).seconds,
                            duration: .6.seconds,
                          )
                          .slideY(
                              delay: (.2).seconds,
                              duration: .6.seconds,
                              begin: 1,
                              end: 0);
                      ;
                    }),
                  ),
                ),
              ],
            )
          : null,
      floatingActionButton: const ColorChanger(),
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the default back button
        backgroundColor: Colors.transparent,
        elevation: 0,

        flexibleSpace: w >= mobileSize
            ? SafeArea(
                child: Center(
                  child: Container(
                    // width: w,
                    constraints:
                        const BoxConstraints(maxWidth: 600, minWidth: 300),
                    height: 60,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 4,
                            offset: const Offset(-2, -2),
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor
                                .withOpacity(.5)),
                        BoxShadow(
                            blurRadius: 4,
                            offset: const Offset(2, 2),
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor
                                .withOpacity(.5))
                      ],
                      color: darkthemeColor2, // Semi-transparent background,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      border: Border(
                        right: BorderSide(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor),
                        left: BorderSide(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor),
                        bottom: BorderSide(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_titles.length, (index) {
                        final bool isSelected = index == _selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                              _scrollController.jumpTo(0);
                            });
                          },
                          child: Container(
                            // duration: const Duration(milliseconds: 300),
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: const Offset(-2, -2),
                                          color: Provider.of<ThemeProvider>(
                                                  context)
                                              .getThemeColor
                                              .withOpacity(.5)),
                                      BoxShadow(
                                          blurRadius: 4,
                                          offset: const Offset(2, 2),
                                          color: Provider.of<ThemeProvider>(
                                                  context)
                                              .getThemeColor
                                              .withOpacity(.5))
                                    ]
                                  : null,
                              border: isSelected
                                  ? Border.all(
                                      color: Provider.of<ThemeProvider>(context)
                                          .getThemeColor
                                          .withOpacity(.6))
                                  : Border(
                                      bottom: BorderSide(
                                          color: Provider.of<ThemeProvider>(
                                                  context)
                                              .getThemeColor
                                              .withOpacity(.4)),
                                    ),
                              color: darkthemeColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _titles[index].toUpperCase(),
                              style: GoogleFonts.titilliumWeb(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(delay: (.2).seconds, duration: .6.seconds)
                            .slideY(delay: (.2).seconds, duration: .6.seconds);
                      }),
                    ),
                  ),
                ),
              )
            // SafeArea(
            //     child: Center(
            //       child: Container(
            //         constraints: BoxConstraints(maxWidth: 600, minWidth: 300),
            //         child: Padding(
            //           padding: const EdgeInsets.only(top: 10.0),
            //           child: ClipRRect(
            //             borderRadius: BorderRadius.circular(25),
            //             child: BackdropFilter(
            //               filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            //               child: Container(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 0, horizontal: 0),
            //                 decoration: BoxDecoration(
            //                   color: Colors.white.withOpacity(
            //                       .2), // Semi-transparent background
            //                   borderRadius: BorderRadius.circular(25),
            //                   border: Border.all(
            //                       color: Colors.white.withOpacity(.3)),
            //                 ),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: List.generate(_titles.length, (index) {
            //                     final bool isSelected = index == _selectedIndex;
            //                     return GestureDetector(
            //                       onTap: () {
            //                         setState(() {
            //                           _selectedIndex = index;
            //                         });
            //                       },
            //                       child: AnimatedContainer(
            //                         duration: const Duration(milliseconds: 300),
            //                         padding: const EdgeInsets.symmetric(
            //                             vertical: 8, horizontal: 16),
            //                         decoration: BoxDecoration(
            //                           color: isSelected
            //                               ? Colors.white
            //                               : Colors.transparent,
            //                           borderRadius: BorderRadius.circular(20),
            //                         ),
            //                         child: Text(
            //                           _titles[index].toUpperCase(),
            //                           style: GoogleFonts.titilliumWeb(
            //                             color: isSelected
            //                                 ? Colors.black
            //                                 : Colors.white,
            //                             fontWeight: FontWeight.w500,
            //                           ),
            //                         ),
            //                       ),
            //                     );
            //                   }),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   )
            : null,
      ),
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
          border: w >= mobileSize
              ? Border.all(
                  // width: .5,
                  color: Provider.of<ThemeProvider>(context, listen: false)
                      .getThemeColor
                      .withOpacity(.6))
              : Border(
                  top: BorderSide(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                          .getThemeColor
                          .withOpacity(.6)),
                  left: BorderSide(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                          .getThemeColor
                          .withOpacity(.6)),
                  right: BorderSide(
                      color: Provider.of<ThemeProvider>(context, listen: false)
                          .getThemeColor
                          .withOpacity(.6))),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              if (_selectedIndex == 0) SpiderDot(h: h, w: w),
              if (_selectedIndex == 1)
                Column(
                  children: [
                    About2(height: h),
                    Experience2(height: h),
                    if (w < mobileSize)
                      Testimonial2(
                          scrollController: _scrollController, height: h)
                  ],
                ),
              if (_selectedIndex == 2)
                Project2(scrollController: _scrollController, height: h),
              if (_selectedIndex == 3)
                Column(
                  children: [
                    w >= mobileSize
                        ? Testimonial2(
                            scrollController: _scrollController, height: h)
                        : Contact2(
                            scrollController: _scrollController, height: h),
                  ],
                ),
              if (_selectedIndex == 4)
                Contact2(scrollController: _scrollController, height: h)
            ],
          ),
        ),
      ),
    );
  }
}
