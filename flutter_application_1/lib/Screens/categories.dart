import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/categories_widget_Vertical.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(
          height: 5.h,
        ),
        const CategoriesWidget(),
      ],
    );
  }
}