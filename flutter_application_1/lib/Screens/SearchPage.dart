import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../viewrs/categoriesNews.dart';

class Search extends StatefulWidget {
  String Api;

  Search(this.Api,{Key? key}) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title:  Image.asset("assets/1.png",height: 100,),
        backgroundColor:Colors.red.shade900,
        automaticallyImplyLeading: false,
      ),

      /* ///////////////////////////////////////////////////////// */

      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 5, bottom: 5, top: 5, right: 5)
                        .r,
                    margin: const EdgeInsets.only(left: 10, right: 10).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20).r,
                    ),
                    child: Text("Result",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              categoriesnews(widget.Api),
            ]),
      ),
    );
  }
}
