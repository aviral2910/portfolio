import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
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
              textAlign: TextAlign.left,
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
