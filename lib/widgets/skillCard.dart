import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/pages/NewUI/Home2.dart';
import 'package:aviralportfolio/provider/DataProvider.dart';
import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:aviralportfolio/widgets/CustomSkillsCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

import '../provider/themeProvider.dart';

class SkillsCard extends StatefulWidget {
  const SkillsCard({
    Key? key,
    required this.w,
    required this.changeAppBar,
  }) : super(key: key);

  final double w;
  final bool changeAppBar;

  @override
  State<SkillsCard> createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: widget.w,
        constraints: const BoxConstraints(minHeight: 400),
        padding: const EdgeInsets.only(left: 0, right: 00, bottom: 20),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: !isHover ? 3 : 7,
                  offset:
                      !isHover ? const Offset(-3, -3) : const Offset(-8, -8),
                  color: !isHover
                      ? Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.45)
                      : const Color.fromARGB(121, 32, 32, 32)),
              BoxShadow(
                  blurRadius: !isHover ? 2 : 10,
                  offset: !isHover ? const Offset(2, 2) : const Offset(8, 8),
                  color: !isHover
                      ? Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.45)
                      : const Color.fromARGB(121, 15, 15, 15))
            ],
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 20, 20, 20),
                  Color.fromARGB(255, 20, 20, 20),
                  // Color.fromARGB(255, 15, 15, 15),
                  // Color.fromARGB(255, 15, 15, 15)
                ]),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: CustomChooseCard(
                  islight: isHover,
                  height: 55,
                  isHover: Provider.of<SkillTypeProvider>(context).selected ==
                          "Languages"
                      ? true
                      : false,
                  width: widget.w,
                  text: "Languages",
                )),
                Expanded(
                    child: CustomChooseCard(
                  islight: isHover,
                  height: 55,
                  isHover: Provider.of<SkillTypeProvider>(context).selected ==
                          "Frameworks"
                      ? true
                      : false,
                  width: widget.w,
                  text: "Frameworks",
                )),
                Expanded(
                    child: CustomChooseCard(
                  islight: isHover,
                  height: 55,
                  isHover: Provider.of<SkillTypeProvider>(context).selected ==
                          "Others"
                      ? true
                      : false,
                  width: widget.w,
                  text: "Others",
                )),
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn,
              height: widget.changeAppBar ? 30 : 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: [
                  if (Provider.of<SkillTypeProvider>(context).selected ==
                      "Languages")
                    const Languages(),
                  if (Provider.of<SkillTypeProvider>(context).selected ==
                      "Frameworks")
                    const Framework(),
                  if (Provider.of<SkillTypeProvider>(context).selected ==
                      "Others")
                    const Others(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Others extends StatelessWidget {
  const Others({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment:
            w < mobileSize ? WrapAlignment.spaceAround : WrapAlignment.start,
        runSpacing: 25,
        spacing: 25,
        children: [
          for (int i = 0;
              i < Provider.of<SkillListProvider>(context).getSkillList.length;
              i++)
            if (Provider.of<SkillListProvider>(context).getSkillList[i]
                    ["stype"] ==
                "Others")
              CustomSkillsCard(
                height: 100,
                width: 100,
                image: Provider.of<SkillListProvider>(context).getSkillList[i]
                            ["image"] ==
                        ""
                    ? ""
                    : "assets/images/${Provider.of<SkillListProvider>(context).getSkillList[i]["image"]}.webp",
                imagWidth: 35,
                imageHieght: 35,
                experienceLevel: Provider.of<SkillListProvider>(context)
                    .getSkillList[i]["level"],
                text: Provider.of<SkillListProvider>(context)
                    .getSkillList[i]["name"]
                    .toString(),
                fontSize: 12,
              ).animate().fade(
                    delay: (.2 + (.05 * i)).seconds,
                    duration: .4.seconds,
                  ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/adobexd.webp",
          //   imagWidth: 35,
          //   imageHieght: 35,
          //   text: "Adobe Xd",
          //   experienceLevel: "Beginner",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/firebase.webp",
          //   imagWidth: 35,
          //   imageHieght: 35,
          //   text: "Firebase",
          //   experienceLevel: "Advanced",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/figma.webp",
          //   imagWidth: 35,
          //   imageHieght: 35,
          //   text: "Figma",
          //   experienceLevel: "Medium",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "",
          //   imagWidth: 40,
          //   imageHieght: 40,
          //   text: "MVC \nArchitecture",
          //   experienceLevel: "Medium",
          //   fontSize: 12,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "",
          //   text: "MVP \nArchitecture",
          //   experienceLevel: "Medium",
          //   imagWidth: 25,
          //   imageHieght: 25,
          //   fontSize: 12,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/block.webp",
          //   experienceLevel: "Medium",
          //   imagWidth: 30,
          //   imageHieght: 30,
          //   text: "Bloc",
          //   fontSize: 14,
          // ),
        ],
      ),
    );
  }
}

class Framework extends StatelessWidget {
  const Framework({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 25,
        alignment:
            w < mobileSize ? WrapAlignment.spaceAround : WrapAlignment.start,
        spacing: 25,
        children: [
          for (int i = 0;
              i < Provider.of<SkillListProvider>(context).getSkillList.length;
              i++)
            if (Provider.of<SkillListProvider>(context).getSkillList[i]
                    ["stype"] ==
                "Frameworks")
              CustomSkillsCard(
                height: 100,
                width: 100,
                image: Provider.of<SkillListProvider>(context).getSkillList[i]
                            ["image"] ==
                        ""
                    ? ""
                    : "assets/images/${Provider.of<SkillListProvider>(context).getSkillList[i]["image"]}.webp",
                imagWidth: 35,
                imageHieght: 35,
                experienceLevel: Provider.of<SkillListProvider>(context)
                    .getSkillList[i]["level"],
                text: Provider.of<SkillListProvider>(context)
                    .getSkillList[i]["name"]
                    .toString(),
                fontSize: 12,
              ).animate().fade(
                    delay: (.2 + (.05 * i)).seconds,
                    duration: .4.seconds,
                  ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/flutter.webp",
          //   experienceLevel: "Advanced",
          //   imagWidth: 35,
          //   imageHieght: 35,
          //   text: "Flutter",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/react.webp",
          //   experienceLevel: "Beginner",
          //   imagWidth: 40,
          //   imageHieght: 40,
          //   text: "ReactJs",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/springboot.webp",
          //   imagWidth: 25,
          //   imageHieght: 25,
          //   experienceLevel: "Medium",
          //   text: "Spring Boot",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/django.webp",
          //   imagWidth: 30,
          //   imageHieght: 30,
          //   experienceLevel: "Beginner",
          //   text: "Django",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/flask.webp",
          //   experienceLevel: "Beginner",
          //   imageHieght: 30,
          //   imagWidth: 30,
          //   text: "Flask",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/website.webp",
          //   imagWidth: 30,
          //   imageHieght: 30,
          //   experienceLevel: "Beginner",
          //   fontSize: 14,
          //   text: "Web3",
          // ),
        ],
      ),
    );
  }
}

class Languages extends StatelessWidget {
  const Languages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: w,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment:
            w < mobileSize ? WrapAlignment.spaceAround : WrapAlignment.start,
        runSpacing: 25,
        spacing: 25,
        children: [
          for (int i = 0;
              i < Provider.of<SkillListProvider>(context).getSkillList.length;
              i++)
            if (Provider.of<SkillListProvider>(context).getSkillList[i]
                    ["stype"] ==
                "Languages")
              CustomSkillsCard(
                height: 100,
                width: 100,
                image: Provider.of<SkillListProvider>(context).getSkillList[i]
                            ["image"] ==
                        ""
                    ? ""
                    : "assets/images/${Provider.of<SkillListProvider>(context).getSkillList[i]["image"]}.webp",
                imagWidth: 35,
                imageHieght: 35,
                experienceLevel: Provider.of<SkillListProvider>(context)
                    .getSkillList[i]["level"],
                text: Provider.of<SkillListProvider>(context)
                    .getSkillList[i]["name"]
                    .toString(),
                fontSize: 12,
              ).animate().fade(
                    delay: (.2 + (.05 * i)).seconds,
                    duration: .4.seconds,
                  ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/dart.webp",
          //   experienceLevel: "Advanced",
          //   imagWidth: 35,
          //   imageHieght: 35,
          //   text: "Dart",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/java.webp",
          //   experienceLevel: "Medium",
          //   imagWidth: 40,
          //   imageHieght: 40,
          //   text: "Java",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/python.webp",
          //   experienceLevel: "Medium",
          //   imagWidth: 30,
          //   imageHieght: 30,
          //   text: "Python",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/sql.webp",
          //   experienceLevel: "Medium",
          //   imagWidth: 30,
          //   imageHieght: 30,
          //   text: "SQL",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/html5.webp",
          //   experienceLevel: "Medium",
          //   imageHieght: 30,
          //   imagWidth: 30,
          //   text: "HTML",
          //   fontSize: 14,
          // ),
          // CustomSkillsCard(
          //   height: 100,
          //   width: 100,
          //   image: "assets/images/css.webp",
          //   experienceLevel: "Medium",
          //   imagWidth: 30,
          //   imageHieght: 30,
          //   fontSize: 14,
          //   text: "CSS",
          // ),
        ],
      ),
    );
  }
}
