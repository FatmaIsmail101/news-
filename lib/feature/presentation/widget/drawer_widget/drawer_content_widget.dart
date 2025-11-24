import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/color.dart';

class DrawerContentWidget extends StatelessWidget {
  const DrawerContentWidget({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 16.w),
      child: Row(
        spacing: 8.w,
        children: [
          Image.asset(image),
          Text(
            name,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: AppColor.mainColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
