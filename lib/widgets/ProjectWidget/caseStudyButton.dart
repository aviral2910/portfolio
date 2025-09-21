import 'package:aviralportfolio/features/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CaseStudyButton extends StatefulWidget {
  CaseStudyButton({
    required this.onTap,
    required this.isLoading,
    required this.isHover,
    this.width,
    this.height,
    this.text,
    this.fontSize,
    Key? key,
  }) : super(key: key);
  bool isHover;
  void Function()? onTap;
  bool isLoading;
  double? height;
  double? width;
  String? text;
  double? fontSize;
  @override
  State<CaseStudyButton> createState() => _CaseStudyButtonState();
}

class _CaseStudyButtonState extends State<CaseStudyButton> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (value) {
        setState(() {
          ishover = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(top: ishover ? 0 : 5, bottom: ishover ? 5 : 0),
        child: Container(
          height: widget.height ?? 35,
          width: widget.width ?? 160,
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              boxShadow: ishover
                  ? [
                      BoxShadow(
                          blurRadius: widget.isHover ? 2 : 7,
                          offset: widget.isHover
                              ? const Offset(-2, -2)
                              : const Offset(-8, -8),
                          color: widget.isHover
                              ? Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.55)
                              : const Color.fromARGB(121, 32, 32, 32)),
                      BoxShadow(
                          blurRadius: widget.isHover ? 2 : 10,
                          offset: widget.isHover
                              ? const Offset(2, 2)
                              : const Offset(8, 8),
                          color: widget.isHover
                              ? Provider.of<ThemeProvider>(context)
                                  .getThemeColor
                                  .withOpacity(.55)
                              : const Color.fromARGB(121, 15, 15, 15))
                    ]
                  : [
                      BoxShadow(
                          blurRadius: widget.isHover ? 2 : 7,
                          offset: widget.isHover
                              ? const Offset(-2, -2)
                              : const Offset(-8, -8),
                          color: const Color.fromARGB(137, 242, 238, 238)),
                      BoxShadow(
                          blurRadius: widget.isHover ? 2 : 10,
                          offset: widget.isHover
                              ? const Offset(2, 2)
                              : const Offset(8, 8),
                          color: const Color.fromARGB(137, 242, 238, 238))
                    ],
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 15, 15, 15),
                    Color.fromARGB(255, 15, 15, 15)
                  ]),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: widget.isLoading
                ? const SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator())
                : Text(
                    widget.text ?? "CASE STUDY",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.titilliumWeb(
                        fontWeight: FontWeight.w600,
                        fontSize: widget.fontSize ?? 12,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
