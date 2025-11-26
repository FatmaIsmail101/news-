import 'package:flutter/material.dart';
import 'package:news_app/feature/sources/data/model/source_model.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget({super.key, required this.model, required this.onSelect});

  final SourceModel model;
  final Function(String id) onSelect;

  @override
  Widget build(BuildContext context) {
    int? index = model.sources?.indexWhere((s) => s.id == "buzzfeed");
    if (model.sources == null || model.sources!.isEmpty) {
      return Center(child: Text("No sources found"));
    }
    return DefaultTabController(
      // initialIndex: index??0,
      length: model.sources!.length,
      child: TabBar(
        labelStyle: TextStyle(color: Colors.black),
        labelColor: Colors.black,
        onTap: (value) {
          final selected = model.sources![value];
          if (selected.id != null && selected.id!.isNotEmpty) {
            onSelect(selected.id!);
          }
        }
        ,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: EdgeInsets.zero,
        unselectedLabelColor: Colors.black,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.black,
        tabs: model.sources?.map((e) => Tab(text: e.name ?? "")).toList() ?? [],
      ),
    );
  }
}
