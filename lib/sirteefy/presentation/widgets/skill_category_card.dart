import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/other/misc.dart';
import '../../../utils/theme/theme_provider.dart';

class SkillCategoryCard extends ConsumerWidget {
  final String title;
  final Widget content;

  const SkillCategoryCard(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);

    return Container(
      width: 278,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: themeProvider.isDarkMode ? grayColor : blackColor,
        ),
        borderRadius: BorderRadius.circular(borderWidthRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              title,
              style: AppThemes.firaCodeStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: accentColor,
              ),
            ),
          ),
          const Divider(
            height: 4,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: content,
          ),
        ],
      ),
    );
  }
}
