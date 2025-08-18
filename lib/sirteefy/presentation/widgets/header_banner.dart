import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/manager/current_project/current_project_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/current_project_widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/matrix_dot%20widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/my_skills.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../generated/assets.dart';

class HeaderBanner extends ConsumerWidget {
  final GlobalKey? contactKey;

  const HeaderBanner({super.key, this.contactKey});
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      )),
                  Positioned(
                      top: 50,
                      right: 50,
                      child: Opacity(
                          opacity: 0.3,
                          child: SvgPicture.asset(
                            Assets.svgsRectangleDesign,
                            color: accentColor,
                          ))),
                  Positioned(
                    bottom: 0,
                    child: BlocBuilder<CurrentProjectBloc, CurrentProjectState>(
                      builder: (context, state) {
                        if (state is CurrentProjectInitial) {
                          context
                              .read<CurrentProjectBloc>()
                              .add(FetchCurrentProject());
                          return const SizedBox.shrink();
                        } else if (state is CurrentProjectLoading) {
                          return Skeletonizer(
                            child: IntrinsicWidth(
                              child: ScrollingText(
                                project: "Sirteefy",
                                style: AppThemes.firaCodeStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                                projectStyle: AppThemes.firaCodeStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: accentColor,
                                ),
                              ),
                            ),
                          );
                        } else if (state is CurrentProjectLoaded) {
                          return IntrinsicWidth(
                            child: ScrollingText(
                              project: state.currentProject,
                              style: AppThemes.firaCodeStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              projectStyle: AppThemes.firaCodeStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: accentColor,
                              ),
                            ),
                          );
                        } else if (state is CurrentProjectError) {
                          return Center(
                            child: Column(
                              children: [
                                Text(state.message),
                                verticalSpace(10),
                                ProjectButton(
                                    borderColor: accentColor,
                                    icon: Icons.refresh,
                                    text: 'Retry',
                                    onTap: () {
                                      context
                                          .read<CurrentProjectBloc>()
                                          .add(FetchCurrentProject());
                                    })
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  )
                ],
              )),
        ),
        ResponsiveRowColumnItem(
          rowFlex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: "",
                      style: AppThemes.firaCodeStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                    textSpanText("Abubakar Issa is a", ref),
                    TextSpan(
                      text: "full stack mobile engineer ",
                      style: AppThemes.firaCodeStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                      ),
                    ),
                    textSpanText("and a", ref),
                    TextSpan(
                      text: " tech enthusiast ",
                      style: AppThemes.firaCodeStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: accentColor,
                      ),
                    ),
                  ])),
              verticalSpace(20),
              Text(
                'Using his expertise with Flutter and Golang, He crafts beautiful and functional web and mobile applications with a touch of elegance and simplicity. He is passionate about building software that solves real-world problems and makes life easier for people.',
                style: AppThemes.firaCodeStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              verticalSpace(50),
              ProjectButton(
                borderColor: accentColor,
                icon: Ionicons.phone_portrait_outline,
                text: 'Get in touch',
                onTap: () {
                  scrollToSection(contactKey ?? GlobalKey());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
