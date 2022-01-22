import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_news/src/injector.dart';
import 'src/presentation/blocs/remote_articles/remote_articles_bloc.dart';

import 'src/app/config/routes/app_routes.dart';
import 'src/app/config/themes/app_theme.dart';
import 'src/app/core/utils/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize our dependencies in the void main before running the app.
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      // (getting an already registered instance) using the injector,
      // then we’re adding an event (GetArticles).
      create: (_) => injector()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kMaterialAppTitle,
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
      ),
    );
  }
}