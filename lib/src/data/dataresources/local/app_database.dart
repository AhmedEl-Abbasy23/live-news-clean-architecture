import 'package:floor/floor.dart';
import 'package:live_news/src/data/dataresources/local/DAOs/articles_dao.dart';
import 'package:live_news/src/data/dataresources/local/converters/source_type_converter.dart';
import 'package:live_news/src/domain/entities/article.dart';

@TypeConverters([SourceTypeConverter])
@Database(version: 1, entities: [Article])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}