import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/other/misc.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

import '../../../utils/theme/theme_provider.dart';

class StupidQuote extends ConsumerWidget {
  const StupidQuote({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeProvider  = ref.watch(themeProviderController);
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
                          color: themeProvider.isDarkMode?grayColor:blackColor
                    ),
                    borderRadius: BorderRadius.circular(borderWidthRadius),
                  ),
                  child: Text(
                    'I am a software developer, I am not a magician, I can\'t fix stupid.',
                    style: AppThemes.firaCodeStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                        )
                  ),
                ),
              ),
              Positioned(
                  top: -10,
                  left: 10,
                  child: Container(
                      height: 25,
                      width: 25,
                      color: themeProvider.isDarkMode?darkModeBGColor:grayColor,
                      child: Icon(Icons.format_quote, color: Colors.green.shade100))),
              Positioned(
                  bottom: -10,
                  right: 10,
                  child: Container(
                      height: 25,
                      width: 25,
                      color: themeProvider.isDarkMode?darkModeBGColor:grayColor,
                      child:  Icon(Icons.format_quote, color:Colors.green.shade100))),
            ],
          ),
          IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 1,
                    color: themeProvider.isDarkMode?grayColor:blackColor
                  ),
                  right: BorderSide(
                    width: 1,
                    color: themeProvider.isDarkMode?grayColor:blackColor
                  ),
                  bottom: BorderSide(
                    width: 1,
                    color: themeProvider.isDarkMode?grayColor:blackColor
                  ),
                ),
                borderRadius: BorderRadius.circular(borderWidthRadius),
              ),
              child: Text(
                'stupid.',
                  style: AppThemes.firaCodeStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
