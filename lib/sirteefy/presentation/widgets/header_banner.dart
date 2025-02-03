import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          child: Container(
            width: 100,
            height: 200,
            color: Colors.red,
          ),
        ),
        ResponsiveRowColumnItem(
          child: Container(
            width: 200,
            height: 100,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
