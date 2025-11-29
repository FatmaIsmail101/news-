import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/feature/home/presentation/widget/category/category.dart';
import '../../../core/constants/color.dart';
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
    final theme = context.watch<ThemeingViewModel>().toggleTheme;
    final currentTheme = theme == "Light" ? categoriesList : categoriesListDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lang?.goodMorning ?? "",
          style: GoogleFonts.inter(
            fontSize: 24.w,
            fontWeight: FontWeight.w500,
            color: AppColor.mainColorDark,
          ),
        ),
        Text(
          lang?.newsIntro ?? "",
          style: GoogleFonts.inter(
            fontSize: 24.w,
            fontWeight: FontWeight.w500,
            color: AppColor.mainColorDark,
          ),
        ),

        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onTap(categoriesList[index]),
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
