import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'CountryScreen.dart';

class Countrywideget extends StatelessWidget {
  const Countrywideget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(
          height: 5.h,
        ),
        const CountryScreen(),
      ],
    );
  }
}