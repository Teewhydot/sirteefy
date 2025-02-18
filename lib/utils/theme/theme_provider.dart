import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Asynchronous function to get the stored theme mode
Future<bool> getStoredThemeMode() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('lightMode') ?? false;
}

// FutureProvider to provide the initial theme mode value
final initialThemeModeProvider = FutureProvider<bool>((ref) async {
  return await getStoredThemeMode();
});

// ChangeNotifierProvider to use the value from the FutureProvider
final themeProviderController = ChangeNotifierProvider<ThemeProvider>((ref) {
  final isLightMode = ref.watch(initialThemeModeProvider).maybeWhen(
        data: (value) => value,
        orElse: () => false,
      );
  return ThemeProvider(isLightMode);
});

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark; // Default to dark mode
  bool get isDarkModeActive => themeMode == ThemeMode.dark;

  ThemeProvider(bool isLightMode) {
    themeMode = isLightMode ? ThemeMode.light : ThemeMode.dark;
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    sharedPreferences.setBool('lightMode', themeMode==ThemeMode.light);
    notifyListeners();
  }
}
