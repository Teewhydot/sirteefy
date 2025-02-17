import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
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

    return Center(
      child: Icon(Ionicons.sunny_outline,
      size: 20,
      color: themeProvider.isDarkModeActive ? Colors.white : grayColor ,),
    );
  }
}

class CrescentMoonWidget extends StatelessWidget {
  const CrescentMoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Ionicons.moon_outline,
        size: 20,
        color: accentColor ,),
    );
  }
}
