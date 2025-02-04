import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      columnSpacing: 20,
      rowSpacing: 20,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
    layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
    ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
        ? ResponsiveRowColumnType.COLUMN
        : ResponsiveRowColumnType.ROW,
      children: const [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: ProjectCard()
        ),
        ResponsiveRowColumnItem(
            rowFlex: 1,

            child: ProjectCard()
        ),
        ResponsiveRowColumnItem(
            rowFlex: 1,

            child: ProjectCard()
        ),
      ],

    );
  }
}
