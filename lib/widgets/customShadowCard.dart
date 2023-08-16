import 'package:aviralportfolio/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomShadowCard extends StatefulWidget {
  CustomShadowCard(
      {Key? key,
      this.name,
      this.height,
      this.width,
      this.image,
      this.radius,
      this.onTap})
      : super(key: key);
  double? width;
  double? height;
  String? image;
  String? name;
  double? radius;
  void Function()? onTap;
  @override
  State<CustomShadowCard> createState() => _CustomShadowCardState();
}

class _CustomShadowCardState extends State<CustomShadowCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Tooltip(
        preferBelow: false,
        message: widget.name ?? "",
        child: InkWell(
          onTap: widget.onTap ?? () {},
          onHover: (value) {
            setState(() {
              ishover = value;
            });
          },
          child: Align(
            alignment: ishover ? Alignment.topCenter : Alignment.bottomCenter,
            child: Container(
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
                              const Color.fromARGB(255, 20, 20, 20),
                              const Color.fromARGB(255, 15, 15, 15)
                            ]
                          : [
                              const Color.fromARGB(255, 18, 18, 18),
                              const Color.fromARGB(255, 26, 26, 26),
                            ]),
                  borderRadius: BorderRadius.circular(widget.radius == null
                      ? 10.0
                      : double.parse(widget.radius.toString()))),
              height: widget.height! - 3,
              width: widget.width! - 3,
              child: Center(
                child: Image.asset(
                  widget.image.toString(),
                  color: ishover ? themeColor : Colors.white,
                  height: w < mobileSize
                      ? 15
                      : widget.radius == null
                          ? 25
                          : 15,
                  width: w < mobileSize
                      ? 15
                      : widget.radius == null
                          ? 25
                          : 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSkillShadowCard extends StatefulWidget {
  CustomSkillShadowCard(
      {Key? key,
      this.height,
      this.width,
      this.image,
      this.radius,
      this.onTap,
      this.name})
      : super(key: key);
  double? width;
  double? height;
  String? image;
  double? radius;
  String? name;
  void Function()? onTap;

  @override
  State<CustomSkillShadowCard> createState() => _CustomSkillShadowCardState();
}

class _CustomSkillShadowCardState extends State<CustomSkillShadowCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Tooltip(
        message: widget.name ?? "",
        preferBelow: false,
        child: InkWell(
          onTap: widget.onTap ?? () {},
          onHover: (value) {
            setState(() {
              ishover = value;
            });
          },
          child: Align(
            alignment: ishover ? Alignment.topCenter : Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 3,
                        offset: Offset(-2, -2),
                        color: Color.fromARGB(200, 53, 53, 53)),
                    BoxShadow(
                        blurRadius: 10,
                        offset: Offset(8, 8),
                        color: Color.fromARGB(255, 15, 15, 15))
                  ],
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: ishover
                          ? [
                              const Color.fromARGB(255, 22, 22, 22),
                              const Color.fromARGB(255, 18, 18, 18)
                            ]
                          : [
                              const Color.fromARGB(255, 28, 28, 28),
                              const Color.fromARGB(255, 24, 24, 24),
                            ]),
                  borderRadius: BorderRadius.circular(widget.radius == null
                      ? 10.0
                      : double.parse(widget.radius.toString()))),
              height: widget.height! - 3,
              width: widget.width! - 3,
              child: Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: widget.radius == null ? 0 : 3),
                  child: (widget.radius == 1000)
                      ? Text(
                          widget.image.toString(),
                          style: GoogleFonts.titilliumWeb(
                              color: ishover ? themeColor : Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      : Image.asset(
                          widget.image.toString(),
                          color: ishover ? themeColor : Colors.white,
                          height: widget.radius == null ? 25 : 20,
                          width: widget.radius == null ? 25 : 20,
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
