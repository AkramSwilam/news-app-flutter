import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/ArticleModel.dart';
import '../models/NewsModel.dart';
import 'article.dart';

class DefaultPage extends StatefulWidget {

  DefaultPage({Key? key }) : super(key: key);
  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  String Ap_ = "https://newsapi.org/v2/top-headlines?country=eg&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd";

  List<Article> articles=[];
   bool loading=true;
   @override 
   void initState(){
    super.initState();
    prepareNews();
   }
   Future<void> prepareNews()async{
    News news = News(Ap_);
    articles=await news.getNews();
    setState(() {
      loading=false;
    });
   }    
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: prepareNews,
      child: Container(
        child:loading ? const Center(
          child: CircularProgressIndicator(),
        ):
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Container(
                padding:  const EdgeInsets.only(top:5, left: 10.0,right: 10.0).r,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder:(context,index){
                    return ArticleView(imageUrl:articles[index].URLImage, desc: articles[index].description, title: articles[index].title , url: articles[index].url,);
                  }
                  ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}