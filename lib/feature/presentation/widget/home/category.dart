import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/feature/home/data/model/category_model.dart';

import '../../../../core/constants/color.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.model, required this.index});

  final CategoryModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: 200.h,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(model.image,)
        ,isAntiAlias: true),
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
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 30),
              child: Text(
                model.name,
                style: GoogleFonts.inter(
                  fontSize: 24.w,
                  fontWeight: FontWeight.w500,
                  color: AppColor.mainColorLight,
                ),
              ),
            ),
          ),
          Container(clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(
              left: index.isEven ? 180 : 16,
              bottom: 16,
              right: index.isEven ? 4 : 160,
            ),

            width: 200.w,
            height: 60.h,
            alignment: index.isEven
                ? Alignment.centerRight
                : Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Color(0x80ffffff),
              borderRadius: BorderRadius.circular(84),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "View All",
                    style: GoogleFonts.inter(
                      fontSize: 24.w,
                      fontWeight: FontWeight.w500,
                      color: AppColor.mainColorDark,
                    ),
                  ),
                ),
                Align(
                  alignment: index.isOdd
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 24,
                    backgroundColor: AppColor.mainColorLight,
                    foregroundColor: AppColor.mainColorLight,
                    child: Icon(
                      index.isOdd
                          ? Icons.arrow_forward_ios_rounded
                          : Icons.arrow_forward_ios_rounded,
                      color: AppColor.mainColorDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
