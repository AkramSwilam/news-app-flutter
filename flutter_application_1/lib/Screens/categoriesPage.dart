import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../viewrs/categoriesNews.dart';

class categoriespage extends StatefulWidget {
  int index;
  int ind;
  categoriespage(this.index,this.ind, {Key? key}) : super(key: key);

  @override
  State<categoriespage> createState() => _categoriespageState();
}

class _categoriespageState extends State<categoriespage> {
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
                    child: Text(widget.ind == 0?
                      Provider.of<HomeProvider>(context, listen: true)
                          .categories
                          .elementAt(widget.index)
                          .name:
                    Provider.of<HomeProvider>(context, listen: true)
                        .country
                        .elementAt(widget.index)
                        .name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              categoriesnews(widget.ind == 0?
              Provider.of<HomeProvider>(context, listen: true).categoriessApi.elementAt(widget.index).API_:
              "https://newsapi.org/v2/top-headlines?country=${Provider.of<HomeProvider>(context, listen: true).country.elementAt(widget.index).nickname}&pageSize=50&apiKey=82a9a9b35948450bb47ff9869382a8dd"
                 ),
            ]),
      ),
    );
  }
}
