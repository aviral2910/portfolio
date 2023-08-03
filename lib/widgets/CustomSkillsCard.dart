import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:aviralportfolio/widgets/normalText.dart';
import 'package:aviralportfolio/widgets/skillCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomSkillsCard extends StatefulWidget {
  CustomSkillsCard(
      {Key? key,
      this.height,
      this.width,
      required this.fontSize,
      required this.imagWidth,
      required this.image,
      required this.experienceLevel,
      required this.text,
      required this.imageHieght})
      : super(key: key);
  double? width;
  double? height;
  String? experienceLevel;
  String? text;
  String? image;
  double? imageHieght;
  double? imagWidth;
  double fontSize;

  @override
  State<CustomSkillsCard> createState() => _CustomSkillsCardState();
}

class _CustomSkillsCardState extends State<CustomSkillsCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: InkWell(
        onTap: () {},
        onHover: (value) {
          setState(() {
            ishover = value;
          });
        },
        child: Align(
          alignment: ishover ? Alignment.topCenter : Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
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
                            Color.fromARGB(255, 20, 20, 20),
                            Color.fromARGB(255, 15, 15, 15)
                          ]
                        : [
                            Color.fromARGB(255, 18, 18, 18),
                            Color.fromARGB(255, 26, 26, 26),
                          ]),
                borderRadius: BorderRadius.circular(10)),
            height: widget.height! - 3,
            width: widget.width == null ? widget.width : widget.width! - 3,
            child: Column(
              mainAxisAlignment: (widget.image != "")
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.image != "")
                  Image.asset(
                    widget.image.toString(),
                    color: ishover ? themeColor : Colors.white,
                    height: widget.imageHieght,
                    width: widget.imagWidth,
                  ),
                if (widget.image != "")
                  const SizedBox(
                    height: 5,
                  ),
                Text(
                  ishover
                      ? widget.experienceLevel.toString()
                      : widget.text.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.titilliumWeb(
                      color: ishover ? themeColor : Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: widget.fontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomChooseCard extends StatefulWidget {
  CustomChooseCard(
      {Key? key, this.height, this.width, this.text, required this.isHover})
      : super(key: key);
  double? width;
  double? height;

  String? text;
  bool isHover;

  @override
  State<CustomChooseCard> createState() => _CustomChooseCardState();
}

class _CustomChooseCardState extends State<CustomChooseCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Center(
        child: InkWell(
          onTap: () {
            Provider.of<SkillTypeProvider>(context, listen: false).setSelected =
                widget.text.toString();
          },
          onHover: (value) {
            setState(() {
              ishover = value;
            });
          },
          child: Align(
            alignment: widget.isHover
                ? Alignment.topCenter
                : ishover
                    ? Alignment.topCenter
                    : Alignment.bottomCenter,
            child: Container(
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  boxShadow: widget.isHover
                      ? const [
                          BoxShadow(
                              blurRadius: 7,
                              offset: Offset(-8, -3),
                              color: Color.fromARGB(121, 32, 32, 32)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: Offset(8, 8),
                              color: Color.fromARGB(121, 15, 15, 15))
                        ]
                      : ishover
                          ? const [
                              BoxShadow(
                                  blurRadius: 7,
                                  offset: Offset(-8, -3),
                                  color: Color.fromARGB(121, 32, 32, 32)),
                              BoxShadow(
                                  blurRadius: 10,
                                  offset: Offset(8, 8),
                                  color: Color.fromARGB(121, 15, 15, 15))
                            ]
                          : [],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: widget.isHover
                          ? [
                              Color.fromARGB(255, 18, 18, 18),
                              Color.fromARGB(255, 24, 24, 24),
                            ]
                          : ishover
                              ? [
                                  Color.fromARGB(255, 18, 18, 18),
                                  Color.fromARGB(255, 24, 24, 24),
                                ]
                              : [
                                  Color.fromARGB(255, 20, 20, 20),
                                  Color.fromARGB(255, 20, 20, 20),
                                  // Color.fromARGB(255, 15, 15, 15)
                                ]),
                  borderRadius: BorderRadius.circular(10)),
              height: widget.height! - 3,
              width: widget.width == null ? widget.width : widget.width! - 3,
              child: Center(
                child: Text(
                  widget.text.toString(),
                  style: GoogleFonts.titilliumWeb(
                    letterSpacing: 1,
                    color: widget.isHover
                        ? themeColor
                        : ishover
                            ? themeColor
                            : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
