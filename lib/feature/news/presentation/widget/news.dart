import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/feature/news/data/data_source/article_remote_ds_impl.dart';
import 'package:news_app/feature/news/data/repo/article_repo_impl.dart';
import 'package:news_app/feature/news/domain/usecase/article_use_case.dart';
import 'package:news_app/feature/news/presentation/view_model/article_bloc.dart';
import 'package:news_app/feature/news/presentation/view_model/state.dart';
import 'package:news_app/feature/news/presentation/widget/news_bottom_sheet.dart';

import '../../../../core/notification/notification_bar.dart';
import '../../data/model/article_model.dart';
import 'news_item.dart';

class NewsWidget extends StatelessWidget {
  final String sourceId;

  NewsWidget({required this.sourceId});

  @override
  Widget build(BuildContext context) {
    if (sourceId.isEmpty) {
      return Center(child: Text("Select a News"));
    }
    return Expanded(
      child: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return Center(
              child: Lottie.asset('assets/animation/Trail loading.json'),
            );
          } else if (state is ArticleError) {
            return Center(child: Text("Select a News"));
          } else if (state is ArticleSuccess) {
            List<Article> articles = state.model.articles ?? [];

            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () {
                 bottomSheet(context,articles[index]);
                  },
                  child: NewsItem(
                    model: articles[index],
                  ),
                );
              },
            );
          }

          return SizedBox.shrink();
        },
      ),
    );
  }

  bottomSheet(BuildContext context,Article article) {
    return showModalBottomSheet(
      context: context, builder: (context) => NewsBottomSheet(articleModel: article,),);
  }
}
