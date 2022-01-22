import 'package:flutter/material.dart';
import 'package:live_news/src/presentation/views/breaking_news_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BreakingNewsView());
      // case '/SavedArticlesView':
      //   return _materialRoute(const BreakingNewsView());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}