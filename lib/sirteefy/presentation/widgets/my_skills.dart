import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/matrix_dot%20widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/skill_category_card.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../../../generated/assets.dart';

class MySkills extends StatelessWidget {
  const MySkills({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          const Positioned(
            top: 50,
            left: 0,
            child: Opacity(
              opacity: 0.1,
              child: MatrixDot(
                l: 6,
                r: 6,
              ),
            ),
          ),
          Positioned(
              top: -20,
              left: 250,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(
                      color: textColorPurple,
                      width: 2,
                    ),
                  ),
                ),
              )),
          const Positioned(
            top: 200,
            left: 300,
            child: Opacity(
              opacity: 0.1,
              child: MatrixDot(
                l: 6,
                r: 6,
              ),
            ),
          ),
          Positioned(
              top: 200,
              left: 100,
              child: Opacity(
                  opacity: 0.1,
                  child: SvgPicture.asset(Assets.svgsRectangleDesign))),
          Positioned(
              top: 100,
              left: 450,
              child: Opacity(
                opacity: 0.1,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    border: Border.all(
                      color: textColorPurple,
                      width: 2,
                    ),
                  ),
                ),
              )),
          ResponsiveRowColumn(
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            layout: ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: const [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: SkillCategoryCard(
                    title: "Tools",
                    content: Column(
                      children: [
                        Text('Dart, Python, Java, C++'),
                        Text('Dart, Python, Java, C++'),
                      ],
                    )),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: SkillCategoryCard(
                    title: "Tools",
                    content: Column(
                      children: [
                        Text('Dart, Python, Java, C++'),
                        Text('Dart, Python, Java, C++'),
                      ],
                    )),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: SkillCategoryCard(
                    title: "Tools",
                    content: Column(
                      children: [
                        Text('Dart, Python, Java, C++'),
                        Text('Dart, Python, Java, C++'),
                      ],
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
