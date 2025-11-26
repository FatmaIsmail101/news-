import 'package:flutter/material.dart';
import 'package:news_app/feature/presentation/widget/source/source_widget.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';

import '../news/presentation/widget/news.dart';

class HomeNewsScreen extends StatefulWidget {
  final SourceModel sourceModel;

  HomeNewsScreen({required this.sourceModel});
  @override
  _HomeNewsScreenState createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  String selectedSource = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Source Tabs
        SourceWidget(
          model: widget.sourceModel,
          onSelect: (id) {
            setState(() {
              selectedSource = id;
            });
          },
        ),

        Expanded(
          child: NewsWidget(
            sourceId: selectedSource,
          ),
        )
      ],
    );
  }
}
