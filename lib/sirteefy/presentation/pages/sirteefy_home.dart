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
  @override
  Widget build(BuildContext context) {
    final themeProvider  = ref.watch(themeProviderController);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    verticalSpace(100),
                    const HeaderBanner(),
                    verticalSpace(100),
                    GestureDetector( onTap: (){
                      themeProvider.toggleTheme(themeProvider.isDarkMode);
                    }, child: const StupidQuote()),
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
                          height: 4,
                    ),
                    verticalSpace(30),
                    const Footer(),
                    verticalSpace(30),
                  ],
                ),
              ),
            ),
            const Positioned(top: 0,left: 0,right: 0, child: Header(isHome: true,)),
          ],
        ),
      ),
    );
  }
}
