import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/ArticleModel.dart';
import '../models/NewsModel.dart';
import 'article.dart';

class categoriesnews extends StatefulWidget {
  String Ap;
   categoriesnews(this.Ap,{Key? key}) : super(key: key);

  @override
  State<categoriesnews> createState() => _categoriesnewsState();
}

class _categoriesnewsState extends State<categoriesnews> {
  List<Article> articles = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    prepareNews();
  }

  Future<void> prepareNews() async {
    News news = News(widget.Ap);
    articles = await news.getNews();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 10.0).r,
                    child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          return ArticleView(
                            imageUrl: articles[index].URLImage,
                            desc: articles[index].description,
                            title: articles[index].title,
                            url: articles[index].url,
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
