import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/provider/skillTypeProvider.dart';
import 'package:aviralportfolio/features/theme/themeProvider.dart';
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
    return SizedBox(
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: !ishover ? 2 : 7,
                      offset: !ishover
                          ? const Offset(-1, -1)
                          : const Offset(-8, -8),
                      color: ishover
                          ? const Color.fromARGB(121, 32, 32, 32)
                          : Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.9)),
                  BoxShadow(
                      blurRadius: !ishover ? 2 : 10,
                      offset:
                          !ishover ? const Offset(1, 1) : const Offset(8, 8),
                      color: ishover
                          ? const Color.fromARGB(121, 32, 32, 32)
                          : Provider.of<ThemeProvider>(context)
                              .getThemeColor
                              .withOpacity(.9))
                ],
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: ishover
                        ? [
                            const Color.fromARGB(255, 20, 20, 20),
                            const Color.fromARGB(255, 15, 15, 15)
                          ]
                        : [
                            const Color.fromARGB(255, 18, 18, 18),
                            const Color.fromARGB(255, 26, 26, 26),
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
                    // color: ishover
                    //     ? Provider.of<ThemeProvider>(context).getThemeColor
                    //     : Colors.white,
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
                      color: ishover
                          ? Provider.of<ThemeProvider>(context).getThemeColor
                          : Colors.white,
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
      {Key? key,
      this.height,
      this.width,
      this.text,
      required this.isHover,
      required this.islight})
      : super(key: key);
  double? width;
  double? height;
  bool islight;

  String? text;
  bool isHover;

  @override
  State<CustomChooseCard> createState() => _CustomChooseCardState();
}

class _CustomChooseCardState extends State<CustomChooseCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            child: Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      boxShadow: widget.isHover
                          ? const [
                              BoxShadow(
                                  blurRadius: 7,
                                  offset: Offset(-8, -3),
                                  color: Color.fromARGB(121, 32, 32, 32)),
                              // BoxShadow(
                              //     blurRadius: 10,
                              //     offset: Offset(8, 8),
                              //     color: Color.fromARGB(121, 15, 15, 15)
                              // )
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
                          begin: ishover
                              ? Alignment.topLeft
                              : Alignment.bottomCenter,
                          end: ishover
                              ? Alignment.bottomRight
                              : Alignment.topCenter,
                          colors: widget.isHover
                              ? [
                                  const Color.fromARGB(255, 20, 20, 20),
                                  const Color.fromARGB(255, 20, 20, 20),
                                  // const Color.fromARGB(255, 18, 18, 18),
                                  // const Color.fromARGB(255, 24, 24, 24),
                                ]
                              : ishover
                                  ? [
                                      const Color.fromARGB(255, 24, 24, 24),
                                      const Color.fromARGB(255, 18, 18, 18),
                                      const Color.fromARGB(255, 24, 24, 24),
                                    ]
                                  : [
                                      widget.islight
                                          // ? Color.fromARGB(7, 8, 33, 45)
                                          ? Colors.transparent
                                          : const Color.fromARGB(
                                              255, 24, 24, 24),

                                      const Color.fromARGB(255, 20, 20, 20),

                                      // Color.fromARGB(255, 15, 15, 15)
                                    ]),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: widget.height! - 3,
                  width:
                      widget.width == null ? widget.width : widget.width! - 3,
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        widget.text.toString(),
                        style: GoogleFonts.titilliumWeb(
                          letterSpacing: 1,
                          color: widget.isHover
                              ? Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                              : ishover
                                  ? Provider.of<ThemeProvider>(context)
                                      .getThemeColor
                                  : Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 3,
                  width:
                      widget.width == null ? widget.width : widget.width! - 3,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromARGB(255, 20, 20, 20),
                            Color.fromARGB(255, 20, 20, 20),
                            // Color.fromARGB(255, 15, 15, 15),
                            // Color.fromARGB(255, 15, 15, 15)
                          ]),
                      boxShadow: [
                        widget.islight
                            ? widget.isHover
                                ? const BoxShadow()
                                : ishover
                                    ? const BoxShadow()
                                    : BoxShadow(
                                        blurRadius: 3,
                                        offset: const Offset(-0, -3),
                                        color:
                                            Provider.of<ThemeProvider>(context)
                                                .getThemeColor)
                            : const BoxShadow(),
                        // BoxShadow(
                        //     blurRadius: 10,
                        //     offset: Offset(8, 8),
                        //     color: Color.fromARGB(121, 15, 15, 15)
                        // )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
