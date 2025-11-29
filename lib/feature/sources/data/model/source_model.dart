import 'package:hive/hive.dart';
part 'source_model.g.dart';
@HiveType(typeId: 0)
class SourceModel {
  @HiveField(0)
  String? status;
  @HiveField(1)
  List<Source>? sources;

  SourceModel({this.status, this.sources});

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      //لازم نحول الليستة ل Source عشان هى من نوع   Source فى اوبجيكت من نوعSourceModel
      sources: (json["sources"] as List)
          .map((e) => Source.fromJson(e))
          .toList(),
      status: json["status"],
    );
  }
}

@HiveType(typeId: 1)
class Source {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? description;
  @HiveField(3)
  String? url;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? language;
  @HiveField(6)
  String? country;

  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json["name"],
      category: json["category"],
      language: json["language"],
      url: json["url"],
      description: json["description"],
      id: json["id"],
      country: json["country"],
    );
  }
}
