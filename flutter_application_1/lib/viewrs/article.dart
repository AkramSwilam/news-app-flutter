import 'package:contest/models/ArticleModel.dart';
import 'package:contest/models/news_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'articlePage.dart';

// ignore: must_be_immutable
class ArticleView extends StatefulWidget {
  String url;
  String imageUrl;
  String title;
  String desc;
  ArticleView(
      {Key? key, required this.imageUrl, required this.desc, required this.title, required this.url}) : super(key: key);

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  SqlBb? sqlBb;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    sqlBb=SqlBb(uid: signedUser.uid);
  }
  final auth=FirebaseAuth.instance;
  late User signedUser;
  void getCurrentUser(){
   try {
      User? user =auth.currentUser;
    if(user!=null){
      signedUser=user;
    }
   } catch (e) {
     
   }
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) =>ArticlePage(url: widget.url , title: widget.title,))));
      },
            child: Container(padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10).r,
                  color:  Colors.black12 ,
                ),
        margin: const EdgeInsets.only(bottom: 16.0).r,
          child: Row(
            children: [
              
              Column(
        children: [
         Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10).r
              ),
         child: Row(
          
           children: [
            IconButton(
                onPressed: () =>sqlBb!.insertData(Article(title: widget.title, description: widget.desc, URLImage: widget.imageUrl,  url: widget.url)) , 
                icon:Icon(Icons.save) 
                ),
                SizedBox(width: 10,),
             Image.network(widget.imageUrl),
           ],
         ),
                
              ),
         
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.desc,
                style: const TextStyle(
                  color: Colors.black87,
                ),
              )
        ],
      ),
            ],
          )),
    );
  }
}
