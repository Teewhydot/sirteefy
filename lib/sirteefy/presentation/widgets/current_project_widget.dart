import 'package:flutter/material.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/animated_square.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../../../utils/other/misc.dart';

class ScrollingText extends StatefulWidget {
  final String project;
  final TextStyle style;
  final TextStyle projectStyle;

  const ScrollingText({
    required this.project,
    this.style = const TextStyle(),
    this.projectStyle = const TextStyle(),
    super.key,
  });

  @override
  _ScrollingTextState createState() => _ScrollingTextState();
}

class _ScrollingTextState extends State<ScrollingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _textWidth = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    _animation = Tween<double>(
      begin: 0,
      end: 0,
    ).animate(_controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textPainter = TextPainter(
        text: TextSpan(
            text: "Currently working on",
            children: [
              TextSpan(
                text: " ${widget.project}",
                style: widget.projectStyle,
              )
            ]),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      setState(() {
        _textWidth = textPainter.width;
        _animation = Tween<double>(
          begin: 0,
          end: _textWidth,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: accentColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(borderWidthRadius),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const AnimatedSquare(),
              horizontalSpace(10),
              ClipRect(
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(-_animation.value, 0),
                      child: child,
                    );
                  },
                  child: Center(
                    child: Text.rich( TextSpan(
                        text: "Currently working on",
                        children: [
                          TextSpan(
                            text: " ${widget.project}",
                            style: widget.projectStyle,
                          )
                        ]),
                    ),
                  )
                ),
              ),
            ],
          ),
        ));
  }
}
