import 'package:news_app/core/assets/assets.dart';

class CategoryModel {
  String id;
  String name;
  String image;

  CategoryModel({required this.id, required this.name, required this.image});

 static List<CategoryModel> categoriesDark() {
    return [
      CategoryModel(
        id: "general",
        name: "General",
        image: AppAssets.generalLight,
      ),
      CategoryModel(
        id: "business",
        name: "Business",
        image: AppAssets.businessLight,
      ),
      CategoryModel(id: "sport", name: "Sports", image: AppAssets.sportsLight),
      CategoryModel(
        id: "technology",
        name: "Technology",
        image: AppAssets.techLight,
      ),
      CategoryModel(
        id: "entertainment",
        name: "Entertainment",
        image: AppAssets.entertainmentLight,
      ),
      CategoryModel(id: "health", name: "Health", image: AppAssets.healthLight),

      CategoryModel(
        id: "science",
        name: "Science",
        image: AppAssets.scienceLight,
      ),
    ];
  }
  static List<CategoryModel> categoriesLight() {
    return [
      CategoryModel(
        id: "general",
        name: "General",
        image: AppAssets.generalDark,
      ),
      CategoryModel(
        id: "business",
        name: "Business",
        image: AppAssets.businessDark,
      ),
      CategoryModel(id: "sports", name: "Sports", image: AppAssets.sportsDark),
      CategoryModel(
        id: "technology",
        name: "Technology",
        image: AppAssets.techDark,
      ),
      CategoryModel(
        id: "entertainment",
        name: "Entertainment",
        image: AppAssets.entertainmentDark,
      ),
      CategoryModel(id: "health", name: "Health", image: AppAssets.healthDark),

      CategoryModel(
        id: "science",
        name: "Science",
        image: AppAssets.scienceDark,
      ),
    ];
  }

}
