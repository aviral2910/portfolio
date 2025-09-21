import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../features/theme/themeProvider.dart';

class ShadowText extends StatefulWidget {
  ShadowText(this.data,
      {super.key,
      required this.fontSize,
      required this.color,
      this.onTap,
      this.textAlign,
      required this.fontWeight});

  Color color;
  FontWeight? fontWeight;
  double? fontSize;
  final String data;
  void Function()? onTap;
  TextAlign? textAlign;
  // final TextStyle style;

  @override
  State<ShadowText> createState() => _ShadowTextState();
}

class _ShadowTextState extends State<ShadowText> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: ClipRect(
        child: Stack(
          children: [
            Positioned(
              top: 2.0,
              left: 2.0,
              child: Text(
                widget.data,
                textAlign: widget.textAlign ?? TextAlign.left,
                style: GoogleFonts.titilliumWeb(
                        fontWeight: widget.fontWeight,
                        fontSize: widget.fontSize,
                        color: isHover
                            ? Provider.of<ThemeProvider>(context).getThemeColor
                            : widget.color)
                    .copyWith(color: Colors.black.withOpacity(0.7)),
              ),
            ),
            BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: .01, sigmaY: .01),
              child: Text(widget.data,
                  textAlign: widget.textAlign ?? TextAlign.left,
                  style: GoogleFonts.titilliumWeb(
                      fontWeight: widget.fontWeight,
                      fontSize: widget.fontSize,
                      color: isHover
                          ? Provider.of<ThemeProvider>(context).getThemeColor
                          : widget.color)),
            ),
          ],
        ),
      ),
    );
  }
}
