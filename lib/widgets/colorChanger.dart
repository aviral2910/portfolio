import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({
    super.key,
  });

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (Provider.of<ThemeProvider>(context, listen: false).getThemeColor ==
            const Color.fromRGBO(252, 27, 61, 0.847)) {
          Provider.of<ThemeProvider>(context, listen: false)
              .setThemeColor(themeClor);
        } else {
          Provider.of<ThemeProvider>(context, listen: false)
              .setThemeColor(const Color.fromRGBO(252, 27, 61, 0.847));
        }
      },
      child: Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2,
                      offset: const Offset(-2, -2),
                      color: Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.8)),
                  BoxShadow(
                      blurRadius: 1.5,
                      offset: const Offset(1.5, 1.5),
                      color: Provider.of<ThemeProvider>(context)
                          .getThemeColor
                          .withOpacity(.8)),
                ],
                // border: Border.all(color: themeColor),
                color: const Color.fromARGB(255, 19, 19, 19),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Icon(
                Icons.color_lens_sharp,
                size: 35,
                color: Provider.of<ThemeProvider>(context).getThemeColor,
              ),
            ),
          )),
    );
  }
}
