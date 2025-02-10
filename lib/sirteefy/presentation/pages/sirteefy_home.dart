import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/header_banner.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/projects.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/section_header.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import '../../../utils/theme/theme_provider.dart';
import '../widgets/about_me.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/my_skills.dart';
import '../widgets/stupid_quote.dart';

class SirteefyHome extends ConsumerStatefulWidget {
  const SirteefyHome({super.key});

  @override
  ConsumerState<SirteefyHome> createState() => _SirteefyHomeState();
}

class _SirteefyHomeState extends ConsumerState<SirteefyHome> {
  final GlobalKey contactKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeProviderController);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    KeyedSubtree(key: homeKey, child: verticalSpace(100)),
                    const HeaderBanner(),
                    verticalSpace(100),
                    GestureDetector(
                        onTap: () {
                          themeProvider.toggleTheme();
                        },
                        child: const StupidQuote()),
                    KeyedSubtree(
                      key: projectsKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: verticalSpace(100),
                      ),
                    ),
                    const SectionHeader(
                      title: 'Projects',
                    ),
                    verticalSpace(30),
                    const Projects(),
                    KeyedSubtree(key: skillsKey,  child: verticalSpace(100)),
                    const SectionHeader(
                      title: 'Skills',
                      rightSection: false,
                    ),
                    verticalSpace(30),
                    const MySkills(),
                    KeyedSubtree(key: aboutKey, child: verticalSpace(100)),
                    const SectionHeader(
                      title: 'About Me',
                      rightSection: false,
                    ),
                    verticalSpace(30),
                    const AboutMe(),
                    KeyedSubtree(key: contactKey, child: verticalSpace(100)),
                    const SectionHeader(
                      title: 'Contact',
                      rightSection: false,
                    ),
                    verticalSpace(30),
                    const Contact(),
                    verticalSpace(100),
                    const Divider(
                      height: 4,
                    ),
                    verticalSpace(30),
                    const Footer(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Header(
                  isHome: true,
                  homeKey: homeKey,
                  aboutKey: aboutKey,
                  servicesKey: servicesKey,
                  contactKey: contactKey,
                  projectsKey: projectsKey,
                  skillsKey: skillsKey,
                )),
          ],
        ),
      ),
    );
  }
}
