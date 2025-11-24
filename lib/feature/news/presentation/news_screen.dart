import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/sources/data/data_source/remote_data_source_imp.dart';
import 'package:news_app/feature/sources/data/repo/source_repo_impl.dart';
import 'package:news_app/feature/sources/presentation/view_model/provider/source_provider.dart';
import 'package:news_app/feature/sources/presentation/view_model/state.dart';

import '../../presentation/widget/source/source_widget.dart';
import '../../sources/domain/usecase/source_usecase.dart';

class NewsScreen extends StatelessWidget {
  final String catId;
  const NewsScreen({super.key,required this.catId});

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
      child: BlocConsumer<SourceProvider, SourceState>
        (builder: (context, state) {
        if (state is SourceLoading) {
          return Center(child: CircularProgressIndicator(),);
        }
        else if (state is SourceError) {
          return Text("Not Found");
        }
        else if (state is SourceSuccess) {

          return SourceWidget(model: state.sources,);
        }
        return Center(child: Text("Select a category"));
      }, listener: (context, state) {
        if (state is SourceError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message))
          );
        }
      },),
    );
  }
}
