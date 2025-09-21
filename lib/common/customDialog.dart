import 'package:aviralportfolio/features/theme/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomDialog extends StatelessWidget {
  final double left;
  final double top;
  final VoidCallback onClose; // Pass a callback to close the dialog

  const CustomDialog(
      {super.key,
      required this.left,
      required this.top,
      required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Custom Dialog",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onClose, // Call the close method passed as argument
                child: const Text("Close"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SpeechBubblePainter extends CustomPainter {
  final double cornerRadius; // Radius of rounded corners
  final double tailSize; // Size of the tail
  final Color borderColor; // Color of the border
  final Color fillColor; // Color of the fill
  final Color shadowColor; // Color of the shadow
  final double closeButtonSize; // Size of the close button

  SpeechBubblePainter({
    this.cornerRadius = 20.0,
    this.tailSize = 10.0,
    this.borderColor = Colors.blue,
    required this.fillColor,
    this.shadowColor = const Color.fromARGB(148, 83, 159, 191),
    this.closeButtonSize = 30.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Width of the border

    Paint shadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter =
          const MaskFilter.blur(BlurStyle.normal, 6.0); // Adjust shadow blur

    Path path = Path();

    double tailWidth = 20; // Width of the tail

    // Create a rounded rectangle with a pointy tail at the bottom center
    path.moveTo(cornerRadius, 0); // Top-left corner
    path.lineTo(size.width - cornerRadius, 0); // Top edge
    path.quadraticBezierTo(
        size.width, 0, size.width, cornerRadius); // Top-right corner
    path.lineTo(size.width, size.height - cornerRadius); // Right edge
    path.quadraticBezierTo(size.width, size.height, size.width - cornerRadius,
        size.height); // Bottom-right corner

    // Draw the tail
    path.lineTo(size.width / 2 + tailWidth / 2,
        size.height); // Bottom-right before tail
    path.lineTo(size.width / 2, size.height + tailSize); // Pointy tail bottom
    path.lineTo(
        size.width / 2 - tailWidth / 2, size.height); // Bottom-left of tail

    path.lineTo(cornerRadius, size.height); // Bottom-left corner
    path.quadraticBezierTo(
        0, size.height, 0, size.height - cornerRadius); // Bottom-left corner

    path.lineTo(0, cornerRadius); // Left edge
    path.quadraticBezierTo(0, 0, cornerRadius, 0); // Top-left corner

    // Draw shadow first
    canvas.drawPath(path, shadowPaint);
    // Draw the fill color
    canvas.drawPath(path, fillPaint);
    // Draw the border on top
    canvas.drawPath(path, borderPaint);
    Paint closeButtonShadowPaint = Paint()
      ..color = shadowColor
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6.0);

    Path closeButtonShadowPath = Path()
      ..arcTo(
          Rect.fromCircle(
            center: Offset(size.width - cornerRadius + closeButtonSize / 2,
                closeButtonSize / 4),
            radius: closeButtonSize / 2,
          ),
          -3.1 / 1.18, // Start angle
          3.14 * 1.25,
          false);

    canvas.drawPath(closeButtonShadowPath, closeButtonShadowPaint);

    // Draw the close button's shadow and border
    Paint closeButtonPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    Path closeButtonPath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width - cornerRadius + closeButtonSize / 2,
            closeButtonSize / 4),
        radius: closeButtonSize / 2,
      ));

    canvas.drawPath(closeButtonPath, closeButtonPaint);
    canvas.drawPath(
        closeButtonPath,
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class SpeechBubbleDialog extends StatelessWidget {
  final double left;
  final double top;
  final VoidCallback onClose;
  Widget content;
  Size size;

  SpeechBubbleDialog({
    super.key,
    required this.left,
    required this.top,
    required this.onClose,
    required this.content,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          clipBehavior:
              Clip.none, // Allows the close button to be outside the dialog
          children: [
            CustomPaint(
              size: size, // Define the size of the bubble
              painter: SpeechBubblePainter(
                borderColor: Provider.of<ThemeProvider>(context, listen: false)
                    .getThemeColor,
                fillColor: const Color.fromARGB(255, 15, 15, 15),
                shadowColor: Provider.of<ThemeProvider>(context, listen: false)
                    .getThemeColor
                    .withOpacity(.4),
                closeButtonSize: 30.0,
              ),
            ),
            content,
            Positioned(
              right: -15,
              top:
                  -13, // Adjust this value to ensure the button is correctly positioned
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: onClose,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
