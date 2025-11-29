import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/feature/news/presentation/view_model/article_bloc.dart';
import 'package:news_app/feature/news/presentation/view_model/state.dart';
import 'package:news_app/feature/news/presentation/widget/news_bottom_sheet.dart';

import '../../data/model/article_model.dart';
import 'news_item.dart';

class NewsWidget extends StatelessWidget {
  final String sourceId;

  const NewsWidget({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    if (sourceId.isEmpty) {
      return const Center(child: Text("Select a News"));
    }
    return Expanded(
      child: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return Center(
              child: Lottie.asset('assets/animation/Trail loading.json'),
            );
          } else if (state is ArticleError) {
            return const Center(child: Text("Select a News"));
          } else if (state is ArticleSuccess) {
            List<Article> articles = state.model.articles ?? [];

            return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                 bottomSheet(context,articles[index]);
                  },
                  child: NewsItem(
                    model: articles[index],
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

 Future<dynamic> bottomSheet(BuildContext context,Article article) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,isScrollControlled: true,isDismissible: true,
      enableDrag: true,
      context: context, builder: (context) => NewsBottomSheet(articleModel: article,),);
  }
}
