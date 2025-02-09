import 'package:flutter/material.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/other/misc.dart';

class SkillCategoryCard extends StatelessWidget {
  final String title;
  final Widget content;

  const SkillCategoryCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 278,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0),
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
                color: textColorPurple,
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
