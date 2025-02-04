import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/nav_item.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../generated/assets.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool rightSection;
  const SectionHeader({super.key, required this.title, this.rightSection  = true});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildNavItem(title),
            horizontalSpace(10),
          Container(
            height: 2,
            width:  ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
                ResponsiveBreakpoints.of(context).smallerThan(DESKTOP) ? 100 : 300,
            color: textColorPurple,
          )
          ],
        ),
        Visibility(
          visible: rightSection,
          child: Row(
            children: [
              Text('View all',
                  style: AppThemes.firaCodeStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: textColorGray,
                  )),
              horizontalSpace(5),
              SvgPicture.asset(Assets.svgsSquiglyArrow)
            ],
          ),
        ),
      ],
    );
  }
}
