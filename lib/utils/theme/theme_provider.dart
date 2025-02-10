import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Asynchronous function to get the stored theme mode
Future<bool> getStoredThemeMode() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getBool('darkMode') ?? false;
}

// FutureProvider to provide the initial theme mode value
final initialThemeModeProvider = FutureProvider<bool>((ref) async {
  return await getStoredThemeMode();
});

// ChangeNotifierProvider to use the value from the FutureProvider
final themeProviderController = ChangeNotifierProvider<ThemeProvider>((ref) {
  final isDarkMode = ref.watch(initialThemeModeProvider).maybeWhen(
        data: (value) => value,
        orElse: () => false,
      );
  return ThemeProvider(isDarkMode);
});

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkModeActive => themeMode == ThemeMode.dark;

  ThemeProvider(bool isDarkMode) {
    themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light
        : ThemeMode.dark;
    sharedPreferences.setBool('darkMode', isDarkModeActive);
    notifyListeners();
  }
}
