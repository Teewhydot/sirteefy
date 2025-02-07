import 'package:flutter/material.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/header_banner.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/projects.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/section_header.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';

import '../widgets/about_me.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
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
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        // child: CustomScrollView(
        //   slivers: [
        //     const SliverAppBar(
        //       pinned: true,
        //       backgroundColor: primaryColor,
        //       flexibleSpace: Header(),
        //     ),
        //     SliverList(
        //       delegate: SliverChildListDelegate(
        //         [
        //           verticalSpace(30),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: HeaderBanner(),
        //           ),
        //           verticalSpace(100),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: StupidQuote(),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(10.0),
        //             child: verticalSpace(100),
        //           ),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: SectionHeader(
        //               title: 'Projects',
        //             ),
        //           ),
        //           verticalSpace(30),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: Projects(),
        //           ),
        //           verticalSpace(100),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: SectionHeader(
        //               title: 'Skills',
        //               rightSection: false,
        //             ),
        //           ),
        //           verticalSpace(30),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: MySkills(),
        //           ),
        //           verticalSpace(100),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: SectionHeader(
        //               title: 'About Me',
        //               rightSection: false,
        //             ),
        //           ),
        //           verticalSpace(30),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: AboutMe(),
        //           ),
        //           verticalSpace(100),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: SectionHeader(
        //               title: 'Contact',
        //               rightSection: false,
        //             ),
        //           ),
        //           verticalSpace(30),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: Contact(),
        //           ),
        //           verticalSpace(100),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: Divider(
        //               color: textColorGray,
        //               height: 4,
        //             ),
        //           ),
        //           verticalSpace(30),
        //           const Padding(
        //             padding: EdgeInsets.all(10.0),
        //             child: Footer(),
        //           ),
        //           verticalSpace(30),
        //         ],
        //       ),
        //     )          ],
        // ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                const Header(),
                verticalSpace(30),
                const HeaderBanner(),
                verticalSpace(100),
                const StupidQuote(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: verticalSpace(100),
                ),
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
                const AboutMe(),
                verticalSpace(100),
                const SectionHeader(
                  title: 'Contact',
                  rightSection: false,
                ),
                verticalSpace(30),
                const Contact(),
                verticalSpace(100),
                const Divider(
                  color: textColorGray,
                  height: 4,
                ),
                verticalSpace(30),
                const Footer(),
                verticalSpace(30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
