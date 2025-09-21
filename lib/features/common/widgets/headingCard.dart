import 'package:aviralportfolio/common/global.dart';
import 'package:aviralportfolio/features/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
            color: darkthemeColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(-2, -2),
                  color: Provider.of<ThemeProvider>(context)
                      .getThemeColor
                      .withOpacity(.5)),
              BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(2, 2),
                  color: Provider.of<ThemeProvider>(context)
                      .getThemeColor
                      .withOpacity(.5))
            ],
            border: Border.all(
                width: .4,
                color: Provider.of<ThemeProvider>(context).getThemeColor)),
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
