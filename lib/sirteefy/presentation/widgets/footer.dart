import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/color_palette/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    bool desktop =  ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);
    return Column(
      children: [
         Row(
          mainAxisAlignment: desktop? MainAxisAlignment.center: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Ionicons.logo_github, color: textColorGray),
            if(desktop) horizontalSpace(20),
            const Icon(Ionicons.logo_twitter, color: textColorGray),
            if(desktop) horizontalSpace(20),

            const Icon(Ionicons.logo_instagram, color: textColorGray),
            if(desktop) horizontalSpace(20),

            const Icon(Ionicons.logo_linkedin, color: textColorGray),
          ],
        ),
        verticalSpace(20),
        Text(
          '© 2025 Sirteefy. All rights reserved.',
          style: AppThemes.firaCodeStyle(

            fontSize: 12,
          ),
        ),

      ],
    );
  }
}
