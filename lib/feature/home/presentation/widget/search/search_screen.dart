import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/constants/color.dart';
import 'package:news_app/core/constants/services/api_manager.dart';
import 'package:news_app/feature/news/data/model/article_model.dart';
import 'package:news_app/feature/news/presentation/widget/news_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController=TextEditingController();
  List <Article>articles=[];
  int currentPage=0;
  String?errorMessage="";
  int maxResult=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColorLight,
      body: CustomScrollView(

        slivers: [
          SliverAppBar(

            leading: SizedBox.shrink(),
            leadingWidth: 0,
            floating: true,
            title: TextFormField(
              controller: searchController,
              onFieldSubmitted: (value){
                currentPage=1;
                maxResult=0;
                _search();
              },
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search,color: AppColor.mainColorDark,),
                suffixIcon: const Icon(Icons.close,color: AppColor.mainColorDark,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: AppColor.mainColorDark)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.mainColorDark)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: AppColor.mainColorDark)
                ),focusColor: AppColor.mainColorDark,

              ),
            ),
          ),
          if(articles.isEmpty&&errorMessage==null)
            SliverToBoxAdapter(
                child: Lottie.asset("assets/animation/search imm.json")),
          if(articles.isNotEmpty)
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,vertical: 16
              ),
              sliver: SliverList.separated(
                itemCount: articles.length,
                separatorBuilder: (context, index) => SizedBox(
                height: 16,
              ),itemBuilder: (context, index) => InkWell(
                  onTap: (){
                    launchUrl(
                      Uri.parse(articles[index].url ?? ""),
                      mode: LaunchMode.inAppWebView,
                    );
                  },
                  child: NewsItem(model: articles[index])),),
            )
        ],
      ),
    );
  }

  void _search()async {
    ApiManager apiManager=ApiManager();
    errorMessage='';
    try{
      var response=await apiManager.getArticle(searchQuerry: searchController.text, pageNumber: currentPage);
      articles=response.articles??[];
      maxResult=response.totalResults??0;
    }
    catch(e){
      errorMessage=e.toString();
    }
    setState(() {

    });
  }
}
