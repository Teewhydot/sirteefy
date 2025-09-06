import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/manager/home_projects/home_projects_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProjectsBloc, HomeProjectsState>(
      builder: (context, state) {
        if (state is HomeProjectsInitial) {
          context.read<HomeProjectsBloc>().add(GetHomeProjectsEvent());
          return Container();
        } else if (state is HomeProjectsLoading) {
          return ResponsiveRowColumn(
              columnSpacing: 20,
              rowSpacing: 20,
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
                      ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: List.generate(
                  3,
                  (index) => const ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: Skeletonizer(
                          child: ProjectCard(),
                        ),
                      )));
        } else if (state is HomeProjectsError) {
          return Center(
              child: Column(
            children: [
              Text(state.message),
              verticalSpace(20),
              ProjectButton(
                borderColor: accentColor,
                icon: Ionicons.reload,
                text: 'Retry',
                onTap: () {
                  context.read<HomeProjectsBloc>().add(GetHomeProjectsEvent());
                },
              )
            ],
          ));
        } else if (state is HomeProjectsLoaded) {
          if (state.projects.isEmpty) {
            return const Center(child: Text('No projects available'));
          } else {
            return ResponsiveRowColumn(
              columnSpacing: 20,
              rowSpacing: 20,
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              layout: ResponsiveBreakpoints.of(context).smallerThan(TABLET) ||
                      ResponsiveBreakpoints.of(context).smallerThan(DESKTOP)
                  ? ResponsiveRowColumnType.COLUMN
                  : ResponsiveRowColumnType.ROW,
              children: state.projects
                  .map((project) => ResponsiveRowColumnItem(
                        rowFlex: 1,
                        child: ProjectCard(
                          projectName: project.name,
                          projectDescription: project.description,
                          projectGithubLink: project.githubLink,
                          projectLiveLink: project.projectUrl,
                          projectTechStack: project.technologies,
                          projectImageUrl: project.imageUrl,
                          projectImages: project.images,
                        ),
                      ))
                  .toList(),
            );
          }
        }
        return const Center(child: Text('Error'));
      },
    );
  }
}
