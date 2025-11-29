import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/feature/news/presentation/view_model/article_bloc.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';
import '../../../../../news/presentation/widget/news_widget.dart';

class SourceWidget extends StatefulWidget {
  const SourceWidget({
    super.key,
    required this.model,
    //this.controller,
  });

  //final controller;
  final SourceModel model;

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final firstSourceId = widget.model.sources?[0].id;
      if (firstSourceId != null) {
        context.read<ArticleBloc>().getArticles(firstSourceId);
      }
    });
  }


  //final Function(String id) onSelect;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("current Index $currentIndex");
    //  int? index = model.sources?.indexWhere((s) => s.id );
    if (widget.model.sources == null || widget.model.sources!.isEmpty) {
      return Center(child: Text("No sources found"));
    }
    // sourceId=widget.model.sources?.first.id;
    return Column(
      children: [
        DefaultTabController(
          initialIndex: currentIndex,
          length: widget.model.sources!.length,
          child: TabBar(
            // controller:controller ,
            labelStyle: TextStyle(color: Colors.black),
            labelColor: Colors.black,
            onTap: (value) {
              currentIndex = value;
              // final selected = widget.model.sources![value];
              // if (selected.id != null && selected.id!.isNotEmpty) {
              //   sourceId=widget.model.sources!.indexWhere((s) => s.id==selected.id ).toString();
              //
              //   onSelect(model.sources!.indexWhere((s) => s.id==selected.id ).toString());
              setState(() {});
              final id = widget.model.sources?[value].id;
              context.read<ArticleBloc>().getArticles(id ?? "abc-news");
            },
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.black,
            tabs:
                widget.model.sources
                    ?.map((e) => Tab(text: e.name ?? ""))
                    .toList() ??
                [],
          ),
        ),
        NewsWidget(sourceId: widget.model.sources?[currentIndex].id ?? ""),
      ],
    );
  }
}
