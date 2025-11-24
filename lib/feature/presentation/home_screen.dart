import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/feature/home/data/model/category_model.dart';
import 'package:news_app/feature/news/presentation/news_screen.dart';
import 'package:news_app/feature/presentation/home_screen1.dart';
import '../../l10n/app_localizations.dart';
import 'widget/drawer_widget/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel = null;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);

   return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel?.name ?? lang?.home ?? ""),
        centerTitle: true,
        actions: [Icon(Icons.search)],
      ),
      drawer: CustomDrawer(onTap:()=>home() ,),
      body: Padding(
        padding:  EdgeInsets.all(16.0.w),
        child: categoryModel==null?HomeScreenCategory(onTap:(category){
          changeBody(category);
        } ,):NewsScreen(catId:categoryModel?.id??"" ,),
      ),
    );
  }

  void changeBody(CategoryModel category){
    categoryModel=category;
    setState(() {

    });
  }
  void home(){
    categoryModel=null;
    setState(() {

    });
    Navigator.pop(context);
  }
}
