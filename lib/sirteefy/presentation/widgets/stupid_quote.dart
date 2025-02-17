import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/sirteefy/presentation/manager/stupid_quote/get_stupid_quote_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/project_card.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/other/misc.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/theme/theme_provider.dart';

class StupidQuote extends ConsumerWidget {
  const StupidQuote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);
    return BlocBuilder<GetStupidQuoteBloc, GetStupidQuoteState>(
      builder: (context, state) {
        if (state is GetStupidQuoteInitial) {
          context.read<GetStupidQuoteBloc>().add(GetStupidQuote());
          return const SizedBox.shrink();
        } else if (state is GetStupidQuoteLoading) {
          return Skeletonizer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      IntrinsicWidth(
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: themeProvider.isDarkModeActive
                                    ? grayColor
                                    : blackColor),
                            borderRadius:
                                BorderRadius.circular(borderWidthRadius),
                          ),
                          child: Text(
                              'I am a software developer, I am not a magician, I can\'t fix stupid.',
                              style: AppThemes.firaCodeStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Positioned(
                          top: -10,
                          left: 10,
                          child: Container(
                              height: 25,
                              width: 25,
                              color: themeProvider.isDarkModeActive
                                  ? darkModeBGColor
                                  : grayColor,
                              child: Icon(Icons.format_quote,
                                  color: Colors.green.shade100))),
                      Positioned(
                          bottom: -10,
                          right: 10,
                          child: Container(
                              height: 25,
                              width: 25,
                              color: themeProvider.isDarkModeActive
                                  ? darkModeBGColor
                                  : grayColor,
                              child: Icon(Icons.format_quote,
                                  color: Colors.green.shade100))),
                    ],
                  ),
                  IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                              width: 1,
                              color: themeProvider.isDarkModeActive
                                  ? grayColor
                                  : blackColor),
                          right: BorderSide(
                              width: 1,
                              color: themeProvider.isDarkModeActive
                                  ? grayColor
                                  : blackColor),
                          bottom: BorderSide(
                              width: 1,
                              color: themeProvider.isDarkModeActive
                                  ? grayColor
                                  : blackColor),
                        ),
                        borderRadius: BorderRadius.circular(borderWidthRadius),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.refresh),
                        color: accentColor,
                        onPressed: () {
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is GetStupidQuoteLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IntrinsicWidth(
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: themeProvider.isDarkModeActive
                                  ? grayColor
                                  : blackColor),
                          borderRadius:
                              BorderRadius.circular(borderWidthRadius),
                        ),
                        child: Text(state.stupidQuote.slip?.advice ?? 'Nothing for now',
                            style: AppThemes.firaCodeStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Positioned(
                        top: -10,
                        left: 10,
                        child: Container(
                            height: 25,
                            width: 25,
                            color: themeProvider.isDarkModeActive
                                ? darkModeBGColor
                                : grayColor,
                            child: Icon(Icons.format_quote,
                                color: Colors.green.shade100))),
                    Positioned(
                        bottom: -10,
                        right: 10,
                        child: Container(
                            height: 25,
                            width: 25,
                            color: themeProvider.isDarkModeActive
                                ? darkModeBGColor
                                : grayColor,
                            child: Icon(Icons.format_quote,
                                color: Colors.green.shade100))),
                  ],
                ),
                IntrinsicWidth(
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                            width: 1,
                            color: themeProvider.isDarkModeActive
                                ? grayColor
                                : blackColor),
                        right: BorderSide(
                            width: 1,
                            color: themeProvider.isDarkModeActive
                                ? grayColor
                                : blackColor),
                        bottom: BorderSide(
                            width: 1,
                            color: themeProvider.isDarkModeActive
                                ? grayColor
                                : blackColor),
                      ),
                      borderRadius: BorderRadius.circular(borderWidthRadius),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      color: accentColor,
                      onPressed: () {
                        context.read<GetStupidQuoteBloc>().add(GetStupidQuote());
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is GetStupidQuoteError) {
          return Center(
            child: Column(
              children: [
                Text(
                  state.message,
                  style: AppThemes.firaCodeStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ProjectButton(
                    borderColor: accentColor,
                    icon: Icons.refresh,
                    text: "Retry",
                    onTap: () {
                      context.read<GetStupidQuoteBloc>().add(GetStupidQuote());
                    })
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
