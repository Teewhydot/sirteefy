import 'package:flutter/material.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import 'package:sirteefy/utils/other/misc.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';

class StupidQuote extends StatelessWidget {
  const StupidQuote({super.key});

  @override
  Widget build(BuildContext context) {
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
                      color: primaryColor,
                      child: const Icon(Icons.format_quote, color: textColorGray))),
              Positioned(
                  bottom: -10,
                  right: 10,
                  child: Container(
                      height: 25,
                      width: 25,
                      color: primaryColor,
                      child: const Icon(Icons.format_quote, color: textColorGray))),
            ],
          ),
          IntrinsicWidth(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
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
