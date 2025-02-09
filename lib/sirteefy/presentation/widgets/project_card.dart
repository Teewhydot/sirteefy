import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/other/misc.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderWidthRadius),
        border: Border.all(

          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350,
            height: 200,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderWidthRadius),
                topRight: Radius.circular(borderWidthRadius),
              ),
              image: DecorationImage(
                image: AssetImage(Assets.pngsMe),
                fit: BoxFit.cover,
              ),
            ),
          ),
          firacodeStyleText("Flutter,Dart,Firebase Github",
              fontWeight: FontWeight.normal, fontSize: 16),
          const Divider(

            thickness: 2,
          ),
          verticalSpace(10),
          firacodeStyleText("Spoteefy",
              fontWeight: FontWeight.bold, fontSize: 16),
          verticalSpace(10),
          firacodeStyleText(
              "A music player app built with flutter and firebase and some state management package",
              fontWeight: FontWeight.normal,
              fontSize: 16),
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const ProjectButton(
                  icon: Ionicons.logo_github,
                  text: "Code",
                  borderColor: textColorPurple,
                ),
                horizontalSpace(10),
                const ProjectButton(
                  borderColor: textColorPurple,
                  icon: Ionicons.play,
                  text: "Live",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectButton extends StatelessWidget {
  final Color borderColor;
  final IconData icon;
  final String text;

  const ProjectButton(
      {super.key, required this.borderColor, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderWidthRadius),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              firacodeStyleText(text, fontWeight: FontWeight.normal, fontSize: 16,applyPadding: false),
              horizontalSpace(10),
              Align(alignment: Alignment.center,  child: Icon(icon,color: borderColor,))
            ],
          ),
        ),
      ),
    );
  }
}
