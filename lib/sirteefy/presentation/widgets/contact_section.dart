import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowSpacing: 10,
      columnSpacing: 10,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'I am available for freelance work. If you have a project that you want to get started, think you need my help with something or just fancy saying hey, then get in touch.',
                  style: AppThemes.firaCodeStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: textColorGray,
                  )
              ),
              const SizedBox(height: 20),
              // ContactFormWidget(),
            ],
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
