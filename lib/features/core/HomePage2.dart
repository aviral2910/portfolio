import 'dart:ui';

import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/features/about/About2.dart';
import 'package:aviralportfolio/features/contact/Contact2.dart';
import 'package:aviralportfolio/features/experience/Experience2.dart';
import 'package:aviralportfolio/features/home/Home2.dart';
import 'package:aviralportfolio/features/projects/Project2.dart';
import 'package:aviralportfolio/pages/NewUI/SpiderDot.dart';
import 'package:aviralportfolio/features/testimonial.dart/Testimonial2.dart';

import 'package:aviralportfolio/features/theme/themeProvider.dart';
import 'package:aviralportfolio/service/FIrebaseService.dart';
import 'package:aviralportfolio/features/common/widgets/colorChanger.dart';
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
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
                    child: Container(
                      constraints:
                          const BoxConstraints(maxWidth: 600, minWidth: 300),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int index = 0; index < _titles.length; index++)
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                    _scrollController.jumpTo(0);
                                  });
                                },
                                child: Container(
                                  // width: double.infinity,
                                  // height: double.infinity,
                                  // duration: const Duration(milliseconds: 300),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  decoration: BoxDecoration(
                                    boxShadow: _selectedIndex == index
                                        ? [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: const Offset(-2, -2),
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                            context)
                                                        .getThemeColor
                                                        .withOpacity(.5)),
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: const Offset(2, 2),
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                            context)
                                                        .getThemeColor
                                                        .withOpacity(.5))
                                          ]
                                        : null,
                                    border: _selectedIndex == index
                                        ? Border.all(
                                            color: Provider.of<ThemeProvider>(
                                                    context)
                                                .getThemeColor
                                                .withOpacity(.6))
                                        : Border(
                                            bottom: BorderSide(
                                                color:
                                                    Provider.of<ThemeProvider>(
                                                            context)
                                                        .getThemeColor
                                                        .withOpacity(.4)),
                                          ),
                                    color: darkthemeColor,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _titles[index].toUpperCase(),
                                      style: GoogleFonts.titilliumWeb(
                                        fontSize: 10,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                                  .animate()
                                  .fadeIn(
                                      delay: (.2).seconds, duration: .6.seconds)
                                  .slideY(
                                      delay: (.2).seconds,
                                      duration: .6.seconds),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              )
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
