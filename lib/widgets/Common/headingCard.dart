import 'package:aviralportfolio/common/global.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingCard extends StatelessWidget {
  HeadingCard({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  String? icon;
  String? text;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: w < mobileSize ? 20 : 35, right: w < mobileSize ? 20 : 20),
      child: Container(
        height: 35,
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
                width: .4, color: const Color.fromARGB(174, 255, 255, 255))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon.toString(),
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text.toString(),
              style: GoogleFonts.titilliumWeb(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
