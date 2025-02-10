import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/section_header.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/theme_provider.dart';
import '../widgets/header.dart';

class AllProjects extends ConsumerWidget {
  const AllProjects({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);
    return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
               SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                flexibleSpace: const Header(
                  isHome: false,
                ),
                backgroundColor: themeProvider.isDarkModeActive?darkModeBGColor:grayColor,
              ),
              SliverList(delegate: SliverChildListDelegate([
                Stack(children: [
                    SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpace(20),

                        const SectionHeader(
                          title: 'All Projects',
                          rightSection: false,
                        ),
                        verticalSpace(20),
                       const Center(
                         child: Wrap(
                           direction: Axis.horizontal,
                           spacing: 20,
                           crossAxisAlignment: WrapCrossAlignment.center,
                           // alignment: WrapAlignment.center,
                           // runAlignment: WrapAlignment.center,
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
                             ProjectCard(),
                             ProjectCard(),
                             ProjectCard(),
                             ProjectCard(),
                             ProjectCard(),
                             ProjectCard(),
                           ],
                         ),
                       ),
                        verticalSpace(20),
                      ],
                    ),
                  ),
                ]),
              ]))
            ],
          )
        ));
  }
}
