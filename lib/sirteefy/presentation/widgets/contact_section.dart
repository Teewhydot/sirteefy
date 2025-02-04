import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
          child: Container(
            width: 300,
            height: 200,
            color: Colors.red,
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
