import 'dart:async';

import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/generalZWidget/replyBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_color_picker_wheel/models/button_behaviour.dart';
import 'package:flutter_color_picker_wheel/presets/animation_config_presets.dart';
import 'package:flutter_color_picker_wheel/presets/color_presets.dart';
import 'package:flutter_color_picker_wheel/widgets/flutter_color_picker_wheel.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:provider/provider.dart';

class GeneralZ extends StatefulWidget {
  const GeneralZ({super.key});

  @override
  State<GeneralZ> createState() => _GeneralZState();
}

class _GeneralZState extends State<GeneralZ>
    with SingleTickerProviderStateMixin {
  BorderRadius _borderRadius = BorderRadius.circular(34);
  double generalZHeight = 68;
  double generalZWidth = 68;
  bool isSearched = false;
  TextEditingController commandController = TextEditingController();
  double generalZBoxHeight = 68;
  double generalZBoxWidth = 68;
  double maxgeneralZBoxHeight = 450;

  double closebtnWidth = 0;
  double closebtnHeight = 0;
  double generalZBoxBorderRadius = 34;
  double generalZLogoHeight = 0;
  double generalZLogoWidth = 0;
  double generalZFontSize = 0;

  bool isClosed = true;
  AlignmentGeometry animationLoader = Alignment.centerLeft;
  final ScrollController messageController = ScrollController();
  List<String> msgList = [];
  @override
  void initState() {
    var timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setAnimationForGeneralz();
    });
    super.initState();
  }

  void _scrollDown() {
    if (messageController.hasClients) messageController.jumpTo(0.0);
  }

  setAnimationForGeneralz() {
    if (animationLoader == Alignment.centerLeft) {
      setState(() {
        animationLoader = Alignment.topLeft;
      });
    } else if (animationLoader == Alignment.topLeft) {
      setState(() {
        animationLoader = Alignment.topCenter;
      });
    } else if (animationLoader == Alignment.topCenter) {
      setState(() {
        animationLoader = Alignment.topRight;
      });
    } else if (animationLoader == Alignment.topRight) {
      setState(() {
        animationLoader = Alignment.centerRight;
      });
    } else if (animationLoader == Alignment.centerRight) {
      setState(() {
        animationLoader = Alignment.bottomRight;
      });
    } else if (animationLoader == Alignment.bottomRight) {
      setState(() {
        animationLoader = Alignment.bottomCenter;
      });
    } else if (animationLoader == Alignment.bottomCenter) {
      setState(() {
        animationLoader = Alignment.bottomLeft;
      });
    } else if (animationLoader == Alignment.bottomLeft) {
      setState(() {
        animationLoader = Alignment.centerLeft;
      });
    }
  }

  List<String> taskList = [
    "Call Chief",
    "Order from Church view",
    "Menu of Zaffran Kitchen",
    "Menu of Zaffran Kitchen"
  ];

  Map<String, HighlightedWord> words = {
    "General Z": HighlightedWord(
      textStyle: TextStyle(
        fontFamily: "Satoshi",
        fontSize: 12,
        color: themeClor,
        fontWeight: FontWeight.w400,
      ),
    ),
  };
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double maxgeneralZBoxHWidth = 300;
    print("rebuilding");
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0, right: 20),
      child: Stack(
        children: [
          SizedBox(
            height: maxgeneralZBoxHeight + 10,
            width: maxgeneralZBoxHWidth + 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(
                      generalZBoxHeight == maxgeneralZBoxHeight ? 2.5 : 0),
                  decoration: BoxDecoration(
                      gradient: RadialGradient(
                          center: animationLoader,
                          radius: .9,
                          colors: [themeClor, Color.fromRGBO(58, 62, 50, 1)]),
                      borderRadius: BorderRadius.only(
                          bottomRight:
                              _borderRadius == BorderRadius.circular(13)
                                  ? const Radius.circular(13)
                                  : const Radius.circular(34),
                          bottomLeft: _borderRadius == BorderRadius.circular(13)
                              ? const Radius.circular(13)
                              : const Radius.circular(34),
                          topRight: Radius.circular(generalZBoxBorderRadius),
                          topLeft: Radius.circular(generalZBoxBorderRadius)),
                      color: themeClor),
                  child: AnimatedContainer(
                    curve: generalZBoxHeight == maxgeneralZBoxHeight
                        ? Curves.bounceOut
                        : Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 600),
                    height: generalZBoxHeight,
                    width: generalZBoxWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight:
                                _borderRadius == BorderRadius.circular(13)
                                    ? const Radius.circular(13)
                                    : const Radius.circular(34),
                            bottomLeft:
                                _borderRadius == BorderRadius.circular(13)
                                    ? const Radius.circular(13)
                                    : const Radius.circular(34),
                            topRight: Radius.circular(generalZBoxBorderRadius),
                            topLeft: Radius.circular(generalZBoxBorderRadius)),
                        color: const Color.fromRGBO(
                          15,
                          15,
                          15,
                          1,
                        )),
                    child: InkWell(
                      onDoubleTap: () {},
                      onTap: () {
                        if (isClosed) {
                          setState(() {
                            isClosed = false;
                            generalZBoxHeight = 48;
                            generalZBoxWidth = 48;
                            generalZHeight = 48;
                            generalZWidth = 48;
                            generalZBoxBorderRadius = 0;
                            _borderRadius = BorderRadius.circular(0);
                          });
                          Timer(
                            const Duration(milliseconds: 600),
                            () {
                              setState(() {
                                generalZBoxWidth = maxgeneralZBoxHWidth;
                                generalZWidth = maxgeneralZBoxHWidth;

                                _borderRadius = BorderRadius.circular(13);
                              });
                            },
                          );
                          Timer(
                            const Duration(milliseconds: 1200),
                            () {
                              setState(() {
                                generalZBoxBorderRadius = 35;
                                generalZBoxHeight = maxgeneralZBoxHeight;
                              });
                            },
                          );
                          Timer(
                            const Duration(milliseconds: 1600),
                            () {
                              setState(() {
                                closebtnHeight = 45;
                                closebtnWidth = 45;
                              });
                            },
                          );
                          Timer(
                            const Duration(milliseconds: 1900),
                            () {
                              setState(() {
                                generalZLogoHeight = 31;
                                generalZLogoWidth = 31;
                                generalZFontSize = 14;
                              });
                            },
                          );
                          Timer(
                            const Duration(milliseconds: 2200),
                            () {
                              setState(() {
                                _scrollDown();
                              });
                            },
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          AnimatedContainer(
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 600),
                            height: generalZHeight,
                            width: generalZWidth,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      offset: const Offset(-2, -2),
                                      color: Provider.of<ThemeProvider>(context)
                                          .getThemeColor
                                          .withOpacity(.8)),
                                  BoxShadow(
                                      blurRadius: 1.5,
                                      offset: const Offset(1.5, 1.5),
                                      color: Provider.of<ThemeProvider>(context)
                                          .getThemeColor
                                          .withOpacity(.8)),
                                ],
                                // border: Border.all(color: themeColor),
                                color: const Color.fromARGB(255, 19, 19, 19),
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                                child: generalZHeight == 68
                                    ? Icon(Icons.color_lens_sharp,
                                        size: 35,
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                .getThemeColor)
                                    : Container(
                                        width: maxgeneralZBoxHWidth,
                                        height: 48,
                                        child: Container(
                                          width: maxgeneralZBoxHWidth,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 19, 19, 19),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (generalZBoxHeight == maxgeneralZBoxHeight)
            Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onDoubleTap: () {},
                  onTap: () async {
                    if (!isClosed) {
                      setState(() {
                        isClosed = true;
                        generalZFontSize = 0;

                        generalZLogoHeight = 0;
                        generalZLogoWidth = 0;

                        // generalZBoxWidth = 0;
                        closebtnHeight = 0;
                        closebtnWidth = 0;
                      });
                      Timer(
                        const Duration(milliseconds: 300),
                        () {
                          setState(() {
                            generalZBoxHeight = 48;
                          });
                        },
                      );
                      Timer(
                        const Duration(milliseconds: 900),
                        () {
                          setState(() {
                            generalZBoxWidth = 48;
                            generalZWidth = 48;
                          });
                        },
                      );
                      Timer(
                        const Duration(milliseconds: 1200),
                        () {
                          setState(() {
                            generalZBoxHeight = 68;
                            generalZBoxWidth = 68;
                            generalZHeight = 68;
                            generalZWidth = 68;
                            _borderRadius = BorderRadius.circular(34);
                          });
                        },
                      );
                    }
                  },
                  child: AnimatedContainer(
                    curve: closebtnWidth != 45
                        ? Curves.bounceIn
                        : Curves.elasticOut,
                    duration: const Duration(milliseconds: 300),
                    height: closebtnHeight,
                    width: closebtnWidth,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              offset: const Offset(-2, -2),
                              color: Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.8)),
                          BoxShadow(
                              blurRadius: 1.5,
                              offset: const Offset(1.5, 1.5),
                              color: Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.8)),
                        ],
                        color: const Color.fromARGB(255, 19, 19, 19),
                        borderRadius: BorderRadius.circular(45)),
                    child: Center(
                      child: Icon(
                        Icons.close,
                        size: closebtnWidth / 2,
                        color: themeClor,
                      ),
                    ),
                  ),
                )),
        ],
      ),
    );
  }
}
