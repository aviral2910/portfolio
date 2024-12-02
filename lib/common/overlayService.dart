import 'package:aviralportfolio/common/customDialog.dart';
import 'package:flutter/material.dart';

void showOverlayDialog(BuildContext context, double left, double top,
    ScrollController scrollController) {
  OverlayState overlayState = Overlay.of(context);

  late OverlayEntry overlayEntry; // Declare overlayEntry

  // Scroll listener to dismiss the overlay when the user scrolls
  void scrollListener() {
    overlayEntry.remove(); // Remove the overlay when scrolling occurs
    scrollController.removeListener(
        scrollListener); // Remove the listener after removing the overlay
  }

  scrollController.addListener(scrollListener);

  // Initialize the overlayEntry with a GestureDetector to detect taps outside the dialog
  overlayEntry = OverlayEntry(
    builder: (context) {
      return GestureDetector(
        behavior: HitTestBehavior
            .translucent, // Allows taps to pass through empty areas
        onTap: () {
          overlayEntry
              .remove(); // Remove the overlay if the user taps outside the dialog
          scrollController
              .removeListener(scrollListener); // Remove the scroll listener
        },
        child: Stack(
          children: [
            CustomDialog(
              left: left,
              top: top,
              onClose: () {
                overlayEntry
                    .remove(); // Remove the dialog when "Close" button is pressed
                scrollController.removeListener(
                    scrollListener); // Remove the scroll listener
              },
            ),
          ],
        ),
      );
    },
  );

  // Insert the overlayEntry into the Overlay
  overlayState.insert(overlayEntry);
}

void showSpeechBubbleDialog(BuildContext context, double left, double top,
    Widget content, Size size, ScrollController scrollController) {
  OverlayState overlayState = Overlay.of(context);

  late OverlayEntry overlayEntry;

  void scrollListener() {
    overlayEntry.remove();
    scrollController.removeListener(scrollListener);
  }

  scrollController.addListener(scrollListener);

  overlayEntry = OverlayEntry(
    builder: (context) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          overlayEntry.remove();
          scrollController.removeListener(scrollListener);
        },
        child: Stack(
          children: [
            SpeechBubbleDialog(
              left: left,
              size: size,
              top: top,
              onClose: () {
                overlayEntry.remove();
                scrollController.removeListener(scrollListener);
              },
              content: content,
            ),
          ],
        ),
      );
    },
  );

  overlayState.insert(overlayEntry);
}
