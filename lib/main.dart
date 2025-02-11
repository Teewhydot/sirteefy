import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sirteefy/sirteefy/presentation/manager/projects/projects_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/manager/skills/skills_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/manager/social_media/get_sm_links_bloc.dart';
import 'package:sirteefy/sirteefy/presentation/pages/sirteefy_home.dart';
import 'package:sirteefy/utils/theme/sirteefy_themes.dart';
import 'package:sirteefy/utils/theme/theme_provider.dart';

void main() {
  runApp(ProviderScope(
      child: MultiBlocProvider(providers: [
    BlocProvider<ProjectsBloc>(
      create: (context) => ProjectsBloc(),
    ),
        BlocProvider<SkillsBloc>(
          create: (context) => SkillsBloc(),
        ),
        BlocProvider<SkillsBloc>(
          create: (context) => SkillsBloc(),
        ),
        BlocProvider<GetSmLinksBloc>(
          create: (context) => GetSmLinksBloc(),
        ),
  ], child: const MyApp())));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeProvider = ref.watch(themeProviderController);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SirteefyHome(),
        theme: AppThemes.lightTheme(),
        darkTheme: AppThemes.darkTheme(),
        themeMode: themeProvider.themeMode,
        builder: (context, child) => ResponsiveBreakpoints.builder(
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
              child: child!,
            ));
  }
}
