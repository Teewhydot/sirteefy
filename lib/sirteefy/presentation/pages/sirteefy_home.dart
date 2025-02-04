import 'package:flutter/material.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/header_banner.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/projects.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/section_header.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../widgets/about_me.dart';
import '../widgets/contact_section.dart';
import '../widgets/header.dart';
import '../widgets/my_skills.dart';
import '../widgets/stupid_quote.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Header(),
                verticalSpace(30),
                const HeaderBanner(),
                verticalSpace(10),
                const StupidQuote(),
                verticalSpace(100),
                const SectionHeader(
                  title: 'Projects',
                ),
                verticalSpace(30),
                const Projects(),
              verticalSpace(100),
                const SectionHeader(
                  title: 'Skills',
                  rightSection: false,
                ),
                verticalSpace(30),
                const MySkills(),
                verticalSpace(100),
                const SectionHeader(
                  title: 'About Me',
                  rightSection: false,
                ),
                verticalSpace(30),
                AboutMe(),
                verticalSpace(100),
                const SectionHeader(
                  title: 'Contact',
                  rightSection: false,
                ),
                verticalSpace(30),
                Contact(),
              ],
            ),
          ),
        ),
      )
    );
  }
}
