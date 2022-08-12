import 'package:flutter/cupertino.dart';

class Article{
  int? id;
  String title;
  String description;
  String URLImage;
 
  String url;
  Article(
    {
      this.id,
      required this.title,
      required this.description,
      required this.URLImage,
      
      required this.url,
    }
  );
  Map<String,dynamic> toMap(String uid){
    return {
      "userId":uid,
      "id":id,
      "title":title,
      "desc":description,
      "urlImage":URLImage,
      "url":url
      
    };
  }
}