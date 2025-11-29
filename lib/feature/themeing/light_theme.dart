import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/color.dart';
import 'package:news_app/feature/themeing/theme_app.dart';

class LightTheme extends ThemeApp{
  @override
  // TODO: implement backgroundColor
  Color get backgroundColor => AppColor.mainColorLight;

  @override
  // TODO: implement primaryColor
  Color get primaryColor => AppColor.mainColorLight;

  @override
  // TODO: implement textColor
  Color get textColor => AppColor.mainColorDark;

  @override
  // TODO: implement themeData
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,scaffoldBackgroundColor: backgroundColor,
    appBarTheme:  AppBarTheme(
      backgroundColor: backgroundColor,centerTitle: true,
      titleTextStyle: GoogleFonts.inter(color: textColor,
      fontSize: 20,fontWeight: FontWeight.w500),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: textColor,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.h),
      )
     ,padding: EdgeInsets.symmetric(vertical: 16.h),
        textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold,
       color: textColor,fontSize: 16 )
      )
    ),
    textTheme: TextTheme(
      headlineLarge: GoogleFonts.inter(fontSize: 24.sp,
      fontWeight: FontWeight.bold,color: textColor),
      headlineMedium:  GoogleFonts.inter(fontSize: 20.sp,
          fontWeight: FontWeight.bold,color: textColor),
      bodyLarge:  GoogleFonts.inter(fontSize: 16.sp,
          fontWeight: FontWeight.bold,color: textColor),
      bodyMedium:  GoogleFonts.inter(fontSize: 14.sp,
          fontWeight: FontWeight.bold,color: textColor),
    ),

  );

}