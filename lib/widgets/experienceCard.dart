import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

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
                  const SizedBox(
                    width: 28,
                  ),
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: ishover
                            ? themeColor.withOpacity(.7)
                            : darkthemeColor,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 4, color: Colors.black)),
                  ),
                  Container(
                    width: 20,
                    height: 4,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    top: ishover ? 0 : 5, bottom: ishover ? 5 : 0),
                child: Container(
                    // height: 200,
                    // width: w - 110,
                    padding: const EdgeInsets.only(
                        left: 35, right: 35, top: 25, bottom: 25),
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
                    child: widget.child),
              ),
            )
          ],
        ),
      ),
    );
  }
}
