import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:aviralportfolio/widgets/shadowText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:google_fonts/google_fonts.dart';

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
    await Future.delayed(Duration(milliseconds: 200));
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
                    height: h * .1,
                  ),
                  Container(
                    height: h * .9,
                    width: w,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            alignment: Alignment.topCenter,
                            image:
                                AssetImage("assets/images/aviraldark1.png"))),
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
                                color: const Color.fromRGBO(69, 189, 244, 1)),
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
                    duration: Duration(seconds: 40),
                    autoPlay: true,
                    enableWebMouseHover: true,
                    shakeConstant: ShakeHardConstant2(),
                    child: Image.asset(
                      "assets/images/arrow.png",
                      height: 25,
                      width: 25,
                    ),
                  ))
            ],
          )
        : Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: h * .1,
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
                        duration: Duration(milliseconds: 1000),
                        right: animate ? 0 : -w * .4,
                        child: Container(
                          height: h * .8,
                          width: w,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            alignment: Alignment.centerRight,
                            image: AssetImage(
                              "assets/images/aviraldark1.png",
                            ),
                            fit: BoxFit.fitHeight,
                          )),
                          constraints: const BoxConstraints(
                            minHeight: 600,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        top: h * .2,
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 700),
                        left: animate ? 0 : -w,
                        child: Container(
                          width: w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  NormalText("Hi, I’m ",
                                      fontWeight: FontWeight.w800,
                                      fontSize: 58,
                                      letterSpacing: 2,
                                      color: Colors.white),
                                  NormalText("Aviral Dixit",
                                      fontWeight: FontWeight.w800,
                                      fontSize: 58,
                                      letterSpacing: 10,
                                      color: const Color.fromRGBO(
                                          69, 189, 244, 1)),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              NormalText(
                                  "SOFTWARE ENGINEER, FRONT END & APP DEVELOPER.",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  letterSpacing: 2,
                                  color: Colors.white),
                            ],
                          ),
                        ),
                      )
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
                    duration: Duration(seconds: 40),
                    autoPlay: true,
                    enableWebMouseHover: true,
                    shakeConstant: ShakeHardConstant2(),
                    child: Image.asset(
                      "assets/images/arrow.png",
                      height: 45,
                      width: 45,
                    ),
                  ))
            ],
          );
  }
}
