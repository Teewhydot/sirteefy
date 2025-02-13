import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/manager/projects/projects_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsInitial) {
          context.read<ProjectsBloc>().add(GetProjectsEvent());
          return Container();
        } else if (state is ProjectsLoading) {
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
                  rowFlex: 1, child: Skeletonizer(child: ProjectCard())),
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: Skeletonizer(child: ProjectCard())),
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: Skeletonizer(child: ProjectCard())),
            ],
          );
        } else if (state is ProjectsError) {
          return Center(child: Column(
            children: [
              Text(state.message),
              verticalSpace(20),
               ProjectButton(borderColor: accentColor, icon: Ionicons.reload, text: 'Retry',onTap: (){
                context.read<ProjectsBloc>().add(GetProjectsEvent());
               },)
            ],
          ));
        } else if (state is ProjectsLoaded) {
          return ResponsiveRowColumn(
            columnSpacing: 20,
            rowSpacing: 20,
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
                ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                ? ResponsiveRowColumnType.COLUMN
                : ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: ProjectCard(
                projectName: state.projects[0].name,
                projectDescription: state.projects[0].description,
                projectGithubLink: state.projects[0].githubLink,
                projectLiveLink: state.projects[0].projectUrl,
                projectTechStack: state.projects[0].technologies,

              )),
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: ProjectCard(
                projectName: state.projects[1].name,
                projectDescription: state.projects[1].description,
                projectGithubLink: state.projects[1].githubLink,
                projectLiveLink: state.projects[1].projectUrl,
                projectTechStack: state.projects[1].technologies,

              )),
              ResponsiveRowColumnItem(
                  rowFlex: 1, child: ProjectCard(
                projectName: state.projects[2].name,
                projectDescription: state.projects[2].description,
                projectGithubLink: state.projects[2].githubLink,
                projectLiveLink: state.projects[2].projectUrl,
                projectTechStack: state.projects[2].technologies,

              )),
            ],
          );
        }
        return const Center(child: Text('Error'));
      },
    );
  }
}
