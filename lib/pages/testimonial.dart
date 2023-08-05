import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/headingCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Testimonial extends StatefulWidget {
  Testimonial(
      {super.key, required this.scrollController, required this.height});
  ScrollController scrollController;
  double height;
  @override
  State<Testimonial> createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > widget.height * 2.6) {
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

  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .2,
          ),
          HeadingCard(
            icon: "assets/images/testimonial.png",
            text: "TESTIMONIAL",
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? 60 : 80,
          ),
          if (w <= mobileSize)
            SizedBox(
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TestimonialCard(w: w),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: w < mobileSize ? 20 : 35,
                      right: w < mobileSize ? 20 : 35,
                    ),
                    child: TestimonialText(w: w),
                  )
                ],
              ),
            ),
          if (w > mobileSize)
            SizedBox(
              width: w,
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(left: 25, right: 55),
                  constraints: BoxConstraints(maxWidth: 1400),
                  // width: w < 1000 ? w * .89 : w * .8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TestimonialCard(w: w),
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
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: darkthemeColor,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(-6, -6),
                                                color: Color.fromARGB(
                                                    220, 32, 32, 32)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(6, 6),
                                                color: Color.fromARGB(
                                                    220, 15, 15, 15))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: darkthemeColor,
                                          boxShadow: const [
                                            BoxShadow(
                                                blurRadius: 4,
                                                offset: Offset(-6, -6),
                                                color: Color.fromARGB(
                                                    220, 32, 32, 32)),
                                            BoxShadow(
                                                blurRadius: 5,
                                                offset: Offset(6, 6),
                                                color: Color.fromARGB(
                                                    220, 15, 15, 15))
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Center(
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: themeColor,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TestimonialText(w: w),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            height: changeAppBar ? h * .1 : h * .2,
          ),
        ],
      ),
    );
  }
}

class TestimonialText extends StatelessWidget {
  const TestimonialText({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 300,
      constraints: BoxConstraints(minHeight: 340),
      padding: EdgeInsets.only(
          left: w < mobileSize ? 20 : 35,
          right: w < mobileSize ? 20 : 35,
          top: w < mobileSize ? 20 : 25,
          bottom: w < mobileSize ? 20 : 25),
      // decoration: BoxDecoration(
      //     boxShadow: const [
      //       BoxShadow(
      //           blurRadius: 7,
      //           offset: Offset(-8, -8),
      //           color: Color.fromARGB(121, 32, 32, 32)),
      //       BoxShadow(
      //           blurRadius: 10,
      //           offset: Offset(8, 8),
      //           color: Color.fromARGB(121, 15, 15, 15))
      //     ],
      //     gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         colors: true
      //             ? [
      //                 Color.fromARGB(255, 19, 19, 19),
      //                 Color.fromARGB(255, 15, 15, 15)
      //               ]
      //             : [
      //                 Color.fromARGB(255, 15, 15, 15),
      //                 Color.fromARGB(255, 19, 19, 19),
      //               ]),
      //     borderRadius: BorderRadius.circular(10)),
      decoration: BoxDecoration(
          color: darkthemeColor,
          boxShadow: const [
            BoxShadow(
                blurRadius: 4,
                offset: Offset(-6, -6),
                color: Color.fromARGB(220, 32, 32, 32)),
            BoxShadow(
                blurRadius: 5,
                offset: Offset(6, 6),
                color: Color.fromARGB(220, 15, 15, 15))
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Flutter Team Lead",
            style: GoogleFonts.titilliumWeb(
                fontSize: 27,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 224, 238, 248)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Jan 2022 - April 2023",
            style: GoogleFonts.titilliumWeb(
                fontSize: 15,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(140, 255, 255, 255)),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 2,
            width: w,
            color: Color.fromARGB(200, 11, 11, 11),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Aviral is a really hard working person who doesn't stop until the task at hand is completed. Commendable critical thinking and fundamental knowledge. Makes him a no-brainer for any Mobile development projects.",
            style: GoogleFonts.titilliumWeb(
                fontSize: 17,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(140, 255, 255, 255)),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: darkthemeColor,
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 4,
                        offset: Offset(-6, -6),
                        color: Color.fromARGB(220, 32, 32, 32)),
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(6, 6),
                        color: Color.fromARGB(220, 15, 15, 15))
                  ],
                  borderRadius: BorderRadius.circular(4)),
              child: Center(
                child: Image.asset(
                  "assets/images/linkedin.png",
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TestimonialCard extends StatefulWidget {
  const TestimonialCard({
    Key? key,
    required this.w,
  }) : super(key: key);

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
        child: Container(
          padding: EdgeInsets.only(
              left: widget.w < mobileSize ? 20 : 35,
              right: widget.w < mobileSize ? 20 : 35,
              top: widget.w < mobileSize ? 20 : 25,
              bottom: widget.w < mobileSize ? 20 : 25),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 7,
                    offset: Offset(-8, -8),
                    color: Color.fromARGB(121, 32, 32, 32)),
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(8, 8),
                    color: Color.fromARGB(121, 15, 15, 15))
              ],
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: ishover
                      ? [
                          Color.fromARGB(255, 19, 19, 19),
                          Color.fromARGB(255, 15, 15, 15)
                        ]
                      : [
                          Color.fromARGB(255, 15, 15, 15),
                          Color.fromARGB(255, 19, 19, 19),
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
              Container(
                width: widget.w,
                constraints:
                    BoxConstraints(maxWidth: widget.w < mobileSize ? 400 : 280),
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      blurRadius: 3,
                      offset: Offset(-3, -3),
                      color: Color.fromARGB(255, 12, 12, 12)),
                  BoxShadow(
                      blurRadius: 2,
                      offset: Offset(3, 3),
                      color: Color.fromARGB(255, 32, 32, 32))
                ], border: Border.all(color: Color.fromARGB(255, 19, 19, 19))),
                child: Padding(
                  padding: EdgeInsets.all(!ishover ? 0 : 8.0),
                  child: Image.asset(
                    "assets/images/nishank.png",
                    width: !ishover ? 266 : 250,
                    height: !ishover ? 266 : 250,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Permissionless",
                style: GoogleFonts.titilliumWeb(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: themeColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nishank Sidhpure",
                style: GoogleFonts.titilliumWeb(
                    fontSize: 27,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 224, 238, 248)),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Chief Technical Officer",
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
