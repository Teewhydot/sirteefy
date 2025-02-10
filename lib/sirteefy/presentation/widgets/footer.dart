import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/theme_provider.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);

    bool desktop =  ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);
    return Column(
      children: [
         Row(
          mainAxisAlignment: desktop? MainAxisAlignment.center: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Ionicons.logo_github,        color: themeProvider.isDarkModeActive?grayColor:blackColor,
            ),
            if(desktop) horizontalSpace(20),
             Icon(Ionicons.logo_twitter,        color: themeProvider.isDarkModeActive?grayColor:blackColor,
            ),
            if(desktop) horizontalSpace(20),

             Icon(Ionicons.logo_instagram,        color: themeProvider.isDarkModeActive?grayColor:blackColor,
            ),
            if(desktop) horizontalSpace(20),

             Icon(Ionicons.logo_linkedin,     color: themeProvider.isDarkModeActive?grayColor:blackColor,
            ),
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
