import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/spacing.dart';
import 'package:sirteefy/sirteefy/presentation/widgets/theme_widget.dart';
import 'package:sirteefy/utils/color_palette/colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/theme/sirteefy_themes.dart';
import '../../../utils/theme/theme_provider.dart';
import '../manager/nav_manager/nav.dart';
import 'nav_item.dart';

class Header extends ConsumerStatefulWidget {
  final bool isHome;
  final GlobalKey? homeKey;
  final GlobalKey? aboutKey;
  final GlobalKey? servicesKey;
  final GlobalKey? contactKey;
  final GlobalKey? projectsKey;
  final GlobalKey? skillsKey;
  final bool? showNav;

  const Header(
      {super.key,
      this.showNav = true,
      this.isHome = false,
      this.homeKey,
      this.aboutKey,
      this.servicesKey,
      this.contactKey,
      this.projectsKey,
      this.skillsKey});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends ConsumerState<Header>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    final navManager = ref.read(navManagerProvider.notifier);
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      _controller.reverse();
      navManager.toggleNav();
    }
  }

  void _togglePanel() {
    final navManager = ref.read(navManagerProvider.notifier);
    final isNavOpen = ref.watch(navManagerProvider);
    navManager.toggleNav();
    setState(() {
      if (!isNavOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.watch(themeProviderController);
    final isNavOpen = ref.watch(navManagerProvider);
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color:
                  themeProvider.isDarkModeActive ? darkModeBGColor : grayColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo on the left
                  Row(
                    children: [
                      Row(
                        children: [
                          if (!widget.isHome)
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Icon(Ionicons.arrow_back,
                                    color: themeProvider.isDarkModeActive
                                        ? grayColor
                                        : blackColor),
                              ),
                            ),
                          horizontalSpace(10),
                          Image.asset(
                            Assets.pngsLogo,
                            height: 30,
                          ),
                          horizontalSpace(20),
                          Text(
                            'Sirteefy Apps',
                            style: AppThemes.firaCodeStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          horizontalSpace(20),
                        ],
                      ),
                    ],
                  ),
                  // Navigation items on the right
                  if (widget.isHome)
                    ResponsiveVisibility(
                      replacement: IconButton(
                        icon: Icon(isNavOpen ? Icons.close : Icons.menu,
                            color: themeProvider.isDarkModeActive
                                ? grayColor
                                : blackColor),
                        onPressed: _togglePanel,
                      ),
                      hiddenConditions: const [
                        Condition.smallerThan(name: TABLET),
                        Condition.equals(name: TABLET),
                        Condition.smallerThan(name: MOBILE)
                      ],
                      child: Row(
                        children: [
                          NavItem(
                            title: 'Home',
                            onTap: () =>
                                scrollToSection(widget.homeKey ?? GlobalKey()),
                            hasAction: false,
                          ),
                          horizontalSpace(20),
                          NavItem(
                            title: 'About',
                            onTap: () =>
                                scrollToSection(widget.aboutKey ?? GlobalKey()),
                            hasAction: false,
                          ),
                          horizontalSpace(20),
                          NavItem(
                            title: 'Projects',
                            onTap: () =>
                                scrollToSection(widget.projectsKey ?? GlobalKey()),
                            hasAction: false,
                          ),
                          horizontalSpace(20),
                          NavItem(
                            title: 'Skills',
                            onTap: () => scrollToSection(
                                widget.skillsKey ?? GlobalKey()),
                            hasAction: false,
                          ),
                          horizontalSpace(20),
                          NavItem(
                            title: 'Contact',
                            onTap: () => scrollToSection(
                                widget.contactKey ?? GlobalKey()),
                            hasAction: false,
                          ),
                          horizontalSpace(20),
                          const ThemeWidget(),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        if (widget.showNav == true)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizeTransition(
              sizeFactor: _animation,
              axisAlignment: -1.0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkModeActive
                      ? darkModeBGColor
                      : grayColor,
                  border: Border.all(color: accentColor),
                ),
                child: Column(
                  children: [
                    NavItem(
                      title: 'Home',
                      onTap: () =>
                          scrollToSection(widget.homeKey ?? GlobalKey()),
                      hasAction: false,
                    ),
                    verticalSpace(10),
                    NavItem(
                      title: 'About',
                      onTap: () =>
                          scrollToSection(widget.aboutKey ?? GlobalKey()),
                      hasAction: false,
                    ),
                    verticalSpace(10),
                    NavItem(
                      title: 'Projects',
                      onTap: () =>
                          scrollToSection(widget.projectsKey ?? GlobalKey()),
                      hasAction: false,
                    ),
                    verticalSpace(10),
                    NavItem(
                      title: 'Skills',
                      onTap: () =>
                          scrollToSection(widget.skillsKey ?? GlobalKey()),
                      hasAction: false,
                    ),
                    verticalSpace(10),
                    NavItem(
                      title: 'Contact',
                      onTap: () =>
                          scrollToSection(widget.contactKey ?? GlobalKey()),
                      hasAction: false,
                    ),
                    verticalSpace(10),
                    NavItem(
                        title: 'Toggle Theme',
                        onTap: () => themeProvider.toggleTheme(),
                        hasAction: true,
                        // actionWidget: Icon(
                        //   themeProvider.isDarkModeActive
                        //       ? Ionicons.sunny_outline
                        //       : Ionicons.moon_outline,
                        //   color: accentColor,
                        // ),
                      actionWidget: const ThemeWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
