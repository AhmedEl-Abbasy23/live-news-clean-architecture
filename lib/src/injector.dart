import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:live_news/src/data/dataresources/remote/news_api_service.dart';
import 'package:live_news/src/data/repositories/articles_repository_impl.dart';
import 'package:live_news/src/domain/repositories/articles_repository.dart';
import 'package:live_news/src/domain/usecases/get_articles_usecase.dart';
import 'presentation/blocs/remote_articles/remote_articles_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio client
  injector.registerSingleton<Dio>(Dio());

  // Dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<ArticlesRepository>(
      ArticlesRepositoryImpl(injector()));

  // UseCases
  injector
      .registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  // Blocs
  injector.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(injector()));
}
