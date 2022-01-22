import 'package:floor/floor.dart';
import 'package:live_news/src/app/core/utils/constants.dart';
import 'package:live_news/src/domain/entities/article.dart';

@dao
abstract class ArticleDao {
  // getAllArticles(): This method is annotated with @ Query which tells our what it should do according to the query statement we write..
  @Query('SELECT * FROM $kArticlesTableName')
  Future<List<Article>> getAllArticles();
  // insertArticle(): Its job is inserting data into our database because we’re annotating this method by @ Insert.
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}
