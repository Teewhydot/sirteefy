

import 'package:get_it/get_it.dart';

import '../data/remote/data_sources/stupid_quote_datasource.dart';

final getIt = GetIt.instance;

void setupDIService() {
  getIt.registerSingleton<StupidQuoteDataSource>(StupidQuoteFirebaseImpl());
}
