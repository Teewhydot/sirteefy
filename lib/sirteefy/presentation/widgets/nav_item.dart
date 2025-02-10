import 'package:flutter/material.dart';

import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';

Widget buildNavItem(String title,Function? onTap) {
  return GestureDetector(
    onTap: (){
      if(onTap!=null){
        print("Nav item tapped");
        onTap();
      }
    },
    child: Row(
      children: [
        const Icon(
          Icons.arrow_forward_ios,
          color: accentColor,
          size: 16,
        ),
        Text(
          title,
          style: AppThemes.firaCodeStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
                   ),
        ),
      ],
    ),
  );
}
