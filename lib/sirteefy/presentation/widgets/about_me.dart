import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowSpacing: 10,
      columnSpacing: 10,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Container(
            width: 500,
            height: 400,
            color: Colors.red,
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Container(
            width: 500,
            height: 400,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
