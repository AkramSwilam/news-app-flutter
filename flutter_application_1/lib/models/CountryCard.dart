import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../controller/provider.dart';
import '../Screens/categoriesPage.dart';

class CountryCard extends StatefulWidget {
  int index;
  CountryCard(this.index, {Key? key}) : super(key: key);

  @override
  State<CountryCard> createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  @override
  Color coll = Colors.white;
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 5.w,
        ),
        Container(
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5).r,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10).r,
            color: coll,
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) => categoriespage(widget.index ,1))));
              setState(() {});
            },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl: Provider.of<HomeProvider>(context).country.elementAt(widget.index).imageAssetUrl,
                    height: (80).h,
                    width:  (340).w,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: (80).h,
                  width:  (340).w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5).r,
                      color: Colors.black26
                  ),
                  child: Text(
                    Provider.of<HomeProvider>(context).country.elementAt(widget.index).name,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
    );
  }
}
