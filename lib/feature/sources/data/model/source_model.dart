class SourceModel {
  String? status;
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

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
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
