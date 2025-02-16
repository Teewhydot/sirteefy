import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../../../utils/theme/theme_provider.dart';

class ThemeWidget extends ConsumerStatefulWidget {
  const ThemeWidget({super.key});

  @override
  ConsumerState<ThemeWidget> createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends ConsumerState<ThemeWidget> {
  bool isKnobOnRight = false;

  void _togglePosition() {
    // toggle theme
    final themeProvider = ref.read(themeProviderController.notifier);
    themeProvider.toggleTheme();
    setState(() {
      isKnobOnRight = !isKnobOnRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeProviderController);
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        GestureDetector(
          onTap: _togglePosition,
          child: ThemeBackground(
            themeProvider: themeProvider,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: themeProvider.isDarkModeActive ? 30 : 0,
          child: GestureDetector(
            onTap: _togglePosition,
            child: ThemeKnob(
              themeProvider: themeProvider,
            ),
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          left: themeProvider.isDarkModeActive ? 0 : 30,
          top: 0,
          child: themeProvider.isDarkModeActive
              ? const LightModeWidget()
              : const CrescentMoonWidget(),
        ),
      ],
    );
  }
}

class ThemeBackground extends StatelessWidget {
  final themeProvider;
  const ThemeBackground({super.key, this.themeProvider});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 20,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: themeProvider.isDarkModeActive ? grayColor : darkModeBGColor,
      ),
    );
  }
}

class ThemeKnob extends StatelessWidget {
  final themeProvider;
  const ThemeKnob({super.key, this.themeProvider});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: themeProvider.isDarkModeActive
                ? grayColor
                : darkModeBGColor,
            width: 1,
          ),
          color: themeProvider.isDarkModeActive
              ? accentColor.withOpacity(0.85)
              : grayColor.withOpacity(0.65),
        ),
      ),
    );
  }
}

class LightModeWidget extends ConsumerWidget {
  const LightModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);

    return CustomPaint(
      size: const Size(20, 20),
      painter: LightModePainter(
        color: themeProvider.isDarkModeActive ? Colors.white : grayColor,
      ),
    );
  }
}

class LightModePainter extends CustomPainter {
  final Color color;
  LightModePainter({this.color = Colors.white});
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const circleRadius = 5.0;
    const numberOfSticks = 12;
    const stickLength = 5.0;
    const stickThickness = 1.0;

    // Draw central circle
    final circlePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, circleRadius, circlePaint);

    // Draw radiating sticks
    final stickPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stickThickness;

    for (int i = 0; i < numberOfSticks; i++) {
      final angle = 2 * pi * i / numberOfSticks;
      final stickStart = Offset(
        center.dx + circleRadius * cos(angle),
        center.dy + circleRadius * sin(angle),
      );
      final stickEnd = Offset(
        center.dx + (circleRadius + stickLength) * cos(angle),
        center.dy + (circleRadius + stickLength) * sin(angle),
      );

      canvas.drawLine(stickStart, stickEnd, stickPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CrescentMoonWidget extends StatelessWidget {
  const CrescentMoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      // TODO make the crescent moon rotate between -pi/5 and pi/5 perpetually
      angle: -pi / 5,
      child: CustomPaint(
        size: const Size(20, 20), // Specify the size of the crescent moon
        painter: CrescentMoonPainter(),
      ),
    );
  }
}

class CrescentMoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.5, size.height * 0.1)
      ..arcToPoint(
        Offset(size.width * 0.5, size.height * 0.9),
        radius: Radius.circular(size.width * 0.6),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width * 0.5, size.height * 0.1),
        radius: Radius.circular(size.width * 0.4),
        clockwise: true,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
