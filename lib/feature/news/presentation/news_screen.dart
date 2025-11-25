import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/notification/notification_bar.dart';
import 'package:news_app/feature/news/presentation/view_model/article_bloc.dart';
import 'package:news_app/feature/news/presentation/widget/news.dart';
import 'package:news_app/feature/sources/data/data_source/remote_data_source_imp.dart';
import 'package:news_app/feature/sources/data/repo/source_repo_impl.dart';
import 'package:news_app/feature/sources/presentation/view_model/provider/source_provider.dart';
import 'package:news_app/feature/sources/presentation/view_model/state.dart';

import '../../presentation/widget/source/source_widget.dart';
import '../../sources/domain/usecase/source_usecase.dart';

class NewsScreen extends StatelessWidget {
  final String catId;
  String sourceId = "";

  NewsScreen({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final remoteDS = SourceDSRemoteImpl();
        final repo = SourceRepoImpl(remoteDS);
        final useCase = SourceUseCase(repo);
        final cubit = SourceProvider(useCase);

        cubit.soucre(catId); // <--- هنا بنادي fetch مباشرة بعد الإنشاء

        return cubit;
      },
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
                  model: state.sources,
                  onSelect: (value) {
                    context.read<ArticleBloc>().getArticles(value);
                  },
                ),
                NewsWidget(sourceId: sourceId),
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
