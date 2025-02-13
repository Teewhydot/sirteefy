import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/sirteefy/url_launcher.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/other/misc.dart';
import '../../../utils/theme/theme_provider.dart';

class ProjectCard extends ConsumerWidget {
final String? projectName;
final String? projectDescription;
final String? projectGithubLink;
final String? projectLiveLink;
final List<String>? projectTechStack;


  const ProjectCard({super.key,  this.projectName,  this.projectDescription,  this.projectGithubLink,  this.projectLiveLink, this.projectTechStack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider  = ref.watch(themeProviderController);
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderWidthRadius),
        border: Border.all(
          width: 2,
          color: themeProvider.isDarkModeActive?grayColor:blackColor
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
                  color: themeProvider.isDarkModeActive?grayColor:blackColor
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
          firacodeStyleText(projectTechStack?.join(', ')??'Tech Stack',
              fontWeight: FontWeight.normal, fontSize: 16),
          const Divider(

            thickness: 2,
          ),
          verticalSpace(10),
          firacodeStyleText(projectName??'Project Name',
              fontWeight: FontWeight.bold, fontSize: 16),
          verticalSpace(10),
          firacodeStyleText(
              projectDescription??'Project Description',
              fontWeight: FontWeight.normal,
              fontSize: 16),
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                 ProjectButton(
                  icon: Ionicons.logo_github,
                  text: "Code",
                  borderColor: accentColor,
                   onTap: (){
                    if(projectGithubLink!=null){
                      launchWebsiteUrl(projectGithubLink!);
                    } else {
                      showToast('No Github link');

                    }
                   },
                ),
                horizontalSpace(10),
                 ProjectButton(
                  borderColor: accentColor,
                  icon: Ionicons.play,
                  text: "Live",
                  onTap: (){
                    if(projectLiveLink!=null){
                      launchWebsiteUrl(projectLiveLink!);
                    } else {
                      showToast('No Live link');
                    }
                  },
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
  final Function() onTap;

  const ProjectButton(
      {super.key, required this.borderColor, required this.icon, required this.text, required this.onTap, });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
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
      ),
    );
  }
}
