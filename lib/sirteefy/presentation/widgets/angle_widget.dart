import 'package:flutter/cupertino.dart';

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
                  color: textColorGray,
                  width: 2,
                )
              : BorderSide.none,
          top: angleType == AngleType.left
              ? const BorderSide(
                  color: textColorGray,
                  width: 2,
                )
              : BorderSide.none,
          bottom: angleType == AngleType.right
              ? const BorderSide(
                  color: textColorGray,
                  width: 2,
                )
              : BorderSide.none,
          right: angleType == AngleType.right? const BorderSide(
                  color: textColorGray,
                  width: 2,
                )
              : BorderSide.none,
        )
      ),
    );
  }
}
