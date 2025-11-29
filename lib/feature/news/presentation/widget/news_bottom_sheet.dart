import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import '../../../../core/constants/color.dart';

class NewsBottomSheet extends StatelessWidget {
  NewsBottomSheet({super.key, required this.articleModel});

  Article articleModel;

  @override
  Widget build(BuildContext context) {
    String fullText = articleModel.description ?? "";
    int maxLength = 100;

    String preview = fullText.length > maxLength
        ? "${fullText.substring(0, maxLength)}... [+${fullText.length - maxLength} chars]"
        : fullText;

    return Container(
      padding: EdgeInsets.all(8.w),
      width: double.infinity,
      height: 400.h,
      decoration: BoxDecoration(
        //   border: Border.all(color: AppColor.mainColorDark),
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10.h,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              clipBehavior: Clip.antiAlias,
              child:
                  articleModel.urlToImage != null &&
                      articleModel.urlToImage!.isNotEmpty
                  ? Image.network(articleModel.urlToImage ?? "")
                  : Image.asset('assets/images/placeholder.png'),
            ),
            Text(
              preview,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColor.mainColorDark,
              ),
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.mainColorDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                "View Full Article",
                style: GoogleFonts.inter(
                  color: AppColor.mainColorLight,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
