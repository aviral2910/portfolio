import 'dart:math';

import 'package:aviralportfolio/features/home/Home2.dart';

import 'package:aviralportfolio/provider/themeProvider.dart';
import 'package:aviralportfolio/service/FIrebaseService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpiderDot extends StatefulWidget {
  SpiderDot({Key? key, required this.h, required this.w}) : super(key: key);
  double w;
  double h;

  @override
  _SpiderDotState createState() => _SpiderDotState();
}

class _SpiderDotState extends State<SpiderDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();
  late List<Offset> _dots;
  late List<Offset> _velocities;
  Offset _cursorPosition = Offset.zero;

  final int _dotCount = 200;
  final double _connectionThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    fetchSkillData();
    // Initialize dots and velocities
    _dots = List.generate(
      _dotCount,
      (_) => Offset(
        _random.nextDouble() * widget.w, // Placeholder for width
        _random.nextDouble() * widget.h, // Placeholder for height
      ),
    );
    _velocities = List.generate(
      _dotCount,
      (_) => Offset(
        (_random.nextDouble() - 0.5) * 2,
        (_random.nextDouble() - 0.5) * 2,
      ),
    );

    // Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )..addListener(() {
        _updateDots();
        setState(() {});
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateDots() {
    for (int i = 0; i < _dots.length; i++) {
      _dots[i] += _velocities[i];

      // Bounce back on edges
      if (_dots[i].dx < 0 || _dots[i].dx > MediaQuery.of(context).size.width) {
        _velocities[i] = Offset(-_velocities[i].dx, _velocities[i].dy);
      }
      if (_dots[i].dy < 0 || _dots[i].dy > MediaQuery.of(context).size.height) {
        _velocities[i] = Offset(_velocities[i].dx, -_velocities[i].dy);
      }
    }
  }

  FirebaseService firebaseService = FirebaseService();
  fetchSkillData() async {
    firebaseService.fetchSkillData(context);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _cursorPosition = event.localPosition;
        });
      },
      onExit: (_) {
        setState(() {
          _cursorPosition = Offset.zero;
        });
      },
      child: CustomPaint(
        size: MediaQuery.of(context).size,
        painter:
            DotsPainter(_dots, _cursorPosition, _connectionThreshold, context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Home(h: widget.h, w: widget.w),
              Home2(
                w: widget.w,
                h: widget.h,
                offsetPercentage: 1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotsPainter extends CustomPainter {
  final List<Offset> dots;
  final Offset cursorPosition;
  final double connectionThreshold;
  BuildContext context;

  DotsPainter(
      this.dots, this.cursorPosition, this.connectionThreshold, this.context);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final linePaint = Paint()
      ..color = Provider.of<ThemeProvider>(context, listen: false)
          .getThemeColor
          .withOpacity(0.8)
      ..strokeWidth = 1;

    // Draw dots
    for (final dot in dots) {
      canvas.drawCircle(dot, 1, paint);

      // Connect dots to the cursor if within threshold
      if (cursorPosition != Offset.zero &&
          (dot - cursorPosition).distance < connectionThreshold) {
        canvas.drawLine(dot, cursorPosition, linePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
