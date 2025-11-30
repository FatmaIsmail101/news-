import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/constants/color.dart';
import 'package:news_app/core/constants/services/api_manager.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:news_app/feature/news/presentation/widget/news_item.dart';
import 'package:news_app/feature/themeing/themeing.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Article> articles = [];
  int currentPage = 0;
  String? errorMessage = "";
  ScrollController scrollController = ScrollController();
  int maxResult = 0;

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (searchController.text.isNotEmpty && (maxResult > articles.length)) {
          _search();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme=context.watch<ThemeingViewModel>().getTheme();
    final themeMode=context.watch<ThemeingViewModel>().state;

    return Scaffold(
      backgroundColor:themeMode==ThemeData.light? AppColor.mainColorLight:AppColor.mainColorDark,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            elevation: 2.w,
            toolbarHeight: 100.h,

            leading: const SizedBox.shrink(),
            leadingWidth: 0,
            floating: true,
            title: TextFormField(
              controller: searchController,
              onFieldSubmitted: (value) {
                currentPage = 1;
                maxResult = 0;
                _search();
              },
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,fontSize: 20.sp,
                  color: themeMode==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight,
                ),
                prefixIcon:  Icon(
                  Icons.search,
                  color: themeMode==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight,
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:  Icon(Icons.close, color: theme==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide:  BorderSide(color: themeMode==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight,),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide:  BorderSide(color:themeMode==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight,),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.w),
                  borderSide:  BorderSide(color: themeMode==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight,),
                ),
                focusColor: themeMode==ThemeData.light? AppColor.mainColorDark:AppColor.mainColorLight,
              ),
            ),
          ),
          if (articles.isEmpty && errorMessage == null)
            SliverToBoxAdapter(
              child: Lottie.asset("assets/animation/Trail loading.json"),
            ),
          if (articles.isNotEmpty)
            SliverPadding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w,
                  vertical: 16.h),
              sliver: SliverList.separated(
                itemCount: articles.length < maxResult
                    ? articles.length + 1
                    : articles.length,
                separatorBuilder: (context, index) =>
                     SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  if (index == articles.length) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return InkWell(
                      onTap: () {
                        launchUrl(
                          Uri.parse(articles[index].url ?? ""),
                          mode: LaunchMode.inAppWebView,
                        );
                      },
                      child: NewsItem(model: articles[index]),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  void _search() async {
    ApiManager apiManager = ApiManager();
    errorMessage = '';
    try {
      var response = await apiManager.getArticle(
        searchQuerry: searchController.text,
        pageNumber: currentPage,
      );
      //articles=response.articles??[];
      articles.addAll(response.articles ?? []);
      maxResult = response.totalResults ?? 0;
      currentPage++;
      print(currentPage);
    } catch (e) {
      errorMessage = e.toString();
    }
    setState(() {});
  }
}
