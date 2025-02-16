import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/sirteefy/presentation/manager/projects/projects_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/section_header.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../widgets/header.dart';

class AllProjects extends ConsumerWidget {
  const AllProjects({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        const SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Header(
            isHome: false,
            showNav: false,
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          verticalSpace(20),
          const SectionHeader(
            title: 'All Projects',
            rightSection: false,
          ),
          verticalSpace(20),
          BlocBuilder<ProjectsBloc, ProjectsState>(
            builder: (context, state) {
              if (state is ProjectsInitial) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is ProjectsLoading) {
                return const Center(
                  child: Skeletonizer(
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      runSpacing: 20,
                      children: [
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                        ProjectCard(),
                      ],
                    ),
                  ),
                );
              }
              if (state is ProjectsLoaded) {
                return Center(
                  child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      runSpacing: 20,
                      children: state.projects
                          .map((e) => ProjectCard(
                                projectName: e.name,
                                projectDescription: e.description,
                                projectGithubLink: e.githubLink,
                                projectLiveLink: e.projectUrl,
                                projectTechStack: e.technologies,
                                projectImageUrl: e.imageUrl,
                              ))
                          .toList()),
                );
              }
              return const Center(child: Text('Error'));
            },
          ),
          verticalSpace(20),
        ]))
      ],
    )));
  }
}
