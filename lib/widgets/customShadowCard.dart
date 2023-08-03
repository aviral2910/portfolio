import 'package:flutter/material.dart';

class CustomShadowCard extends StatefulWidget {
  CustomShadowCard({Key? key, this.height, this.width, this.child})
      : super(key: key);
  double? width;
  double? height;
  Widget? child;

  @override
  State<CustomShadowCard> createState() => _CustomShadowCardState();
}

class _CustomShadowCardState extends State<CustomShadowCard> {
  bool ishover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: InkWell(
        onTap: () {},
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
                            Color.fromARGB(255, 20, 20, 20),
                            Color.fromARGB(255, 15, 15, 15)
                          ]
                        : [
                            Color.fromARGB(255, 18, 18, 18),
                            Color.fromARGB(255, 26, 26, 26),
                          ]),
                borderRadius: BorderRadius.circular(10)),
            height: widget.height! - 3,
            width: widget.width! - 3,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
