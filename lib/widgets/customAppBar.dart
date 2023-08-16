
import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/widgets/shadowText.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key, required this.scrollController}) : super(key: key);
  ScrollController scrollController;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.scrollController.addListener(() {
      if (widget.scrollController.offset > 350) {
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
    return w < mobileSize
        ? AppBar(
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
                          Image.asset(
                            "assets/images/aviraldp.png",
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ShadowText("Aviral Dixit",
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                              color: Colors.white)
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.menu,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          )
        : AppBar(
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
                                Image.asset("assets/images/aviraldp.png"),
                                const SizedBox(
                                  width: 10,
                                ),
                                ShadowText("Aviral Dixit",
                                    fontWeight: FontWeight.w800,
                                    fontSize: 24,
                                    color: Colors.white)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ShadowText("HOME",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.white),
                              ShadowText("ABOUT",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.white),
                              ShadowText("PROJECT",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
                                  color: Colors.white),
                              ShadowText("CONTACT",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18,
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
                              Image.asset("assets/images/aviraldp.png"),
                              const SizedBox(
                                width: 10,
                              ),
                              ShadowText("Aviral Dixit",
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,
                                  color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ShadowText("HOME",
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.white),
                            ShadowText("ABOUT",
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.white),
                            ShadowText("PROJECT",
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
                                color: Colors.white),
                            ShadowText("CONTACT",
                                fontWeight: FontWeight.w300,
                                fontSize: 18,
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
