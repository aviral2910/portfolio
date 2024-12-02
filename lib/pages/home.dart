import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/normalText.dart';

import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/themeProvider.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.h,
    required this.w,
  }) : super(key: key);

  final double h;
  final double w;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationn();
  }

  animationn() async {
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      animate = true;
    });
  }

  bool animate = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return w < mobileSize
        ? Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: h * .9,
                    width: w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image: AssetImage("assets/images/aviral.webp"))),
                    constraints: const BoxConstraints(
                      minHeight: 600,
                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "AVIRAL DIXIT",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.titilliumWeb(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                letterSpacing: 6,
                                color: Provider.of<ThemeProvider>(context)
                                    .getThemeColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.titilliumWeb(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 2,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              CustomShadowCard(
                                name: "Gmail",
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "mailto:aviral.dixit2110@gmail.com"));
                                },
                                height: 45,
                                width: 45,
                                image: "assets/images/gmail.webp",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomShadowCard(
                                name: "Linkedin",
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://www.linkedin.com/in/aviral-dixit/"));
                                },
                                height: 45,
                                width: 45,
                                image: "assets/images/linkedin.webp",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomShadowCard(
                                name: "Github",
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://github.com/aviral2910"));
                                },
                                height: 45,
                                width: 45,
                                image: "assets/images/github.webp",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomShadowCard(
                                name: "Call",
                                onTap: () async {
                                  await launchUrl(
                                      Uri.parse('tel:+917007042761'));
                                },
                                height: 45,
                                width: 45,
                                image: "assets/images/telephone.webp",
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomShadowCard(
                                name: "Resume",
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://drive.google.com/file/d/181CxfOEaL5BvQ3eRtupltZud2lom5kvF/view?usp=sharing"));
                                },
                                height: 45,
                                width: 45,
                                image: "assets/images/resume.webp",
                              )
                            ],
                          ),
                          SizedBox(
                            height: h * .18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 20,
                  left: w * .5 - (25),
                  child: ShakeWidget(
                    duration: const Duration(seconds: 40),
                    autoPlay: true,
                    enableWebMouseHover: true,
                    shakeConstant: ShakeHardConstant2(),
                    child: Image.asset(
                      "assets/images/arrow.webp",
                      height: 25,
                      width: 25,
                      color: Provider.of<ThemeProvider>(context).getThemeColor,
                    ),
                  ))
            ],
          )
        : Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: h * .05,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: h * .8,
                        width: w,
                        constraints: const BoxConstraints(
                          minHeight: 600,
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.bounceOut,
                        duration: const Duration(milliseconds: 1000),
                        right: animate ? 0 : -w * .4,
                        child: Container(
                          height: h * .8,
                          width: w,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            alignment: Alignment.centerRight,
                            image: AssetImage(
                              "assets/images/aviral.webp",
                            ),
                            fit: BoxFit.fitHeight,
                          )),
                          constraints: const BoxConstraints(
                            minHeight: 600,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        top: h * .15,
                        curve: Curves.easeInOut,
                        duration: const Duration(milliseconds: 700),
                        left: animate ? 35 : -w,
                        child: Container(
                          width: w,
                          height: h * .5,
                          constraints: const BoxConstraints(minHeight: 300),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      NormalText("Hi, I’m ",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 55,
                                          letterSpacing: 2,
                                          color: Colors.white),
                                      NormalText("Aviral Dixit",
                                          fontWeight: FontWeight.w800,
                                          fontSize: 58,
                                          letterSpacing: 8,
                                          color: Provider.of<ThemeProvider>(
                                                  context)
                                              .getThemeColor),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  NormalText(
                                      "SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      NormalText("My Socials ",
                                          fontWeight: FontWeight.w200,
                                          fontSize: 16,
                                          letterSpacing: 2,
                                          color: Colors.white),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomShadowCard(
                                        name: "Gmail",
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "mailto:aviral.dixit2110@gmail.com"));
                                        },
                                        height: 70,
                                        width: 70,
                                        image: "assets/images/gmail.webp",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CustomShadowCard(
                                        name: "Linkdin",
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "https://www.linkedin.com/in/aviral-dixit/"));
                                        },
                                        height: 70,
                                        width: 70,
                                        image: "assets/images/linkedin.webp",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CustomShadowCard(
                                        name: "Github",
                                        onTap: () async {
                                          await launchUrl(Uri.parse(
                                              "https://github.com/aviral2910"));
                                        },
                                        height: 70,
                                        width: 70,
                                        image: "assets/images/github.webp",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CustomShadowCard(
                                        name: "Call",
                                        onTap: () async {
                                          await launchUrl(
                                              Uri.parse('tel:+917007042761'));
                                        },
                                        height: 70,
                                        width: 70,
                                        image: "assets/images/telephone.webp",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      CustomShadowCard(
                                        name: "Resume",
                                        onTap: () async {
                                          // await FileSaver.instance.saveFile(
                                          //     name: "Resume: Aviral Dixit",
                                          //     // ext: ".pdf",
                                          //     filePath:
                                          //         "assets/images/Resume-AviralDixit.pdf",
                                          //     mimeType: MimeType.pdf);
                                          await launchUrl(Uri.parse(
                                              "https://drive.google.com/file/d/181CxfOEaL5BvQ3eRtupltZud2lom5kvF/view?usp=sharing"));
                                        },
                                        height: 70,
                                        width: 70,
                                        image: "assets/images/resume.webp",
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // AnimatedPositioned(
                      //   bottom: h * .2,
                      //   curve: Curves.easeInOut,
                      //   duration: Duration(milliseconds: 700),
                      //   left: animate ? 35 : -w,
                      //   child: Container(
                      //     width: w,
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Row(
                      //           children: [
                      //             NormalText("My Socials ",
                      //                 fontWeight: FontWeight.w200,
                      //                 fontSize: 16,
                      //                 letterSpacing: 2,
                      //                 color: Colors.white),
                      //           ],
                      //         ),
                      //         const SizedBox(
                      //           height: 20,
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             CustomShadowCard(
                      //               height: 80,
                      //               width: 80,
                      //               child: Center(
                      //                 child: Image.asset(
                      //                   "assets/images/gmail.webp",
                      //                   height: 25,
                      //                   width: 25,
                      //                 ),
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               width: 20,
                      //             ),
                      //             CustomShadowCard(
                      //               height: 80,
                      //               width: 80,
                      //               child: Center(
                      //                 child: Image.asset(
                      //                   "assets/images/linkedin.webp",
                      //                   height: 25,
                      //                   width: 25,
                      //                 ),
                      //               ),
                      //             ),
                      //             const SizedBox(
                      //               width: 20,
                      //             ),
                      //             CustomShadowCard(
                      //               height: 80,
                      //               width: 80,
                      //               child: Center(
                      //                 child: Image.asset(
                      //                   "assets/images/github.webp",
                      //                   height: 25,
                      //                   width: 25,
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  Container(
                    height: h * .1,
                  ),
                ],
              ),
              Positioned(
                  bottom: 40,
                  left: w * .5 - (45),
                  child: ShakeWidget(
                    duration: const Duration(seconds: 40),
                    autoPlay: true,
                    enableWebMouseHover: true,
                    shakeConstant: ShakeHardConstant2(),
                    child: Image.asset(
                      "assets/images/arrow.webp",
                      height: 45,
                      width: 45,
                      color: Provider.of<ThemeProvider>(context).getThemeColor,
                    ),
                  ))
            ],
          );
  }
}

class WebOverlaySection extends StatelessWidget {
  const WebOverlaySection({
    super.key,
    required this.h,
    required this.w,
    required this.offsetPercentage,
  });

  final double h;
  final double w;
  final num offsetPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: w * .5 + (w * .5 * offsetPercentage),
          height: h,
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(minHeight: 300),
          child: Center(
            child: SizedBox(
              // color: Colors.white,
              width: w * .5 + (w * .2 * offsetPercentage),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NormalRichText("Hi, I’m ", "Aviral Dixit",
                          fontWeight: FontWeight.w800,
                          fontSize: 55,
                          letterSpacing: 2,
                          color: Colors.white),
                      const SizedBox(
                        height: 10,
                      ),
                      NormalText(
                          "SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          letterSpacing: 2,
                          color: Colors.white),
                    ],
                  ),
                  (w * .5 + (w * .5 * offsetPercentage) < w * .7)
                      ? const SizedBox(
                          height: 110,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            NormalText("My Socials ",
                                fontWeight: FontWeight.w200,
                                fontSize: 16,
                                letterSpacing: 2,
                                color: Colors.white),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomShadowCard(
                                  name: "Gmail",
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        "mailto:aviral.dixit2110@gmail.com"));
                                  },
                                  height: 70,
                                  width: 70,
                                  image: "assets/images/gmail.webp",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomShadowCard(
                                  name: "Linkdin",
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        "https://www.linkedin.com/in/aviral-dixit/"));
                                  },
                                  height: 70,
                                  width: 70,
                                  image: "assets/images/linkedin.webp",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomShadowCard(
                                  name: "Github",
                                  onTap: () async {
                                    await launchUrl(Uri.parse(
                                        "https://github.com/aviral2910"));
                                  },
                                  height: 70,
                                  width: 70,
                                  image: "assets/images/github.webp",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomShadowCard(
                                  name: "Call",
                                  onTap: () async {
                                    await launchUrl(
                                        Uri.parse('tel:+917007042761'));
                                  },
                                  height: 70,
                                  width: 70,
                                  image: "assets/images/telephone.webp",
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CustomShadowCard(
                                  name: "Resume",
                                  onTap: () async {
                                    // await FileSaver.instance.saveFile(
                                    //     name: "Resume: Aviral Dixit",
                                    //     // ext: ".pdf",
                                    //     filePath:
                                    //         "assets/images/Resume-AviralDixit.pdf",
                                    //     mimeType: MimeType.pdf);
                                    await launchUrl(Uri.parse(
                                        "https://drive.google.com/file/d/181CxfOEaL5BvQ3eRtupltZud2lom5kvF/view?usp=sharing"));
                                  },
                                  height: 70,
                                  width: 70,
                                  image: "assets/images/resume.webp",
                                )
                              ],
                            )
                          ],
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WebImageSection extends StatelessWidget {
  const WebImageSection({
    super.key,
    required this.w,
    required this.h,
    required this.offsetPercentage,
  });

  final double w;
  final double h;
  final num offsetPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Image.asset(
          "assets/images/aviral.webp",
          height: h * .9 - (h * .5 * offsetPercentage),
          width: w * .45,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class MobileOverlaySection extends StatelessWidget {
  const MobileOverlaySection({
    super.key,
    required this.w,
    required this.h,
    required this.offsetPercentage,
  });

  final double w;
  final double h;
  final num offsetPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      width: w,
      height: h - (h * .6 * offsetPercentage),
      padding: const EdgeInsets.all(20),
      constraints: const BoxConstraints(minHeight: 300),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NormalText("Aviral Dixit",
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  letterSpacing: 6,
                  color: Provider.of<ThemeProvider>(context).getThemeColor),
              const SizedBox(
                height: 10,
              ),
              NormalText("SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  letterSpacing: 2,
                  color: Colors.white),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          (h - (h * .6 * offsetPercentage)) > h * .8
              ? const SizedBox(
                  height: 45,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomShadowCard(
                      name: "Gmail",
                      onTap: () async {
                        await launchUrl(
                            Uri.parse("mailto:aviral.dixit2110@gmail.com"));
                      },
                      height: 45,
                      width: 45,
                      image: "assets/images/gmail.webp",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomShadowCard(
                      name: "Linkdin",
                      onTap: () async {
                        await launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/aviral-dixit/"));
                      },
                      height: 45,
                      width: 45,
                      image: "assets/images/linkedin.webp",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomShadowCard(
                      name: "Github",
                      onTap: () async {
                        await launchUrl(
                            Uri.parse("https://github.com/aviral2910"));
                      },
                      height: 45,
                      width: 45,
                      image: "assets/images/github.webp",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomShadowCard(
                      name: "Call",
                      onTap: () async {
                        await launchUrl(Uri.parse('tel:+917007042761'));
                      },
                      height: 45,
                      width: 45,
                      image: "assets/images/telephone.webp",
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    CustomShadowCard(
                      name: "Resume",
                      onTap: () async {
                        // await FileSaver.instance.saveFile(
                        //     name: "Resume: Aviral Dixit",
                        //     // ext: ".pdf",
                        //     filePath:
                        //         "assets/images/Resume-AviralDixit.pdf",
                        //     mimeType: MimeType.pdf);
                        await launchUrl(Uri.parse(
                            "https://drive.google.com/file/d/181CxfOEaL5BvQ3eRtupltZud2lom5kvF/view?usp=sharing"));
                      },
                      height: 45,
                      width: 45,
                      image: "assets/images/resume.webp",
                    )
                  ],
                ),
        ],
      ),
    );
  }
}

class MobileImageSection extends StatelessWidget {
  const MobileImageSection({
    super.key,
    required this.h,
    required this.w,
  });

  final double h;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 100),
          child: Image.asset(
            "assets/images/aviral.webp",
            height: h,
            width: w,
          ),
        ),
      ),
    );
  }
}
