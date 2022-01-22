import 'package:dio/dio.dart';
import 'package:live_news/src/app/core/utils/constants.dart';
import 'package:live_news/src/data/models/breaking_news_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';
@RestApi(baseUrl: kBaseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String baseUrl}) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticles({
    @Query("apiKey") required String apiKey,
    @Query("country") required String country,
    @Query("category") required String category,
    @Query("page") required int page,
    @Query("pageSize") required int pageSize,
  });
}
