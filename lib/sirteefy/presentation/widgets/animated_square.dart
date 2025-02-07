import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sirteefy/utils/color_palette/colors.dart';

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> {
  Color _color = textColorGray;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _color = _color == textColorGray ? textColorPurple : textColorGray;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 20,
      height: 20,
      color: _color,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }
}
