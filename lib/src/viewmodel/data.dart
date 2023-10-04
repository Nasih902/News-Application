import 'package:news_api_flutter_package/model/article.dart';
import 'package:news_api_flutter_package/news_api_flutter_package.dart';

class Data{
  List<String> categoryItems = [
    "TECHNOLOGY",
    "BUSINESS",
    "ENTERTAINMENT",
    "HEALTH",
    "SCIENCE",
    "SPORTS",
  ];
  late Future<List<Article>> future;
  late String selectedCategory;
   Future<List<Article>> getNewsData() async {
    NewsAPI newsAPI = NewsAPI("ea2decbda90d4e18995019c4df510ef0");
    return await newsAPI.getTopHeadlines(
      country: "us",
      category: selectedCategory,
      pageSize: 50,
    );
  }
}