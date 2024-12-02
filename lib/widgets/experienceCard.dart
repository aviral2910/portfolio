import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common/global.dart';

class ExperienceCard extends StatefulWidget {
  ExperienceCard({
    required this.child,
    Key? key,
  }) : super(key: key);
  Widget? child;
  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                children: [
                  SizedBox(
                    width: (w < mobileSize) ? 0 : 28,
                  ),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: ishover
                            ? Provider.of<ThemeProvider>(context)
                                .getThemeColor
                                .withOpacity(.7)
                            : darkthemeColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 4, color: Colors.black)),
                  ),
                  Container(
                    width: w < mobileSize ? 10 : 20,
                    height: 4,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Expanded(
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.only(
                    left: 5,
                    right: 5,
                    top: ishover ? 0 : 5,
                    bottom: ishover ? 5 : 0),
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    // height: 200,
                    // width: w - 110,
                    padding: EdgeInsets.only(
                        left: w < mobileSize ? 20 : 35,
                        right: w < mobileSize ? 20 : 35,
                        top: w < mobileSize ? 20 : 25,
                        bottom: w < mobileSize ? 20 : 25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: ishover ? 2 : 7,
                              offset: ishover
                                  ? const Offset(-2, -2)
                                  : const Offset(-8, -8),
                              color: ishover
                                  ? Provider.of<ThemeProvider>(context)
                                      .getThemeColor
                                      .withOpacity(.65)
                                  : const Color.fromARGB(121, 32, 32, 32)),
                          BoxShadow(
                              blurRadius: ishover ? 2 : 10,
                              offset: ishover
                                  ? const Offset(2, 2)
                                  : const Offset(8, 8),
                              color: ishover
                                  ? Provider.of<ThemeProvider>(context)
                                      .getThemeColor
                                      .withOpacity(.55)
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
                    child: widget.child),
              ),
            )
          ],
        ),
      ),
    );
  }
}
