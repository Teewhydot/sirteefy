import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/color_palette/colors.dart';

enum AngleType { left, right }

class AngleWidget extends StatelessWidget {
  final AngleType angleType;
  const AngleWidget({
    super.key,
    required this.angleType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border(
          left: angleType == AngleType.left
              ? const BorderSide(
                  width: 2,
            color: accentColor,
                )
              : BorderSide.none,
          top: angleType == AngleType.left
              ? const BorderSide(
                  width: 2,
                  color: accentColor,
                )
              : BorderSide.none,
          bottom: angleType == AngleType.right
              ? const BorderSide(
                  width: 2,
                  color: accentColor,
                )
              : BorderSide.none,
          right: angleType == AngleType.right? const BorderSide(
                  width: 2,
                  color: accentColor,
                )
              : BorderSide.none,
        ),
      ),
    );
  }
}
