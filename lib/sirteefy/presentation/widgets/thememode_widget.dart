import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'dart:math' as math;

import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/theme/theme_provider.dart';


class ThemeModeWidget extends ConsumerStatefulWidget {
  const ThemeModeWidget({super.key});

  @override
  _ThemeModeWidgetState createState() => _ThemeModeWidgetState();
}

class _ThemeModeWidgetState extends ConsumerState<ThemeModeWidget>
    with SingleTickerProviderStateMixin {
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
      // if the animation status
    });
  }

  void _handleTap() {
    ref.read(themeProviderController.notifier).toggleTheme(ref.read(themeProviderController).isDarkMode);
    // if (_controller.isCompleted) {
    //   _controller.reverse();
    // } else {
    //   _controller.forward();
    // }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider  = ref.watch(themeProviderController);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap: _handleTap,
          child: Container(
            width: 30,
            height: 10,
            decoration: const BoxDecoration(
              color: grayColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
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
              child: GestureDetector(
                onTap: () {
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      themeProvider.isDarkMode
                          ? BoxShadow(
                              color: Colors.white.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            )
                          : BoxShadow(
                              color: Colors.black.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0, 0),
                            ),
                    ],
                  ),
                  child: Transform.rotate(
                    angle: -math.pi / 1,
                    child: const Icon(Ionicons.bulb_outline,
                        color: grayColor, size: 30),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
