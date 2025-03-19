

import 'package:get_it/get_it.dart';

import '../data/remote/data_sources/stupid_quote_datasource.dart';

final getIt = GetIt.instance;

void setupDIService() {
  // if you want to use GoRouter
  getIt.registerSingleton<StupidQuoteDataSource>(StupidQuoteFirebaseImpl());
  // if you want to use GetRouter
  // getIt.registerSingleton<NavigationService>(GetXNavigationService());
}
