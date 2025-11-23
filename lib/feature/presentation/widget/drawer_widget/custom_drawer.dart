import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/assets/assets.dart';
import 'package:news_app/core/constants/color.dart';
import 'package:news_app/feature/localization/localization_view_model.dart';
import 'package:news_app/feature/themeing/themeing.dart';
import '../../../../l10n/app_localizations.dart';
import 'drawer_content_widget.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({Key? key,required this.onTap}) : super(key: key);
  VoidCallback? onTap;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  String? selectedTheme;
  String? selectedLanguage;
  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context);
    return BlocBuilder<LangModel, String>(
      builder: (context, state) {
        return Container(
          width: 272.w,
          color: AppColor.mainColorDark,
          child: Column(
            spacing: 24.h,
            children: [
              Container(
                alignment: Alignment.center,
                color: AppColor.mainColorLight,
                height: 168.h,
                width: double.infinity,
                child: Text(
                  "News App",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.sp,
                    color: AppColor.mainColorDark,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if(widget.onTap!=null){
                    widget.onTap!();
                  }
                },
                child: DrawerContentWidget(
                  image: AppAssets.homeIcon,
                  name: lang?.goToHome ?? "",
                ),
              ),
              Divider(),
              DrawerContentWidget(
                image: AppAssets.themeIcon,
                name: lang?.theme ?? "",
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                margin: EdgeInsets.only(left: 10.w, right: 10.w),

                height: 56.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.mainColorLight),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedTheme,
                  // اللي هيظهر
                  dropdownColor: AppColor.mainColorDark,
                  items: theme.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.mainColorLight,
                        ),
                      ),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(16.w),
                  underline: SizedBox(),
                  iconSize: 30.w,
                  iconEnabledColor: AppColor.mainColorLight,

                  onChanged: (value) {
                    setState(() {
                      selectedTheme = value;
                      // اللي اليوزر اختاره
                      context.read<ThemeingViewModel>().toggleTheme(
                        value ?? "Light",
                      );
                    });
                  },
                ),
              ),
              Divider(),
              DrawerContentWidget(
                image: AppAssets.languageIcon,
                name: lang?.language ?? "",
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                margin: EdgeInsets.only(left: 10.w, right: 10.w),
                height: 56.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.mainColorLight),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: DropdownButton<String>(
                  dropdownColor: AppColor.mainColorDark,
                  borderRadius: BorderRadius.circular(16.w),
                  padding: EdgeInsets.all(8.w),
                  isExpanded: true,
                  iconSize: 30.w,
                  iconEnabledColor: AppColor.mainColorLight,
                  value: selectedLanguage,
                  items: language
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColor.mainColorLight,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value;
                      context.read<LangModel>().toggle(
                        selectedLanguage ?? lang?.english ?? "",
                      );
                    });
                  },
                  underline: SizedBox(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<String> theme = ["Light", "Dark"];
  List<String> language = ["English", "Arabic"];
}
