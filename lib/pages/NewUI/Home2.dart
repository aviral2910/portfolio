import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Home2 extends StatefulWidget {
  const Home2({
    super.key,
    required this.w,
    required this.h,
    required this.offsetPercentage,
  });
  final double w;
  final double h;
  final num offsetPercentage;
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animate();
  }

  animate() async {
    await Future.delayed(Duration(milliseconds: 400));
    setState(() {
      doAnimate = true;
    });
  }

  bool doAnimate = false;
  @override
  Widget build(BuildContext context) {
    return widget.w >= mobileSize
        ? Container(
            height: widget.h,
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(minHeight: 300),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalRichText("Hi, I’m ", "Aviral Dixit",
                    fontWeight: FontWeight.w800,
                    fontSize: 55,
                    letterSpacing: 2,
                    color: Colors.white),
                const SizedBox(
                  height: 10,
                ),
                NormalText("SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    letterSpacing: 2,
                    color: Colors.white),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                        AnimatedOpacity(
                          opacity: doAnimate ? 1 : 0,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 200),
                          child: CustomShadowCard(
                            name: "Gmail",
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  "mailto:aviral.dixit2110@gmail.com"));
                            },
                            height: 70,
                            width: 70,
                            image: "assets/images/gmail.webp",
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AnimatedOpacity(
                          opacity: doAnimate ? 1 : 0,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 400),
                          child: CustomShadowCard(
                            name: "Linkdin",
                            onTap: () async {
                              await launchUrl(Uri.parse(
                                  "https://www.linkedin.com/in/aviral-dixit/"));
                            },
                            height: 70,
                            width: 70,
                            image: "assets/images/linkedin.webp",
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AnimatedOpacity(
                          opacity: doAnimate ? 1 : 0,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 600),
                          child: CustomShadowCard(
                            name: "Github",
                            onTap: () async {
                              await launchUrl(
                                  Uri.parse("https://github.com/aviral2910"));
                            },
                            height: 70,
                            width: 70,
                            image: "assets/images/github.webp",
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AnimatedOpacity(
                          opacity: doAnimate ? 1 : 0,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 800),
                          child: CustomShadowCard(
                            name: "Call",
                            onTap: () async {
                              await launchUrl(Uri.parse('tel:+917007042761'));
                            },
                            height: 70,
                            width: 70,
                            image: "assets/images/telephone.webp",
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        AnimatedOpacity(
                          opacity: doAnimate ? 1 : 0,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds: 1000),
                          child: CustomShadowCard(
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
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        : Container(
            // color: Colors.white,
            // width: w,
            // height: h - (h * .6 * offsetPercentage),
            height: widget.h - 100,
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(minHeight: 300),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NormalText("Aviral Dixit",
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        letterSpacing: 6,
                        color:
                            Provider.of<ThemeProvider>(context).getThemeColor),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      opacity: doAnimate ? 1 : 0,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 200),
                      child: CustomShadowCard(
                        name: "Gmail",
                        onTap: () async {
                          await launchUrl(
                              Uri.parse("mailto:aviral.dixit2110@gmail.com"));
                        },
                        height: 45,
                        width: 45,
                        image: "assets/images/gmail.webp",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedOpacity(
                      opacity: doAnimate ? 1 : 0,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 400),
                      child: CustomShadowCard(
                        name: "Linkdin",
                        onTap: () async {
                          await launchUrl(Uri.parse(
                              "https://www.linkedin.com/in/aviral-dixit/"));
                        },
                        height: 45,
                        width: 45,
                        image: "assets/images/linkedin.webp",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedOpacity(
                      opacity: doAnimate ? 1 : 0,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 600),
                      child: CustomShadowCard(
                        name: "Github",
                        onTap: () async {
                          await launchUrl(
                              Uri.parse("https://github.com/aviral2910"));
                        },
                        height: 45,
                        width: 45,
                        image: "assets/images/github.webp",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedOpacity(
                      opacity: doAnimate ? 1 : 0,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 800),
                      child: CustomShadowCard(
                        name: "Call",
                        onTap: () async {
                          await launchUrl(Uri.parse('tel:+917007042761'));
                        },
                        height: 45,
                        width: 45,
                        image: "assets/images/telephone.webp",
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    AnimatedOpacity(
                      opacity: doAnimate ? 1 : 0,
                      curve: Curves.easeIn,
                      duration: Duration(milliseconds: 1000),
                      child: CustomShadowCard(
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
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
  }
}
