import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/feature/home/presentation/widget/category/category.dart';
import '../../../l10n/app_localizations.dart';
import '../../themeing/themeing.dart';
import '../data/model/category_model.dart';


class HomeScreenCategory extends StatelessWidget {
  HomeScreenCategory({super.key, required this.onTap});

  final categoriesList = CategoryModel.categoriesLight();
  final categoriesListDark = CategoryModel.categoriesDark();
  Function(CategoryModel) onTap;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    final theme = context.watch<ThemeingViewModel>().state;
    final currentTheme = theme == ThemeMode.dark ? categoriesListDark : categoriesList;
    final themeing=Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lang?.goodMorning ?? "",
          style: themeing.textTheme.headlineLarge,
        ),
        Text(
          lang?.newsIntro ?? "",
          style: themeing.textTheme.headlineLarge,
        ),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onTap(currentTheme[index]),
                child: CategoryWidget(index: index, model: currentTheme[index]),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: categoriesList.length,
          ),
        ),
      ],
    );
  }
}
