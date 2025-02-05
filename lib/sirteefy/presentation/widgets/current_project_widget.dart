import 'package:flutter/material.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/animated_square.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/other/misc.dart';

class CurrentProjectWidget extends StatelessWidget {
final Color borderColor;
final Color containerColor;

final String projectTitle;


const CurrentProjectWidget({  this.borderColor = textColorWhite,  this.containerColor = primaryColor,  this.projectTitle = "Project Title", super.key});
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderWidthRadius),
          color: containerColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              const AnimatedSquare(),
             horizontalSpace(10),
             RichText(text: TextSpan(
               text: "Currently working on ",
               style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textColorGray,
               ),
               children: [
                  TextSpan(
                    text: projectTitle,
                    style: AppThemes.firaCodeStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColorWhite,
                    ),
                  ),
               ]
             )),
            ],
          ),
        ),
      ),
    );
  }
}
