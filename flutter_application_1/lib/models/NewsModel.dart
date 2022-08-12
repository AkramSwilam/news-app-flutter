import 'package:dio/dio.dart';
import 'ArticleModel.dart';

class News {
  late String  Ap;

  News(this.Ap);

  List<Article> news = [];
  Future<List<Article>> getNews() async {
    Response response = await Dio().get(Ap);

    var resjson = response.data;
    if (resjson["status"] == "ok") {
      resjson["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null && element["content"] != null) {
          Article article = Article(
              title: element["title"],
              description: element["description"],
              URLImage: element["urlToImage"],
              url: element["url"]);
          news.add(article);
        }
      });
    }

    return news;
  }
}
