import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/constants/color.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';

class NewsItem extends StatelessWidget {
   NewsItem({super.key,required this.model});
Article? model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      width: double.infinity,height: 400.h,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.mainColorDark),
        borderRadius: BorderRadius.circular(16.w)
      ),
      child: Column(
        spacing: 10.h,
        children: <Widget>[
         ClipRRect(
           borderRadius: BorderRadius.circular(8),
           clipBehavior: Clip.antiAlias,
           child: Image.network(model?.urlToImage??"",fit: BoxFit.fill,
           width: double.infinity,),
         ),
          Text(model?.title??"",style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,fontSize: 16,color: AppColor.mainColorDark
          ),),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                Text("By: ${model?.author?? ""}",style: GoogleFonts.inter(
                    fontWeight: FontWeight.w200,fontSize: 12,color: const Color(0xffA0A0A0)
                ),softWrap: true,),
                Text("By: ${model?.publishedAt ?? ""}",style: GoogleFonts.inter(
                    fontWeight: FontWeight.w200,fontSize: 12,color: const Color(0xffA0A0A0)
                ),softWrap: true,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
