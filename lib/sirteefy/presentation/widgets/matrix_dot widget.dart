import 'package:flutter/material.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';


class MatrixDot extends StatelessWidget {
final int l;
final int r;

const MatrixDot({super.key, this.l = 5, this.r = 5});
  @override
  Widget build(BuildContext context) {
    // 6 by 6 matrix of dots
    return Column(
      children: List.generate(l, (index) {
        return Row(
          children: List.generate(r, (index) {
            return Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: textColorGray,
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      }),
    );
  }
}
