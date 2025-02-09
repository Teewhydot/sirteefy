import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/current_project_widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/matrix_dot%20widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../generated/assets.dart';

class HeaderBanner extends StatelessWidget {
  const HeaderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveRowColumn(
      columnSpacing: 20,
      rowSpacing: 10,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowCrossAxisAlignment: CrossAxisAlignment.center,
      layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
          ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
          ? ResponsiveRowColumnType.COLUMN
          : ResponsiveRowColumnType.ROW,
      children: [
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: SizedBox(
            width: 500,
            height: 400,
            child: Stack(
              children: [
                Image.asset(Assets.pngsMeBw, fit: BoxFit.cover),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.1,
                    child: MatrixDot(
                      l: 6,
                      r: 6,
                    ),
                  )
                ),
                Positioned( top: 50,right: 50, child: Opacity( opacity: 0.3, child: SvgPicture.asset(Assets.svgsRectangleDesign,color: textColorPurple,))),
                 Positioned(
                  bottom: 0,
                  child: IntrinsicWidth(
                    child: ScrollingText(
                      project: "Sirteefy",
                      style: AppThemes.firaCodeStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: textColorPurple,
                      ),
                    ),
                  ),
                )
              ],
            )
          ),
        ),

        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(text: TextSpan(
                text: "",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  textSpanText("Tunde is a"),
                  TextSpan(
                      text: " software developer ",
                    style: AppThemes.firaCodeStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColorPurple,
                  ),
                  ),
                  textSpanText("and a"),

                  TextSpan(
                    text: " tech enthusiast ",
                    style: AppThemes.firaCodeStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColorPurple,
                    ),
                  ),
                ]
              )),
              verticalSpace(20),
               Text('Using his expertise with Flutter and Jetpack Compose, He crafts beautiful and functional web and mobile applications with a touch of elegance and simplicity. He is passionate about building software that solves real-world problems and makes life easier for people.',
                style: AppThemes.firaCodeStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              verticalSpace(50),
                    const ProjectButton(borderColor: textColorPurple, icon: Ionicons.phone_portrait_outline, text: 'Get in touch',),
            ],
          ),
        ),
      ],
    );
  }
}
