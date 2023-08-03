import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:aviralportfolio/widgets/CustomSkillsCard.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      width: widget.w,
      constraints: BoxConstraints(minHeight: 400),
      padding: EdgeInsets.only(left: 0, right: 00, bottom: 20),
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
                height: 55,
                isHover:
                    Provider.of<SkillTypeProvider>(context).selected == "Others"
                        ? true
                        : false,
                width: widget.w,
                text: "Others",
              )),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.easeIn,
            height: widget.changeAppBar ? 30 : 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Column(
              children: [
                if (Provider.of<SkillTypeProvider>(context).selected ==
                    "Languages")
                  Languages(),
                if (Provider.of<SkillTypeProvider>(context).selected ==
                    "Frameworks")
                  Framework(),
                if (Provider.of<SkillTypeProvider>(context).selected ==
                    "Others")
                  Others(),
              ],
            ),
          ),
        ],
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
    return Wrap(
      runAlignment: WrapAlignment.spaceBetween,
      runSpacing: 25,
      spacing: 25,
      children: [
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/github2.png",
          imagWidth: 35,
          imageHieght: 35,
          experienceLevel: "Medium",
          text: "Github",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/adobexd.png",
          imagWidth: 35,
          imageHieght: 35,
          text: "Adobe Xd",
          experienceLevel: "Beginner",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/firebase.png",
          imagWidth: 35,
          imageHieght: 35,
          text: "Firebase",
          experienceLevel: "Advanced",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/figma.png",
          imagWidth: 35,
          imageHieght: 35,
          text: "Figma",
          experienceLevel: "Medium",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "",
          imagWidth: 40,
          imageHieght: 40,
          text: "MVC \nArchitecture",
          experienceLevel: "Medium",
          fontSize: 12,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "",
          text: "MVP \nArchitecture",
          experienceLevel: "Medium",
          imagWidth: 25,
          imageHieght: 25,
          fontSize: 12,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/block.png",
          experienceLevel: "Medium",
          imagWidth: 30,
          imageHieght: 30,
          text: "Bloc",
          fontSize: 14,
        ),
      ],
    );
  }
}

class Framework extends StatelessWidget {
  const Framework({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 25,
      spacing: 25,
      children: [
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/flutter.png",
          experienceLevel: "Advanced",
          imagWidth: 35,
          imageHieght: 35,
          text: "Flutter",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/react.png",
          experienceLevel: "Beginner",
          imagWidth: 40,
          imageHieght: 40,
          text: "ReactJs",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/springboot.png",
          imagWidth: 25,
          imageHieght: 25,
          experienceLevel: "Medium",
          text: "Spring Boot",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/django.png",
          imagWidth: 30,
          imageHieght: 30,
          experienceLevel: "Beginner",
          text: "Django",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/flask.png",
          experienceLevel: "Beginner",
          imageHieght: 30,
          imagWidth: 30,
          text: "Flask",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/website.png",
          imagWidth: 30,
          imageHieght: 30,
          experienceLevel: "Beginner",
          fontSize: 14,
          text: "Web3",
        ),
      ],
    );
  }
}

class Languages extends StatelessWidget {
  const Languages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 25,
      spacing: 25,
      children: [
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/dart.png",
          experienceLevel: "Advanced",
          imagWidth: 35,
          imageHieght: 35,
          text: "Dart",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/java.png",
          experienceLevel: "Medium",
          imagWidth: 40,
          imageHieght: 40,
          text: "Java",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/python.png",
          experienceLevel: "Medium",
          imagWidth: 30,
          imageHieght: 30,
          text: "Python",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/sql.png",
          experienceLevel: "Medium",
          imagWidth: 30,
          imageHieght: 30,
          text: "SQL",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/html5.png",
          experienceLevel: "Medium",
          imageHieght: 30,
          imagWidth: 30,
          text: "HTML",
          fontSize: 14,
        ),
        CustomSkillsCard(
          height: 100,
          width: 100,
          image: "assets/images/css.png",
          experienceLevel: "Medium",
          imagWidth: 30,
          imageHieght: 30,
          fontSize: 14,
          text: "CSS",
        ),
      ],
    );
  }
}
