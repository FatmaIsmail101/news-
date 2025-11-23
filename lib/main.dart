import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/routes/route_name.dart';
import 'package:news_app/core/routes/routes.dart';
import 'package:news_app/feature/localization/localization_view_model.dart';
import 'package:news_app/feature/themeing/themeing.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/l10n/app_localizations.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: const Size(393, 852),
    minTextAdapt: true,
    splitScreenMode: true,
    child: MultiBlocProvider(

        providers: [
          BlocProvider(
            create: (_) => ThemeingViewModel(),),
          BlocProvider(
            create: (_) => LangModel(),)
        ],


        child: MyApp()),
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
                locale: state=="English"?Locale("en"):Locale("ar"),
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
        });
  }
}


