import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:news_app/feature/themeing/themeing.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/color.dart';

class NewsBottomSheet extends StatelessWidget {
  const NewsBottomSheet({super.key, required this.articleModel});

  final Article articleModel;

  @override
  Widget build(BuildContext context) {
    final theming=Theme.of(context);
final theme=context.watch<ThemeingViewModel>().getTheme();

    String fullText = articleModel.description ?? "";
    int maxLength = 100;

    String preview = fullText.length > maxLength
        ? "${fullText.substring(0, maxLength)}... [+${fullText.length - maxLength} chars]"
        : fullText;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          margin: EdgeInsets.symmetric(vertical: 16.h),
          width: double.infinity,
          height: 400.h,
          decoration: BoxDecoration(
            color: AppColor.mainColorLight,
            //   border: Border.all(color: AppColor.mainColorDark),
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 10.h,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.w),
                  clipBehavior: Clip.antiAlias,
                  child:
                      articleModel.urlToImage != null &&
                          articleModel.urlToImage!.isNotEmpty
                      ? Image.network(articleModel.urlToImage ?? "")
                      : Image.asset('assets/images/placeholder.png'),
                ),
                Text(
                  preview,
                  style: theming.textTheme.bodyMedium,
                ),
                ElevatedButton(
                  onPressed: () {
                    launchUrl(
                      Uri.parse(articleModel.url ?? ""),
                      mode: LaunchMode.inAppWebView,
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:theme==ThemeMode.light? AppColor.mainColorLight:AppColor.mainColorDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.w),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                  ),
                  child: Text(
                    "View Full Article",
                    style: theming.textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
