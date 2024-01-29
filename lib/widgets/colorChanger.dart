import 'dart:async';

import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_color_picker_wheel/flutter_color_picker_wheel.dart';
import 'package:flutter_color_picker_wheel/models/button_behaviour.dart';
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
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          right: w < mobileSize ? 0 : 30, bottom: w < mobileSize ? 0 : 10),
      child: Stack(
        children: [
          Container(
            height: 80,
            width: 80,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: CircularText(
              children: [
                TextItem(
                  text: Text(
                    "Select Theme".toUpperCase(),
                    style: TextStyle(
                      fontSize: 8,
                      color: Provider.of<ThemeProvider>(context).getThemeColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  space: 12,
                  startAngle: 90,
                  startAngleAlignment: StartAngleAlignment.center,
                  direction: CircularTextDirection.anticlockwise,
                ),
              ],
              radius: 41,
              position: CircularTextPosition.inside,
              backgroundPaint: Paint()..color = Colors.transparent,
            ),
          ),
          Positioned(bottom: 14, right: 14, child: AnimatedShadowColorPicker()),
        ],
      ),
    );
  }
}

class AnimatedShadowColorPicker extends StatefulWidget {
  const AnimatedShadowColorPicker({super.key});

  @override
  State<AnimatedShadowColorPicker> createState() =>
      _AnimatedShadowColorPickerState();
}

class _AnimatedShadowColorPickerState extends State<AnimatedShadowColorPicker> {
  @override
  void initState() {
    var timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setRotationOfText();
    });
    super.initState();
  }

  setRotationOfText() {
    setState(() {
      isBig = !isBig;
    });
  }

  bool isBig = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Card(
        color: Colors.transparent,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: isBig ? 5 : 2,
                    offset: isBig ? const Offset(-5, -5) : const Offset(-2, -2),
                    color: Provider.of<ThemeProvider>(context)
                        .getThemeColor
                        .withOpacity(.45)),
                BoxShadow(
                    blurRadius: isBig ? 5 : 1.5,
                    offset:
                        isBig ? const Offset(5, -5) : const Offset(-4.5, 2.5),
                    color: Provider.of<ThemeProvider>(context)
                        .getThemeColor
                        .withOpacity(.45)),
              ],
              // border: Border.all(color: themeColor),
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100)),
          child: WheelColorPicker(
            onSelect: (Color newColor) {
              Provider.of<ThemeProvider>(context, listen: false)
                  .setThemeColor(newColor);
              setState(() {});
            },
            behaviour: ButtonBehaviour.clickToOpen,
            // stickToButton: w < mobileSize ? false : true,
            defaultColor: Provider.of<ThemeProvider>(context).getThemeColor,
            animationConfig: fanLikeAnimationConfig,
            colorList: simpleColors,
            buttonSize: 34,
            pieceHeight: w < mobileSize ? 15 : 35,
            innerRadius: w < mobileSize ? 60 : 80,
          ),
        ));
  }
}
