import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/other/misc.dart';
import '../../../utils/theme/theme_provider.dart';

class ProjectCard extends ConsumerWidget {
  const ProjectCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider  = ref.watch(themeProviderController);
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderWidthRadius),
        border: Border.all(
          width: 2,
          color: themeProvider.isDarkMode?grayColor:blackColor
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 2,
                  color: themeProvider.isDarkMode?grayColor:blackColor
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderWidthRadius),
                topRight: Radius.circular(borderWidthRadius),
              ),
              image: const DecorationImage(
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
                  borderColor: accentColor,
                ),
                horizontalSpace(10),
                const ProjectButton(
                  borderColor: accentColor,
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
