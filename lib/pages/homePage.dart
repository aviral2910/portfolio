import 'package:aviralportfolio/global.dart';
import 'package:aviralportfolio/pages/home.dart';

import 'package:aviralportfolio/widgets/customAppBar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  double mouseX = 0;
  double mouseY = 0;
  ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    // print("object");
    return Scaffold(
        // extendBody: true,
        extendBodyBehindAppBar: true,
        // backgroundColor: darkthemeColor,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: CustomAppBar(
              scrollController: _scrollController,
            )),
        body: Container(
          height: h,
          width: w,
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: darkthemeColor,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Home(h: h, w: w),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: Color.fromARGB(170, 67, 66, 66),
                ),

                Container(
                  height: 1000,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Card(
                        elevation: 10,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: darkthemeColor,
                        ),
                      )
                    ],
                  ),
                )

                // Stack(
                //   children: [
                //     MouseRegion(
                //         onHover: (event) {
                //           Provider.of<MousePointerProvider>(context,
                //                   listen: false)
                //               .setMousePointer(event.localPosition.dx,
                //                   event.localPosition.dy);
                //         },
                //         child: Home(h: h, w: w)),
                //     Consumer<MousePointerProvider>(builder: (_, a, context) {
                //       return Positioned(
                //           // top: 0,
                //           top: a.getMouseY,
                //           left: a.getMouseX,
                //           child: Container(
                //             height: 35,
                //             width: 35,
                //             decoration: BoxDecoration(
                //                 border: Border.all(color: themeColor),
                //                 borderRadius: BorderRadius.circular(35)),
                //             child: Center(
                //               child: Container(
                //                 height: 5,
                //                 width: 5,
                //                 decoration: BoxDecoration(
                //                     color: themeColor,
                //                     borderRadius: BorderRadius.circular(5)),
                //               ),
                //             ),
                //           ));
                //     })
                //   ],
                // ),
                // Stack(
                //   children: [
                //     MouseRegion(
                //       onHover: (event) {
                //         Provider.of<MousePointerProvider>(context,
                //                 listen: false)
                //             .setMousePointer(
                //                 event.localPosition.dx, event.localPosition.dy);
                //       },
                //       child: Container(
                //         height: 1000,
                //       ),
                //     ),
                //     Consumer<MousePointerProvider>(builder: (_, a, context) {
                //       return Positioned(
                //           // top: 0,
                //           top: a.getMouseY,
                //           left: a.getMouseX,
                //           child: (a.getMouseY < 0)
                //               ? SizedBox()
                //               : Container(
                //                   height: 35,
                //                   width: 35,
                //                   decoration: BoxDecoration(
                //                       border: Border.all(color: themeColor),
                //                       borderRadius: BorderRadius.circular(35)),
                //                   child: Center(
                //                     child: Container(
                //                       height: 5,
                //                       width: 5,
                //                       decoration: BoxDecoration(
                //                           color: themeColor,
                //                           borderRadius:
                //                               BorderRadius.circular(5)),
                //                     ),
                //                   ),
                //                 ));
                //     })
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}
