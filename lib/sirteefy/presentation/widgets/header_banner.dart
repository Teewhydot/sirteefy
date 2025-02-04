import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Container(
            width: 500,
            height: 200,
            color: Colors.red,
          ),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Container(
            width: 500,
            height: 200,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
