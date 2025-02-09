import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
            text: TextSpan(
                text: "",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                children: [
              textSpanText("Hi, I'm Issa, a self taught"),
              TextSpan(
                text: " software developer ",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              textSpanText("with specialty in"),
              TextSpan(
                text: " Flutter",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              textSpanText(" and"),
              TextSpan(
                text: " Jetpack Compose ",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
            ])),
        verticalSpace(50),
        Text(
          'Using my expertise with Flutter and Jetpack Compose, I craft beautiful and functional web and mobile applications with great focus on performance, simplicity, and good coding practices. I am passionate about building software that solves real-world problems and makes life easier for people.',
          style: AppThemes.firaCodeStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        verticalSpace(20),
        const ProjectButton(
            borderColor: accentColor,
            icon: Ionicons.document,
            text: 'Download Resume'),
      ],
    );
  }
}
