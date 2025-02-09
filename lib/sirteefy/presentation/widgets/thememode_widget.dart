import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'dart:math' as math;

class ThemeModeWidget extends StatefulWidget {
  const ThemeModeWidget({super.key});

  @override
  _ThemeModeWidgetState createState() => _ThemeModeWidgetState();
}

class _ThemeModeWidgetState extends State<ThemeModeWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _heightAnimation = Tween<double>(begin: 10, end: 70).animate(_controller);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Timer(const Duration(seconds: 5), () {
          _controller.reverse();
        });
      }
    });
  }

  void _handleTap() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 30,
            height: 10,
            decoration: const BoxDecoration(
              color: textColorGray,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            ),
          ),
          Positioned(
            left: 13.5,
            child: AnimatedBuilder(
              animation: _heightAnimation,
              builder: (context, child) {
                return Container(
                  width: 3,
                  height: _heightAnimation.value,
                  decoration: const BoxDecoration(
                    color: textColorGray,
                  ),
                );
              },
            ),
          ),
          AnimatedBuilder(
            animation: _heightAnimation,
            builder: (context, child) {
              return Positioned(
                top: _heightAnimation.value,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.6),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Transform.rotate(
                    angle: -math.pi / 1,
                    child: const Icon(Ionicons.bulb_outline, color: textColorGray, size: 30),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
