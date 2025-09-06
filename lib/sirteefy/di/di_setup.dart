

import 'package:get_it/get_it.dart';

import '../data/remote/data_sources/stupid_quote_datasource.dart';
import '../data/repositories/projects_repo_impl.dart';
import '../domain/repositories/project/projects_repo.dart';

final getIt = GetIt.instance;

void setupDIService() {
  getIt.registerSingleton<StupidQuoteDataSource>(StupidQuoteFirebaseImpl());
  getIt.registerSingleton<ProjectsRepo>(SirteefyRepositoryImpl());
}
