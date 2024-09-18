import 'package:aviralportfolio/common/customDialog.dart';
import 'package:aviralportfolio/common/overlayService.dart';
import 'package:flutter/material.dart';

class DialogService {
  openCustomDialog(
      GlobalKey<State<StatefulWidget>> buttonKey,
      BuildContext context,
      Widget content,
      Size size,
      ScrollController scrollController) {
    final RenderBox renderBox =
        buttonKey.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    // Get the size of the button (width, height)

    // showOverlayDialog(context, position.dx, position.dy, scrollController);
    showSpeechBubbleDialog(context, position.dx, position.dy - 170, content,
        size, scrollController);
  }
}
