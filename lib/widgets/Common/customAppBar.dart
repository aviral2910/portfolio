import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/about.dart';
import 'package:aviralportfolio/pages/contact.dart';
import 'package:aviralportfolio/pages/project.dart';
import 'package:aviralportfolio/pages/testimonial.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/widgets/shadowText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key, this.scrollController, this.isnotHome, this.child})
      : super(key: key);
  ScrollController? scrollController;
  bool? isnotHome;
  Widget? child;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.scrollController != null) {
      widget.scrollController!.addListener(() {
        if (widget.scrollController!.offset > 350) {
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
  }

  scrolltoSection(GlobalKey<State<StatefulWidget>> globalKey) {
    RenderBox? box;
    Offset? position;
    box ??= globalKey.currentContext!.findRenderObject() as RenderBox;
    position = box.localToGlobal(Offset(0, widget.scrollController!.offset));
    widget.scrollController!.animateTo(position.dy - 50,
        duration: Duration(milliseconds: 400), curve: Curves.ease);
  }

  bool changeAppBar = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return w < mobileSize
        ? AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          if (widget.isnotHome != null)
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          Container(
                            color: Provider.of<ThemeProvider>(context)
                                .getThemeColor
                                .withOpacity(.7),
                            child: Image.asset(
                              "assets/images/aviraldp.png",
                              height: 50,
                              width: 50,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ShadowText("Aviral Dixit", onTap: () {
                            if (widget.isnotHome != null) {
                              Navigator.of(context).pop();
                            } else {
                              widget.scrollController!.animateTo(0,
                                  duration: Duration(milliseconds: 400),
                                  curve: Curves.ease);
                            }
                          },
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Icon(
                  //     Icons.menu,
                  //     size: 20,
                  //     color: Colors.white,
                  //   ),
                  // )
                ],
              ),
            ),
          )
        : AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: changeAppBar ? darkthemeColor : Colors.transparent,
            elevation: 0,
            flexibleSpace: Column(
              children: [
                if (changeAppBar == false)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: changeAppBar ? 0 : 65,
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: [
                                if (widget.isnotHome != null)
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                Container(
                                    color: Provider.of<ThemeProvider>(context)
                                        .getThemeColor
                                        .withOpacity(.7),
                                    child: Image.asset(
                                      "assets/images/aviraldp.png",
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                ShadowText("Aviral Dixit", onTap: () {
                                  if (widget.isnotHome != null) {
                                    Navigator.of(context).pop();
                                  } else {
                                    widget.scrollController!.animateTo(0,
                                        duration: Duration(milliseconds: 400),
                                        curve: Curves.ease);
                                  }
                                },
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                    color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: widget.isnotHome != null
                              ? SizedBox(
                                  child: widget.child,
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ShadowText("HOME", onTap: () {
                                      widget.scrollController!.animateTo(10,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    },
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white),
                                    ShadowText("ABOUT", onTap: () {
                                      scrolltoSection(aboutPositionKey);
                                    },
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white),
                                    ShadowText("PROJECT", onTap: () {
                                      scrolltoSection(projectPositionKey);
                                    },
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white),
                                    ShadowText("TESTIMONIAL", onTap: () {
                                      scrolltoSection(testimonialPositionKey);
                                    },
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white),
                                    ShadowText("CONTACT", onTap: () {
                                      scrolltoSection(contactPositionKey);
                                    },
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white)
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  height: changeAppBar ? 80 : 0,
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              if (widget.isnotHome != null && changeAppBar)
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              Container(
                                  color: Provider.of<ThemeProvider>(context)
                                      .getThemeColor
                                      .withOpacity(.7),
                                  child: Image.asset(
                                      "assets/images/aviraldp.png")),
                              const SizedBox(
                                width: 10,
                              ),
                              ShadowText("Aviral Dixit", onTap: () {
                                if (widget.isnotHome != null) {
                                  Navigator.of(context).pop();
                                } else {
                                  widget.scrollController!.animateTo(0,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.ease);
                                }
                              },
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: widget.isnotHome != null
                            ? SizedBox(
                                child: widget.child,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ShadowText("HOME", onTap: () {
                                    widget.scrollController!.animateTo(10,
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.ease);
                                  },
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white),
                                  ShadowText("ABOUT", onTap: () {
                                    scrolltoSection(aboutPositionKey);
                                  },
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white),
                                  ShadowText("PROJECT", onTap: () {
                                    scrolltoSection(projectPositionKey);
                                  },
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white),
                                  ShadowText("TESTIMONIAL", onTap: () {
                                    scrolltoSection(testimonialPositionKey);
                                  },
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white),
                                  ShadowText("CONTACT", onTap: () {
                                    scrolltoSection(contactPositionKey);
                                  },
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: Colors.white)
                                ],
                              ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
