import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../models/CountryCard.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({Key? key}) : super(key: key);

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    Color? col = Colors.red.shade700;
    return Column(
      children: [
        SizedBox(
          height: 580.h,
          child: ListView.separated(
            itemCount: Provider.of<HomeProvider>(context).country.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return CountryCard(index);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}
