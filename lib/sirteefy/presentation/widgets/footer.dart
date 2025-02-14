import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/manager/social_media/get_sm_links_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/sirteefy/url_launcher.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/color_palette/colors.dart';
import '../../../utils/theme/theme_provider.dart';

class Footer extends ConsumerWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);

    bool desktop = ResponsiveBreakpoints.of(context).largerOrEqualTo(TABLET);
    return Column(
      children: [
        BlocBuilder<GetSmLinksBloc, GetSmLinksState>(
          builder: (context, state) {
            if (state is GetSmLinksLoaded) {
              return Row(
                mainAxisAlignment: desktop
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      launchWebsiteUrl(state.socialMediaLinks.github ?? '');
                    },
                    icon: Icon(
                      Ionicons.logo_github,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    color:
                        themeProvider.isDarkModeActive ? grayColor : blackColor,
                  ),
                  if (desktop) horizontalSpace(20),
                  IconButton(
                    onPressed: () {
                      launchWebsiteUrl(state.socialMediaLinks.twitter ?? '');
                    },
                    icon: Icon(
                      Ionicons.logo_twitter,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    color:
                        themeProvider.isDarkModeActive ? grayColor : blackColor,
                  ),
                  if (desktop) horizontalSpace(20),
                  IconButton(
                    onPressed: () {
                      launchWebsiteUrl(state.socialMediaLinks.instagram ?? '');
                    },
                    icon: Icon(
                      Ionicons.logo_instagram,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    color:
                        themeProvider.isDarkModeActive ? grayColor : blackColor,
                  ),
                  if (desktop) horizontalSpace(20),
                  IconButton(
                    onPressed: () {
                      launchWebsiteUrl(state.socialMediaLinks.linkedin ?? '');
                    },
                    icon: Icon(
                      Ionicons.logo_linkedin,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    color:
                        themeProvider.isDarkModeActive ? grayColor : blackColor,
                  ),
                ],
              );
            } else if (state is GetSmLinksLoading) {
              return Skeletonizer(
                child: Row(
                  mainAxisAlignment: desktop
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Ionicons.logo_github,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    if (desktop) horizontalSpace(20),
                    Icon(
                      Ionicons.logo_twitter,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    if (desktop) horizontalSpace(20),
                    Icon(
                      Ionicons.logo_instagram,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                    if (desktop) horizontalSpace(20),
                    Icon(
                      Ionicons.logo_linkedin,
                      color: themeProvider.isDarkModeActive
                          ? grayColor
                          : blackColor,
                    ),
                  ],
                ),
              );
            } else if (state is GetSmLinksInitial) {
              context.read<GetSmLinksBloc>().add(GetSmLinks());
              return const SizedBox();
            }
            return const SizedBox();
          },
        ),
        verticalSpace(20),
        Text(
          '© 2025 Sirteefy. All rights reserved.',
          style: AppThemes.firaCodeStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
