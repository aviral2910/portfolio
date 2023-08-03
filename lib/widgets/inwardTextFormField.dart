import 'package:aviralportfolio/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InwardTextFormField extends StatelessWidget {
  InwardTextFormField({
    required this.maxlines,
    Key? key,
  }) : super(key: key);
  int maxlines;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            blurRadius: 3,
            offset: Offset(-3, -3),
            color: Color.fromARGB(255, 12, 12, 12)),
        BoxShadow(
            blurRadius: 2,
            offset: Offset(3, 3),
            color: Color.fromARGB(255, 32, 32, 32))
      ], border: Border.all(color: Color.fromARGB(255, 19, 19, 19))),
      child: TextFormField(
          style: GoogleFonts.titilliumWeb(
              color: Colors.white,
              fontSize: w < mobileSize ? 14 : 18,
              fontWeight: FontWeight.w400),
          maxLines: maxlines,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 19, 19, 19),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(width: 1, color: themeColor
                  // color: Color.fromARGB(255, 19, 19, 19),
                  ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 19, 19, 19),
                width: 4.0,
              ),
            ),
          )),
    );
  }
}
