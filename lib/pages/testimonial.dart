import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/widgets/customShadowCard.dart';
import 'package:aviralportfolio/widgets/Common/headingCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/themeProvider.dart';

class Testimonial extends StatefulWidget {
  const Testimonial(
      {super.key, required this.scrollController, required this.height});
  final ScrollController scrollController;
  final double height;
  @override
  State<Testimonial> createState() => _TestimonialState();
}

final testimonialPositionKey = GlobalKey();

class _TestimonialState extends State<Testimonial> {
  RenderBox? box;
  double? y;
  Offset? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      box ??= testimonialPositionKey.currentContext!.findRenderObject()
          as RenderBox;
      position = box!.localToGlobal(Offset.zero); //this is global position

      if (position!.dy < widget.height * .6) {
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

  List<Map<String, String>> testimonial = [
    {
      "image": "assets/images/roshan.png",
      "name": "Roshann Vadassery ",
      "role": "Founder - Chief",
      "companyName": "Permissionless",
      "myRole": "Flutter Team Lead",
      "words":
          "Aviral is one of the most proficient flutter developers that I have worked with, his contributions in building krishn.ai is irreplaceable. Very good at co ordinating with multiple designers and product managers.",
      "duration": "Jan 2022 - April 2023",
      "linkdinlink": "https://www.linkedin.com/in/roshan-vadassery/",
    },
    {
      "image": "assets/images/nishank.png",
      "name": "Nishank Sidhpura",
      "role": "Chief Technical Officer",
      "companyName": "Permissionless",
      "myRole": "Flutter Team Lead",
      "words":
          "Aviral is a really hard working person who doesn't stop until the task at hand is completed. Commendable critical thinking and fundamental knowledge. Makes him a no-brainer for any Mobile development projects.",
      "duration": "Jan 2022 - April 2023",
      "linkdinlink": "https://www.linkedin.com/in/nishank-s-8141aab5/",
    }
  ];
  int selectedIndex = 0;

  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SizedBox(
      key: testimonialPositionKey,
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .2,
          ),
          HeadingCard(
            icon: "assets/images/testimonial.png",
            text: "TESTIMONIAL",
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 60 : 80,
          ),
          if (w <= mobileSize)
            SizedBox(
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 35,
                      bottom: 20,
                      left: w < mobileSize ? 20 : 35,
                      right: w < mobileSize ? 20 : 35,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ArrowButton(
                              onTap: () {
                                if (selectedIndex > 0) {
                                  setState(() {
                                    selectedIndex--;
                                  });
                                }
                              },
                              icon: Icons.arrow_back,
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            ArrowButton(
                              onTap: () {
                                if (selectedIndex < 1) {
                                  setState(() {
                                    selectedIndex++;
                                  });
                                }
                              },
                              icon: Icons.arrow_forward,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: selectedIndex == 0
                                      ? Provider.of<ThemeProvider>(context)
                                          .getThemeColor
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: selectedIndex == 1
                                      ? Provider.of<ThemeProvider>(context)
                                          .getThemeColor
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TestimonialCard(
                    w: w,
                    image: testimonial[selectedIndex]["image"],
                    name: testimonial[selectedIndex]["name"],
                    role: testimonial[selectedIndex]["role"],
                    companyName: testimonial[selectedIndex]["companyName"],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w < mobileSize ? 20 : 35,
                      right: w < mobileSize ? 20 : 35,
                    ),
                    child: TestimonialText(
                      w: w,
                      myRole: testimonial[selectedIndex]["myRole"],
                      words: testimonial[selectedIndex]["words"],
                      duration: testimonial[selectedIndex]["duration"],
                      linkdinlink: testimonial[selectedIndex]["linkdinlink"],
                    ),
                  ),
                ],
              ),
            ),
          if (w > mobileSize)
            SizedBox(
              width: w,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 55),
                  constraints: const BoxConstraints(maxWidth: 1400),
                  // width: w < 1000 ? w * .89 : w * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TestimonialCard(
                        w: w,
                        image: testimonial[selectedIndex]["image"],
                        name: testimonial[selectedIndex]["name"],
                        role: testimonial[selectedIndex]["role"],
                        companyName: testimonial[selectedIndex]["companyName"],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(
                                  "assets/images/qmark.png",
                                  color: Colors.white30,
                                ),
                                Row(
                                  children: [
                                    ArrowButton(
                                      onTap: () {
                                        if (selectedIndex > 0) {
                                          setState(() {
                                            selectedIndex--;
                                          });
                                        }
                                      },
                                      icon: Icons.arrow_back,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    ArrowButton(
                                      onTap: () {
                                        if (selectedIndex < 1) {
                                          setState(() {
                                            selectedIndex++;
                                          });
                                        }
                                      },
                                      icon: Icons.arrow_forward,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TestimonialText(
                              w: w,
                              myRole: testimonial[selectedIndex]["myRole"],
                              words: testimonial[selectedIndex]["words"],
                              duration: testimonial[selectedIndex]["duration"],
                              linkdinlink: testimonial[selectedIndex]
                                  ["linkdinlink"],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          if (w > mobileSize)
            const SizedBox(
              height: 50,
            ),
          if (w > mobileSize)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: selectedIndex == 0
                          ? Provider.of<ThemeProvider>(context).getThemeColor
                          : Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: selectedIndex == 1
                          ? Provider.of<ThemeProvider>(context).getThemeColor
                          : Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
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

class ArrowButton extends StatefulWidget {
  ArrowButton({super.key, required this.icon, required this.onTap});
  IconData icon;
  void Function()? onTap;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: 55,
        width: 55,
        child: Align(
          alignment: ishover ? Alignment.topCenter : Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ishover
                        ? [
                            const Color.fromARGB(255, 19, 19, 19),
                            const Color.fromARGB(255, 15, 15, 15)
                          ]
                        : [
                            const Color.fromARGB(255, 15, 15, 15),
                            const Color.fromARGB(255, 19, 19, 19),
                          ]),
                // color: darkthemeColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: !ishover ? 2 : 7,
                      offset: !ishover
                          ? const Offset(-2, -2)
                          : const Offset(-8, -8),
                      color: !ishover
                          ? Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.8)
                          : const Color.fromARGB(121, 32, 32, 32)),
                  BoxShadow(
                      blurRadius: !ishover ? 2 : 8,
                      offset:
                          !ishover ? const Offset(2, 2) : const Offset(8, 8),
                      color: !ishover
                          ? Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.8)
                          : const Color.fromARGB(121, 15, 15, 15))
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Icon(
                widget.icon,
                color: ishover
                    ? Provider.of<ThemeProvider>(context).getThemeColor
                    : Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TestimonialText extends StatefulWidget {
  TestimonialText({
    Key? key,
    required this.myRole,
    required this.duration,
    required this.linkdinlink,
    required this.words,
    required this.w,
  }) : super(key: key);

  final double w;
  String? duration;
  String? linkdinlink;
  String? words;
  String? myRole;

  @override
  State<TestimonialText> createState() => _TestimonialTextState();
}

class _TestimonialTextState extends State<TestimonialText> {
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
        duration: const Duration(milliseconds: 250),
        width: double.infinity,
        // height: 300,
        constraints: const BoxConstraints(minHeight: 340),
        padding: EdgeInsets.only(
            left: widget.w < mobileSize ? 20 : 35,
            right: widget.w < mobileSize ? 20 : 35,
            top: widget.w < mobileSize ? 20 : 25,
            bottom: widget.w < mobileSize ? 20 : 25),

        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: ishover
                    ? [
                        const Color.fromARGB(255, 19, 19, 19),
                        const Color.fromARGB(255, 15, 15, 15)
                      ]
                    : [
                        const Color.fromARGB(255, 15, 15, 15),
                        const Color.fromARGB(255, 19, 19, 19),
                      ]),
            // color: darkthemeColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: ishover ? 2 : 7,
                  offset: ishover ? const Offset(-2, -2) : const Offset(-8, -8),
                  color: ishover
                      ? Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.8)
                      : const Color.fromARGB(121, 32, 32, 32)),
              BoxShadow(
                  blurRadius: ishover ? 2 : 8,
                  offset: ishover ? const Offset(2, 2) : const Offset(8, 8),
                  color: ishover
                      ? Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.8)
                      : const Color.fromARGB(121, 15, 15, 15))
            ],
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.myRole.toString(),
              style: GoogleFonts.titilliumWeb(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  color: ishover
                      ? Provider.of<ThemeProvider>(context).getThemeColor
                      : const Color.fromARGB(255, 224, 238, 248)),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              widget.duration.toString(),
              style: GoogleFonts.titilliumWeb(
                  fontSize: 15,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(140, 255, 255, 255)),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 2,
              width: widget.w,
              color: const Color.fromARGB(200, 11, 11, 11),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              widget.words.toString(),
              textAlign: TextAlign.justify,
              style: GoogleFonts.saira(
                  fontSize: 17,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(140, 255, 255, 255)),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomShadowCard(
                name: "Linkdin",
                onTap: () async {
                  await launchUrl(Uri.parse(widget.linkdinlink.toString()));
                },
                height: 60,
                width: 60,
                image: "assets/images/linkedin.png",
              ),
              // child: InkWell(
              //   onTap: () {
              //     launchUrl(Uri.parse(linkdinlink.toString()));
              //   },
              //   child: Container(
              //     height: 50,
              //     width: 50,
              //     decoration: BoxDecoration(
              //         color: darkthemeColor,
              //         boxShadow: const [
              //           BoxShadow(
              //               blurRadius: 4,
              //               offset: Offset(-6, -6),
              //               color: Color.fromARGB(220, 32, 32, 32)),
              //           BoxShadow(
              //               blurRadius: 5,
              //               offset: Offset(6, 6),
              //               color: Color.fromARGB(220, 15, 15, 15))
              //         ],
              //         borderRadius: BorderRadius.circular(4)),
              //     child: Center(
              //       child: Image.asset(
              //         "assets/images/linkedin.png",
              //         width: 20,
              //         height: 20,
              //       ),
              //     ),
              //   ),
              // ),
            )
          ],
        ),
      ),
    );
  }
}

class TestimonialCard extends StatefulWidget {
  TestimonialCard({
    required this.name,
    required this.image,
    required this.companyName,
    required this.role,
    Key? key,
    required this.w,
  }) : super(key: key);
  String? name;
  String? image;
  String? companyName;
  String? role;
  final double w;

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: widget.w < mobileSize ? 20 : 35,
          right: widget.w < mobileSize ? 20 : 35),
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            ishover = value;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
              left: widget.w < mobileSize ? 20 : 35,
              right: widget.w < mobileSize ? 20 : 35,
              top: widget.w < mobileSize ? 20 : 25,
              bottom: widget.w < mobileSize ? 20 : 25),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: ishover ? 2 : 7,
                    offset:
                        ishover ? const Offset(-2, -2) : const Offset(-8, -8),
                    color: ishover
                        ? Provider.of<ThemeProvider>(context)
                            .getThemeColor
                            .withOpacity(.8)
                        : const Color.fromARGB(121, 32, 32, 32)),
                BoxShadow(
                    blurRadius: ishover ? 2 : 8,
                    offset: ishover ? const Offset(2, 2) : const Offset(8, 8),
                    color: ishover
                        ? Provider.of<ThemeProvider>(context)
                            .getThemeColor
                            .withOpacity(.8)
                        : const Color.fromARGB(121, 15, 15, 15))
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ishover
                      ? [
                          const Color.fromARGB(255, 19, 19, 19),
                          const Color.fromARGB(255, 15, 15, 15)
                        ]
                      : [
                          const Color.fromARGB(255, 15, 15, 15),
                          const Color.fromARGB(255, 19, 19, 19),
                        ]),
              borderRadius: BorderRadius.circular(10)),
          // decoration: BoxDecoration(
          //     color: darkthemeColor,
          //     boxShadow: const [
          //       BoxShadow(
          //           blurRadius: 4,
          //           offset: Offset(-6, -6),
          //           color: Color.fromARGB(220, 32, 32, 32)),
          //       BoxShadow(
          //           blurRadius: 5,
          //           offset: Offset(6, 6),
          //           color: Color.fromARGB(220, 15, 15, 15))
          //     ],
          //     borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: widget.w,
                constraints:
                    BoxConstraints(maxWidth: widget.w < mobileSize ? 400 : 280),
                decoration: BoxDecoration(
                    color: Provider.of<ThemeProvider>(context)
                        .getThemeColor
                        .withOpacity(.04),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-3, -3),
                          color: Color.fromARGB(255, 12, 12, 12)),
                      BoxShadow(
                          blurRadius: 2,
                          offset: Offset(3, 3),
                          color: Color.fromARGB(255, 32, 32, 32))
                    ],
                    border: Border.all(
                        color: const Color.fromARGB(255, 19, 19, 19))),
                child: Padding(
                  padding: EdgeInsets.all(!ishover ? 0 : 8.0),
                  child: Column(
                    children: [
                      Container(
                        width: widget.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: const Color.fromARGB(255, 19, 19, 19)),
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor
                                .withOpacity(.75),
                            borderRadius: BorderRadius.circular(
                              !ishover ? 266 : 250,
                            )),
                        child: Image.asset(
                          widget.image.toString(),
                          width: !ishover ? 266 : 250,
                          height: !ishover ? 266 : 250,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.companyName.toString(),
                style: GoogleFonts.titilliumWeb(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Provider.of<ThemeProvider>(context).getThemeColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.name.toString(),
                style: GoogleFonts.titilliumWeb(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 224, 238, 248)),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                widget.role.toString(),
                style: GoogleFonts.titilliumWeb(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: Colors.white54),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
