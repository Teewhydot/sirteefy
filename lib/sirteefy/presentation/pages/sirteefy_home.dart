import 'package:flutter/material.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/header_banner.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/matrix_dot%20widget.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../../../utils/theme/sirteefy_themes.dart';
import '../widgets/header.dart';

class SirteefyHome extends StatefulWidget {
  const SirteefyHome({super.key});

  @override
  State<SirteefyHome> createState() => _SirteefyHomeState();
}

class _SirteefyHomeState extends State<SirteefyHome> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              verticalSpace(30),
              const HeaderBanner(),
            ],
          ),
        ),
      )
    );
  }
}
