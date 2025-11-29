import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/core/routes/route_name.dart';
import 'package:news_app/core/routes/routes.dart';
import 'package:news_app/feature/localization/localization_view_model.dart';
import 'package:news_app/feature/news/data/data_source/article_remote_ds_impl.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:news_app/feature/news/data/repo/article_repo_impl.dart';
import 'package:news_app/feature/news/domain/usecase/article_use_case.dart';
import 'package:news_app/feature/sources/data/data_source/remote_data_source_imp.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';
import 'package:news_app/feature/sources/data/repo/source_repo_impl.dart';
import 'package:news_app/feature/sources/domain/usecase/source_usecase.dart';
import 'package:news_app/feature/sources/presentation/view_model/provider/source_provider.dart';
import 'package:news_app/feature/themeing/themeing.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'core/constants/services/api_constants.dart';
import 'feature/news/presentation/view_model/article_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(SourceModelAdapter());
  Hive.registerAdapter(ArticleAdapter());
  Hive.registerAdapter(ArticleModelAdapter());

  await SecureStorageService.saveApiKey();
  runApp(
    ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeingViewModel()),
          BlocProvider(
            create: (_) => SourceProvider(
              SourceUseCase(SourceRepoImpl(SourceDSRemoteImpl())),
            ),
          ),
          BlocProvider(
            create: (_) => ArticleBloc(
              ArticleUseCase(ArticleRepoImpl(ArticleDSRemoteImpl())),
            ),
          ),
          BlocProvider(create: (_) => LangModel()),
        ],

        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeingViewModel, ThemeMode>(
      builder: (context, mode) {
        return BlocBuilder<LangModel, String>(
          builder: (context, state) {
            return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state == "English" ? Locale("en") : Locale("ar"),
              debugShowCheckedModeBanner: false,
              title: 'News App',
              theme: ThemeData.light(),
              themeMode: mode,
              darkTheme: ThemeData.dark(),
              initialRoute: RouteName.homeScreen,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
