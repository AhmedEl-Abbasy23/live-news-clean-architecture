import 'dart:io';

import 'package:dio/dio.dart';
import 'package:live_news/src/app/core/params/article_request.dart';
import 'package:live_news/src/app/core/resources/data_state.dart';
import 'package:live_news/src/data/dataresources/remote/news_api_service.dart';
import 'package:live_news/src/domain/entities/article.dart';
import 'package:live_news/src/domain/repositories/articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final NewsApiService _newsApiService;

  const ArticlesRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  ) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
        apiKey: params.apiKey,
        country: params.country,
        category: params.category,
        page: params.page,
        pageSize: params.pageSize,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
