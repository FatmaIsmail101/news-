import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/notification/notification_bar.dart';
import 'package:news_app/feature/news/data/data_source/article_remote_ds_impl.dart';
import 'package:news_app/feature/news/data/repo/article_repo_impl.dart';
import 'package:news_app/feature/news/domain/usecase/article_use_case.dart';
import 'package:news_app/feature/news/presentation/view_model/article_bloc.dart';
import 'package:news_app/feature/news/presentation/widget/news.dart';
import 'package:news_app/feature/sources/data/data_source/remote_data_source_imp.dart';
import 'package:news_app/feature/sources/data/repo/source_repo_impl.dart';
import 'package:news_app/feature/sources/presentation/view_model/provider/source_provider.dart';
import 'package:news_app/feature/sources/presentation/view_model/state.dart';

import '../../presentation/widget/source/source_widget.dart';
import '../../sources/domain/usecase/source_usecase.dart';

class NewsScreen extends StatefulWidget {
  final String catId;

  NewsScreen({super.key, required this.catId});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  String sourceId = "";
//final controller=TabController(length: s, vsync: vsync)
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final remoteDS = SourceDSRemoteImpl();
            final repo = SourceRepoImpl(remoteDS);
            final useCase = SourceUseCase(repo);
            final cubit = SourceProvider(useCase);
            cubit.soucre(widget.catId);
            return cubit;
          },
        ),
        BlocProvider(
        create: (context) {
      final remoteDS = ArticleDSRemoteImpl();
      final repo = ArticleRepoImpl(remoteDS);
      final useCase = ArticleUseCase(repo);
      return ArticleBloc(useCase);

      //cubit.getArticles(widget.catId); // <--- هنا بنادي fetch مباشرة بعد الإنشاء


    })
      ],

        child: BlocConsumer<SourceProvider, SourceState>(
          builder: (context, state) {
            if (state is SourceLoading) {
              return Center(
                child: Lottie.asset('assets/animation/Trail loading.json'),
              );
            } else if (state is SourceError) {
              return Text("Not Found");
            } else if (state is SourceSuccess) {

              return Column(
                children: [
                  SourceWidget(
                    //controller:TabController(length: state., vsync: vsync) ,
                    model: state.sources,

                  ),
                 // NewsWidget(sourceId: sourceId),
                ],
              );
            }
            return Center(child: Text("Select a category"));
          },
          listener: (context, state) {
            if (state is SourceError) {
              NotificationBar.showNotification(
                message: "Something went wrong ",
                type: ContentType.failure,
                context: context,
                icon: Icons.error_outline,
              );
            }
          },
        ),
      );

  }
}
