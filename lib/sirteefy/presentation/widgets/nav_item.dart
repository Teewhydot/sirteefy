import 'package:flutter/material.dart';

import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';

Widget buildNavItem(String title) {
  return Row(
    children: [
      const Icon(
        Icons.arrow_forward_ios,
        color: textColorPurple,
        size: 16,
      ),
      Text(
        title,
        style: AppThemes.firaCodeStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textColorWhite,
        ),
      ),
    ],
  );
}
