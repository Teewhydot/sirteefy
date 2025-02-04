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
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              backgroundColor: primaryColor,
              flexibleSpace: Header(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: HeaderBanner(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: StupidQuote(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SectionHeader(
                      title: 'Projects',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Projects(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SectionHeader(
                      title: 'Skills',
                      rightSection: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: MySkills(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SectionHeader(
                      title: 'About Me',
                      rightSection: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: AboutMe(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SectionHeader(
                      title: 'Contact',
                      rightSection: false,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Contact(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(100),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Divider(
                      color: textColorGray,
                      height: 4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Footer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: verticalSpace(30),
                  ),
                ],
              ),
            )          ],
        ),
      ),
    );
  }
}
