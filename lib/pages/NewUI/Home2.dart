import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/NewUI/ChatPage.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
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
  Widget build(BuildContext context) {
    return widget.w >= mobileSize
        ? Container(
            height: widget.h,
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(minHeight: 400),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NormalRichText("Hi, I’m ", "Aviral Dixit",
                        fontWeight: FontWeight.w800,
                        fontSize: 55,
                        letterSpacing: 2,
                        color: Colors.white)
                    .animate()
                    .fadeIn(delay: .1.seconds, duration: .7.seconds),
                const SizedBox(
                  height: 10,
                ),
                NormalText("SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        letterSpacing: 2,
                        color: Colors.white)
                    .animate()
                    .fadeIn(delay: .1.seconds, duration: .7.seconds),
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
                            color: Colors.white)
                        .animate()
                        .fadeIn(delay: .1.seconds, duration: .7.seconds)
                        .slideY(delay: .1.seconds, duration: .7.seconds),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomShadowCard(
                          name: "Gmail",
                          onTap: () async {
                            await launchUrl(
                                Uri.parse("mailto:aviral.dixit2110@gmail.com"));
                          },
                          height: 70,
                          width: 70,
                          image: "assets/images/gmail.webp",
                        )
                            .animate()
                            .fadeIn(delay: .3.seconds, duration: .7.seconds)
                            .slideX(
                              delay: .3.seconds,
                              duration: .7.seconds,
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
                        )
                            .animate()
                            .fadeIn(delay: .1.seconds, duration: .7.seconds)
                            .slideX(
                              delay: .1.seconds,
                              duration: .7.seconds,
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
                          height: 70,
                          width: 70,
                          image: "assets/images/github.webp",
                        )
                            .animate()
                            .fadeIn(delay: .5.seconds, duration: .7.seconds),
                        const SizedBox(
                          width: 20,
                        ),
                        CustomShadowCard(
                          name: "Call",
                          onTap: () async {
                            await launchUrl(Uri.parse('tel:+917007042761'));
                          },
                          height: 70,
                          width: 70,
                          image: "assets/images/telephone.webp",
                        )
                            .animate()
                            .fadeIn(delay: .1.seconds, duration: .7.seconds)
                            .slideX(
                                delay: .1.seconds,
                                duration: .7.seconds,
                                end: 0,
                                begin: 1),
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
                            .animate()
                            .fadeIn(delay: .3.seconds, duration: .7.seconds)
                            .slideX(
                                delay: .3.seconds,
                                duration: .7.seconds,
                                end: 0,
                                begin: 1),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AIShadowButton(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: const Chatpage()));
                      },
                      isLoading: false,
                    )
                        .animate()
                        .fadeIn(delay: .1.seconds, duration: .7.seconds)
                        .slideY(
                            delay: .1.seconds,
                            duration: .7.seconds,
                            begin: 1,
                            end: 0),
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
            constraints: const BoxConstraints(minHeight: 400),
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
                ).animate().fadeIn(delay: .5.seconds, duration: .7.seconds),
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                    )
                        .animate()
                        .fadeIn(delay: .3.seconds, duration: .7.seconds)
                        .slideX(
                          delay: .3.seconds,
                          duration: .7.seconds,
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
                    )
                        .animate()
                        .fadeIn(delay: .1.seconds, duration: .7.seconds)
                        .slideX(
                          delay: .1.seconds,
                          duration: .7.seconds,
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
                    ).animate().fadeIn(delay: .5.seconds, duration: .7.seconds),
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
                    )
                        .animate()
                        .fadeIn(delay: .3.seconds, duration: .7.seconds)
                        .slideX(
                            delay: .3.seconds,
                            duration: .7.seconds,
                            begin: 1,
                            end: 0),
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
                        .animate()
                        .fadeIn(delay: .1.seconds, duration: .7.seconds)
                        .slideX(
                            delay: .1.seconds,
                            duration: .7.seconds,
                            begin: 1,
                            end: 0),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                AIShadowButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: const Chatpage()));
                  },
                  isLoading: false,
                )
                    .animate()
                    .fadeIn(delay: .1.seconds, duration: .7.seconds)
                    .slideY(
                        delay: .1.seconds,
                        duration: .7.seconds,
                        begin: 1,
                        end: 0),
              ],
            ),
          );
  }
}

class AIShadowButton extends StatefulWidget {
  AIShadowButton({
    required this.onTap,
    required this.isLoading,
    Key? key,
  }) : super(key: key);

  void Function()? onTap;
  bool isLoading;
  @override
  State<AIShadowButton> createState() => _AIShadowButtonState();
}

class _AIShadowButtonState extends State<AIShadowButton> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(top: ishover ? 0 : 5, bottom: ishover ? 5 : 0),
        child: Container(
          height: MediaQuery.sizeOf(context).width > mobileSize ? 50 : 45,
          width: 200,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: !ishover ? 1.2 : 4,
                    offset:
                        !ishover ? const Offset(-1, -1) : const Offset(-4, -4),
                    color: ishover
                        ? const Color.fromARGB(121, 42, 42, 42)
                        : Provider.of<ThemeProvider>(context).getThemeColor),
                BoxShadow(
                    blurRadius: !ishover ? 1.2 : 5,
                    offset: !ishover ? const Offset(1, 1) : const Offset(5, 5),
                    color: ishover
                        ? const Color.fromARGB(121, 42, 42, 42)
                        : Provider.of<ThemeProvider>(context).getThemeColor)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ishover
                      ? [
                          const Color.fromARGB(255, 20, 20, 20),
                          const Color.fromARGB(255, 15, 15, 15)
                        ]
                      : [
                          const Color.fromARGB(255, 18, 18, 18),
                          const Color.fromARGB(255, 26, 26, 26),
                        ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator())
                : Row(
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Container(
                          height: 30,
                          width: 30,
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
                            color: darkthemeColor,
                            border: Border.all(
                                color: Provider.of<ThemeProvider>(context)
                                    .getThemeColor),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: Center(
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Image.asset("assets/images/mark.webp")),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Chat With Mark",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.titilliumWeb(
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                            letterSpacing: 1,
                            color: Colors.white),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
