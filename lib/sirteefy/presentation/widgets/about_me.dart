import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/sirteefy/presentation/manager/download_cv/download_cv_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/sirteefy_themes.dart';

class AboutMe extends ConsumerWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              textSpanText("Hi, I'm Issa, a self taught", ref),
              TextSpan(
                text: " software developer ",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              textSpanText("with specialty in", ref),
              TextSpan(
                text: " Flutter",
                style: AppThemes.firaCodeStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: accentColor,
                ),
              ),
              textSpanText(" and", ref),
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
        BlocBuilder<DownloadCvBloc, DownloadCvState>(
          builder: (context, state) {
            String buttonText = 'Download CV';
            IconData icon =  Icons.send;
            if (state is DownloadCvInProgress) {
              buttonText = 'Downloading...${state.percentage}%';
              icon = Icons.cloud_download;
            } else if (state is DownloadCvSuccess) {
              buttonText = 'Downloaded';
              icon = Icons.check_circle;
            } else if (state is DownloadCvFailure) {
              buttonText = 'Download failed';
              icon = Icons.error;
            } else if (state is DownloadCvInitial) {
              buttonText = 'Download CV';
            }
            return  ProjectButton(
              borderColor: accentColor,
              icon: icon,
              text: buttonText,
              onTap: () {
                context.read<DownloadCvBloc>().add(
                      DownloadCv(),
                    );
              },
            );
          },
        ),
      ],
    );
  }
}
