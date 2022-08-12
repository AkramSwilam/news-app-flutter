import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../models/categoriesCard.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int s = 0;
  @override
  Widget build(BuildContext context) {
    Color? coll =  Colors.white;
    return Column(
      children: [
        SizedBox(
          height: 420.h,
          child: ListView.separated(
              itemCount: Provider.of<HomeProvider>(context).categories.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return  categoriescard(index,s,coll);
              }, separatorBuilder: (context, index) {
            return const Divider();
          },),
        ),
      ],
    );
  }
}
