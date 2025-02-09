import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../../../generated/assets.dart';
import '../../../utils/theme/sirteefy_themes.dart';
import 'nav_item.dart';

class Header extends StatelessWidget {
final bool isHome;

const Header({super.key, this.isHome = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo on the left
          Row(
            children: [if(!isHome) GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SizedBox(
                    height: 20,
                    width: 20,
                    child: Icon(Ionicons.arrow_back, color: textColorWhite)
                ),
            ),
              horizontalSpace(10),

              Image.asset(
              Assets.pngsLogo,
                height: 30,
              ),
              horizontalSpace(20),
              Text(
                'Sirteefy Apps',
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                                 ),
              ),
            ],
          ),
          // Navigation items on the right
        if (isHome) ResponsiveVisibility(
            replacement: IconButton(
              icon: const Icon(Icons.menu, color: textColorWhite),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            hiddenConditions: const [Condition.smallerThan(name: TABLET),
              Condition.equals(name: TABLET),
              Condition.smallerThan(name: MOBILE)
            ],
            child: Row(
              children: [
                buildNavItem('Home'),
                const SizedBox(width: 20),
                buildNavItem('About'),
                const SizedBox(width: 20),
                buildNavItem('Services'),
                const SizedBox(width: 20),
                buildNavItem('Contact'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
