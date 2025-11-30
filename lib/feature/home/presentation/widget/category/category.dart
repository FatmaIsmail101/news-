import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/feature/home/data/model/category_model.dart';
import 'package:news_app/feature/themeing/themeing.dart';

import '../../../../../core/constants/color.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.model, required this.index});

  final CategoryModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final themeing = Theme.of(context);
    final theme = context.watch<ThemeingViewModel>().getTheme();
    final theme2 = context.watch<ThemeingViewModel>().state;

    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(model.image),
          isAntiAlias: true,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(24.h),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: index.isEven
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 30.h),
              child: Text(
                model.name,
                style: themeing.textTheme.headlineLarge?.copyWith(
                  color:theme2==ThemeMode.light? AppColor.mainColorLight:AppColor.mainColorDark,
                ),
              ),
            ),
          ),
          Align(
            alignment: index.isEven
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(bottom: 16.h),
              width: 190.w,
              height: 60.h,
              alignment: index.isEven ? Alignment.center : Alignment.centerLeft,
              decoration: BoxDecoration(
                color: theme2 == ThemeMode.light
                    ? const Color(0x80ffffff)
                    : const Color(0xff808080),
                borderRadius: BorderRadius.circular(50.w),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: index.isOdd
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.start,
                children: index.isEven
                    ? [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0.w, right: 4.w),
                          child: Text(
                            "View All",
                            style: themeing.textTheme.headlineLarge,
                          ),
                        ),
                        Container(
                          width: 54.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme2 == ThemeMode.light
                                ? AppColor.mainColorLight
                                : AppColor.mainColorDark,
                          ),
                          child: Icon(
                            size: 20.sp,
                            Icons.arrow_forward_ios_rounded,
                            color: theme == ThemeMode.light
                                ? AppColor.mainColorDark
                                : AppColor.mainColorLight,
                          ),
                        ),
                      ]
                    : [
                        Container(
                          width: 54.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme == ThemeMode.light
                                ? AppColor.mainColorLight
                                : AppColor.mainColorDark,
                          ),
                          child: Icon(
                            size: 20.sp,
                            Icons.arrow_back_ios_new,
                            color: theme == ThemeMode.light
                                ? AppColor.mainColorDark
                                : AppColor.mainColorLight,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.0.w, right: 12.w),
                          child: Text(
                            "View All",
                            style: themeing.textTheme.headlineLarge,
                          ),
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
