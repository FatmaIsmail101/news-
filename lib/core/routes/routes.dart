import 'package:flutter/material.dart';
import 'package:news_app/core/routes/route_name.dart';
import '../../feature/home/presentation/home_screen.dart';

class AppRouter{
  static Route<dynamic>? onGenerateRoute(RouteSettings setting){
    switch(setting.name){
      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(child: Text('No route defined for ${setting.name}')),
          ),
        );
    }
  }
}