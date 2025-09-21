import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/features/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NormalText extends StatefulWidget {
  NormalText(this.data,
      {super.key,
      required this.letterSpacing,
      required this.fontSize,
      required this.color,
      required this.fontWeight});

  Color color;
  double? letterSpacing;
  FontWeight? fontWeight;
  double fontSize;
  final String data;
  // final TextStyle style;

  @override
  State<NormalText> createState() => _NormalTextState();
}

class _NormalTextState extends State<NormalText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: .01, sigmaY: .01),
          child: Text(widget.data,
              textAlign: w < mobileSize ? TextAlign.center : TextAlign.left,
              style: GoogleFonts.titilliumWeb(
                  letterSpacing: widget.letterSpacing,
                  fontWeight: widget.fontWeight,
                  fontSize: isHover ? (widget.fontSize - .2) : widget.fontSize,
                  color: isHover
                      ? Provider.of<ThemeProvider>(context).getThemeColor
                      : widget.color)),
        ),
      ),
    );
  }
}

class NormalRichText extends StatefulWidget {
  NormalRichText(this.data, this.text1,
      {super.key,
      required this.letterSpacing,
      required this.fontSize,
      required this.color,
      required this.fontWeight});

  Color color;
  double? letterSpacing;
  FontWeight? fontWeight;
  double fontSize;
  final String data;
  final String text1;
  // final TextStyle style;

  @override
  State<NormalRichText> createState() => _NormalRichTextState();
}

class _NormalRichTextState extends State<NormalRichText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: ClipRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: .01, sigmaY: .01),
          child: RichText(
            textAlign: w < mobileSize ? TextAlign.center : TextAlign.left,
            text: TextSpan(
              text: widget.data,
              // textAlign: TextAlign.justify,

              style: GoogleFonts.titilliumWeb(
                  letterSpacing: widget.letterSpacing,
                  fontWeight: widget.fontWeight,
                  fontSize: isHover ? (widget.fontSize - .2) : widget.fontSize,
                  color: isHover
                      ? Provider.of<ThemeProvider>(context).getThemeColor
                      : widget.color),
              children: <TextSpan>[
                TextSpan(
                    text: widget.text1,
                    style: GoogleFonts.titilliumWeb(
                      color: Provider.of<ThemeProvider>(context).getThemeColor,
                      fontWeight: FontWeight.w800,
                      fontSize: w < mobileSize ? 30 : 58,
                      letterSpacing: 8,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
