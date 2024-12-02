import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/testimonial.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/Common/customAppBar.dart';
import 'package:aviralportfolio/widgets/ProjectWidget/caseStudyButton.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/shadowText.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy_animations/flutter_easy_animations.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:widget_zoom/widget_zoom.dart';

class CaseStudy extends StatefulWidget {
  const CaseStudy({super.key});

  get scrollController => null;

  @override
  State<CaseStudy> createState() => _CaseStudyState();
}

class _CaseStudyState extends State<CaseStudy> {
  final ScrollController _caseScrollController = ScrollController();

  List<String> gravityName = [
    "Flutter",
    "Dart",
    "Bloc",
    "Figma",
    "Github",
  ];
  List<String> gravity = [
    "flutter",
    "dart",
    "block",
    "figma",
    "github",
  ];
  bool isWeb = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: CustomAppBar(
            isnotHome: true,
            scrollController: _caseScrollController,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/case2.webp",
                      height: 40,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ShadowText("Case Study",
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Colors.white),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Row(
                  children: [
                    CaseStudyButton(
                        width: 130,
                        height: 30,
                        fontSize: 12,
                        text: "Android/IOS",
                        onTap: () {
                          isWeb = false;
                          setState(() {});
                        },
                        isLoading: false,
                        isHover: true),
                    const SizedBox(
                      width: 15,
                    ),
                    CaseStudyButton(
                        width: 60,
                        height: 30,
                        fontSize: 12,
                        text: "Web",
                        onTap: () {
                          isWeb = true;
                          setState(() {});
                        },
                        isLoading: false,
                        isHover: true),
                  ],
                )
              ],
            ),
          )),
      body: Container(
        height: h,
        width: w,
        color: darkthemeColor,
        child: w < mobileSize
            ? Container(
                height: h,
                width: w,
                decoration: const BoxDecoration(),
                constraints: const BoxConstraints(
                  minHeight: 600,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: h,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/klc.webp",
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ShadowText("Kalam Learning Center",
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.white),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CustomSkillShadowCard(
                                                height: 50,
                                                onTap: () async {},
                                                width: 50,
                                                name: "Play Store",
                                                radius: 50,
                                                image:
                                                    "assets/images/playstore.webp",
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              CustomSkillShadowCard(
                                                onTap: () async {},
                                                height: 50,
                                                name: "Live Link",
                                                width: 50,
                                                radius: 50,
                                                image:
                                                    "assets/images/link.webp",
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const AnimatedArrow()
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Text(
                                  "ScreenShots",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.titilliumWeb(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      letterSpacing: 1,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            WebsiteScreen(
                              h: h,
                              w: w,
                              isWeb: isWeb,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CaseStudyButton(
                                    width: 130,
                                    height: 30,
                                    fontSize: 12,
                                    text: "Android/IOS",
                                    onTap: () {
                                      isWeb = false;
                                      setState(() {});
                                    },
                                    isLoading: false,
                                    isHover: true),
                                const SizedBox(
                                  width: 15,
                                ),
                                CaseStudyButton(
                                    width: 60,
                                    height: 30,
                                    fontSize: 12,
                                    text: "Web",
                                    onTap: () {
                                      isWeb = true;
                                      setState(() {});
                                    },
                                    isLoading: false,
                                    isHover: true),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              width: w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Technologies Used",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.titilliumWeb(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        letterSpacing: 1,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Wrap(
                                    runSpacing: 10,
                                    spacing: 10,
                                    children: [
                                      for (int i = 0; i < gravity.length; i++)
                                        CustomSkillShadowCard(
                                          name: gravityName[i],
                                          height: 50,
                                          width: 50,
                                          radius: 50,
                                          image:
                                              "assets/images/${gravity[i]}.webp",
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            for (int i = 0; i < 10; i++)
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'a potent framework renowned for its capacity to produce aesthetically pleasing, rapid, and native-like encounters across various platforms. In addition, I have delved into other frameworks such as ReactJs and Spring Boot, augmenting my skill set. Furthermore, I possess a discerning design sensibility and frequently employ Figma to fashion remarkable UI/UX designs',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.titilliumWeb(
                                      color: const Color.fromARGB(
                                          193, 255, 255, 255),
                                      fontSize: 18,
                                      height: 2,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(
                height: h,
                width: w,
                decoration: const BoxDecoration(),
                constraints: const BoxConstraints(
                  minHeight: 600,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/klc.webp",
                                              height: 100,
                                              width: 100,
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                ShadowText(
                                                    "Kalam Learning Center",
                                                    textAlign: TextAlign.center,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    color: Colors.white),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomSkillShadowCard(
                                                      height: 50,
                                                      onTap: () async {},
                                                      width: 50,
                                                      name: "Play Store",
                                                      radius: 50,
                                                      image:
                                                          "assets/images/playstore.webp",
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    CustomSkillShadowCard(
                                                      onTap: () async {},
                                                      height: 50,
                                                      name: "Live Link",
                                                      width: 50,
                                                      radius: 50,
                                                      image:
                                                          "assets/images/link.webp",
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 40,
                                      left: ((w - 694 > 400)
                                                  ? w - 694
                                                  : w - 466) /
                                              2 -
                                          15,
                                      child: const AnimatedArrow())
                                ],
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                width: w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Technologies Used",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.titilliumWeb(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                          letterSpacing: 1,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Wrap(
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: [
                                        for (int i = 0; i < gravity.length; i++)
                                          CustomSkillShadowCard(
                                            name: gravityName[i],
                                            height: 50,
                                            width: 50,
                                            radius: 50,
                                            image:
                                                "assets/images/${gravity[i]}.webp",
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              for (int i = 0; i < 10; i++)
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'a potent framework renowned for its capacity to produce aesthetically pleasing, rapid, and native-like encounters across various platforms. In addition, I have delved into other frameworks such as ReactJs and Spring Boot, augmenting my skill set. Furthermore, I possess a discerning design sensibility and frequently employ Figma to fashion remarkable UI/UX designs',
                                    textAlign: TextAlign.justify,
                                    style: GoogleFonts.titilliumWeb(
                                        color: const Color.fromARGB(
                                            193, 255, 255, 255),
                                        fontSize: 18,
                                        height: 2,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    isWeb
                        ? WebsiteScreen(
                            h: h,
                            w: w,
                            isWeb: isWeb,
                          )
                        : Stack(
                            children: [
                              Container(
                                  // color: const Color.fromARGB(255, 178, 231, 180),
                                  // color: Provider.of<ThemeProvider>(context)
                                  //     .getThemeColor
                                  //     .withBlue(25),
                                  height: h,
                                  width: w > 1400
                                      ? w * .5
                                      : (w - 694 > 400)
                                          ? 694
                                          : 466,
                                  constraints:
                                      const BoxConstraints(minWidth: 466),
                                  child: SingleChildScrollView(
                                    child: SizedBox(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // const SizedBox(
                                          //   width: 10,
                                          // ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              const SizedBox(height: 250),
                                              for (int i = 0; i < 10; i++)
                                                MobileScreenCard(
                                                  isHover: true,
                                                  image: "",
                                                )
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 70,
                                              ),
                                              for (int i = 0; i < 10; i++)
                                                MobileScreenCard(
                                                  isHover: true,
                                                  image: "",
                                                )
                                            ],
                                          ),
                                          if (w - 694 > 400)
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 160,
                                                ),
                                                for (int i = 0; i < 10; i++)
                                                  MobileScreenCard(
                                                    isHover: true,
                                                    image: "",
                                                  )
                                              ],
                                            ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                              Positioned(
                                  bottom: 40,
                                  left: ((w - 694 > 400) ? 694 : 466) / 2 - 15,
                                  child: const AnimatedArrow())
                            ],
                          ),
                  ],
                ),
              ),
      ),
    );
  }
}

class WebsiteScreen extends StatefulWidget {
  WebsiteScreen(
      {super.key, required this.h, required this.w, required this.isWeb});
  bool isWeb;

  final double h;
  final double w;

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: const Color.fromARGB(255, 178, 231, 180),
      // color: Provider.of<ThemeProvider>(context)
      //     .getThemeColor
      //     .withBlue(25),
      height: widget.w < mobileSize ? 600 : widget.h,
      width: widget.w < mobileSize
          ? widget.w
          : widget.w > 1400
              ? widget.w * .5
              : (widget.w - 694 > 400)
                  ? 694
                  : 466,
      constraints:
          widget.w < mobileSize ? null : const BoxConstraints(minWidth: 466),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: widget.w,
              // height: widget.h,
              color: darkthemeColor,
              child: CarouselSlider(
                options: CarouselOptions(
                  padEnds: true,
                  height: widget.w < mobileSize
                      ? widget.isWeb
                          ? null
                          : 460
                      : widget.h < 670
                          ? widget.h
                          : null,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
                items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return widget.isWeb
                          ? WebsiteScreenCard(
                              isHover: true,
                              image: "",
                            )
                          : MobileScreenCard(
                              isHover: true,
                              image: "",
                            );
                    },
                  );
                }).toList(),
              ))
        ],
      ),
    );
  }
}

class AnimatedArrow extends StatefulWidget {
  const AnimatedArrow({
    super.key,
  });

  @override
  State<AnimatedArrow> createState() => _AnimatedArrowState();
}

class _AnimatedArrowState extends State<AnimatedArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: darkthemeColor, borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: AnimateStyles.shakeY(
            _controller,
            Image.asset(
              "assets/images/arrow.webp",
              height: 35,
              width: 35,
              color: Provider.of<ThemeProvider>(context).getThemeColor,
            ),
          ),
        ),
      ),
    );
  }
}

class WebsiteScreenCard extends StatefulWidget {
  WebsiteScreenCard({super.key, required this.isHover, required this.image});
  String image;
  bool isHover = true;
  @override
  State<WebsiteScreenCard> createState() => _WebsiteScreenCardState();
}

class _WebsiteScreenCardState extends State<WebsiteScreenCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, bottom: 15, top: 15),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          ishover = value;
          setState(() {});
        },
        child: WidgetZoom(
          heroAnimationTag: widget.image,
          zoomWidget: Center(
            child: Card(
              shadowColor: Provider.of<ThemeProvider>(context).getThemeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              elevation: 6,
              child: Container(
                // height: 470,
                // width: 220,
                decoration: BoxDecoration(
                    color: darkthemeColor,
                    boxShadow: !ishover
                        ? [
                            BoxShadow(
                                blurRadius: widget.isHover ? 8 : 7,
                                offset: widget.isHover
                                    ? const Offset(-4, -4)
                                    : const Offset(-8, -8),
                                color: widget.isHover
                                    ? Provider.of<ThemeProvider>(context)
                                        .getThemeColor
                                        .withOpacity(.6)
                                    : const Color.fromARGB(121, 32, 32, 32)),
                            BoxShadow(
                                blurRadius: widget.isHover ? 8 : 10,
                                offset: widget.isHover
                                    ? const Offset(5, 5)
                                    : const Offset(8, 8),
                                color: widget.isHover
                                    ? Provider.of<ThemeProvider>(context)
                                        .getThemeColor
                                        .withOpacity(.6)
                                    : const Color.fromARGB(121, 15, 15, 15))
                          ]
                        : [
                            BoxShadow(
                                blurRadius: widget.isHover ? 3 : 7,
                                offset: widget.isHover
                                    ? const Offset(-2, -2)
                                    : const Offset(-8, -8),
                                color:
                                    const Color.fromARGB(137, 242, 238, 238)),
                            BoxShadow(
                                blurRadius: widget.isHover ? 3 : 10,
                                offset: widget.isHover
                                    ? const Offset(3, 3)
                                    : const Offset(8, 8),
                                color: const Color.fromARGB(137, 242, 238, 238))
                          ],
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(width: 2, color: Colors.black)),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image.network(
                    widget.image.toString(),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MobileScreenCard extends StatefulWidget {
  MobileScreenCard({super.key, required this.isHover, required this.image});
  String image;
  bool isHover = true;
  @override
  State<MobileScreenCard> createState() => _MobileScreenCardState();
}

class _MobileScreenCardState extends State<MobileScreenCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, bottom: 15, top: 15),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          ishover = value;
          setState(() {});
        },
        child: WidgetZoom(
          heroAnimationTag: widget.image,
          zoomWidget: Center(
            child: Card(
              shadowColor: Provider.of<ThemeProvider>(context).getThemeColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 6,
              child: Container(
                // height: 470,
                // width: 220,
                decoration: BoxDecoration(
                    color: darkthemeColor,
                    boxShadow: !ishover
                        ? [
                            BoxShadow(
                                blurRadius: widget.isHover ? 8 : 7,
                                offset: widget.isHover
                                    ? const Offset(-4, -4)
                                    : const Offset(-8, -8),
                                color: widget.isHover
                                    ? Provider.of<ThemeProvider>(context)
                                        .getThemeColor
                                        .withOpacity(.6)
                                    : const Color.fromARGB(121, 32, 32, 32)),
                            BoxShadow(
                                blurRadius: widget.isHover ? 8 : 10,
                                offset: widget.isHover
                                    ? const Offset(5, 5)
                                    : const Offset(8, 8),
                                color: widget.isHover
                                    ? Provider.of<ThemeProvider>(context)
                                        .getThemeColor
                                        .withOpacity(.6)
                                    : const Color.fromARGB(121, 15, 15, 15))
                          ]
                        : [
                            BoxShadow(
                                blurRadius: widget.isHover ? 3 : 7,
                                offset: widget.isHover
                                    ? const Offset(-2, -2)
                                    : const Offset(-8, -8),
                                color:
                                    const Color.fromARGB(137, 242, 238, 238)),
                            BoxShadow(
                                blurRadius: widget.isHover ? 3 : 10,
                                offset: widget.isHover
                                    ? const Offset(3, 3)
                                    : const Offset(8, 8),
                                color: const Color.fromARGB(137, 242, 238, 238))
                          ],
                    // boxShadow: [
                    //   BoxShadow(
                    //       blurRadius: !ishover ? 5 : 3,
                    //       offset: !ishover
                    //           ? const Offset(-3, -3)
                    //           : const Offset(-2, -2),
                    //       color: !ishover
                    //           ? Provider.of<ThemeProvider>(context)
                    //               .getThemeColor
                    //               .withOpacity(.7)
                    //           : const Color.fromARGB(200, 53, 53, 53)),
                    //   BoxShadow(
                    //       blurRadius: !ishover ? 8 : 10,
                    //       offset:
                    //           !ishover ? const Offset(4, 4) : const Offset(8, 8),
                    //       color: !ishover
                    //           ? Provider.of<ThemeProvider>(context)
                    //               .getThemeColor
                    //               .withOpacity(.7)
                    //           : const Color.fromARGB(255, 15, 15, 15))
                    // ],
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 4, color: Colors.black)),
                height: 440,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//  SingleChildScrollView(
//                 controller: _caseScrollController,
//                 child: Container(
//                   height: h,
//                   width: w,
//                   decoration: const BoxDecoration(),
//                   constraints: const BoxConstraints(
//                     minHeight: 600,
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "assets/images/klc.webp",
//                               height: 100,
//                               width: 100,
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 ShadowText("Kalam Learning Center",
//                                     textAlign: TextAlign.center,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 30,
//                                     color: Colors.white),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     CustomSkillShadowCard(
//                                       height: 50,
//                                       onTap: () async {},
//                                       width: 50,
//                                       name: "Play Store",
//                                       radius: 50,
//                                       image: "assets/images/playstore.webp",
//                                     ),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     CustomSkillShadowCard(
//                                       onTap: () async {},
//                                       height: 50,
//                                       name: "Live Link",
//                                       width: 50,
//                                       radius: 50,
//                                       image: "assets/images/link.webp",
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 20,
//                             ),
//                           ],
//                         ),
//                       )),
//                       Container(
//                           width: (w - 330 > 750) ? null : 550,
//                           constraints: const BoxConstraints(
//                               maxWidth: 800, minWidth: 550),
//                           child: SingleChildScrollView(
//                             child: SizedBox(
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   // const SizedBox(
//                                   //   width: 10,
//                                   // ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       const SizedBox(height: 250),
//                                       for (int i = 0; i < 10; i++)
//                                         MobileScreenCard()
//                                     ],
//                                   ),
//                                   Column(
//                                     children: [
//                                       const SizedBox(
//                                         height: 70,
//                                       ),
//                                       for (int i = 0; i < 10; i++)
//                                         MobileScreenCard()
//                                     ],
//                                   ),
//                                   if (w - 330 > 750)
//                                     Column(
//                                       children: [
//                                         const SizedBox(
//                                           height: 160,
//                                         ),
//                                         for (int i = 0; i < 10; i++)
//                                           MobileScreenCard()
//                                       ],
//                                     ),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ))
//                     ],
//                   ),
//                 ),
//               ),
