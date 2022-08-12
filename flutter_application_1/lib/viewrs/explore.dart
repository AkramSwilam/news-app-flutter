import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../Screens/SearchPage.dart';
import '../controller/provider.dart';
import '../widgets/categories_widget_Vertical.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  var controller =  TextEditingController();
  late String Valu = "Nan";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,

            style:  TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50).r,
                    borderSide: BorderSide( width: 3.w,color:Colors.red.shade500 )
                ),
                hintText: 'What are you looking for?',
                hintStyle:  TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(5),
                  child: IconButton(icon: const Icon(Icons.highlight_remove,color: Colors.red),
                    onPressed: controller.clear,

                  ),
                ) ,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(5),
                  width: 18.w,
                  child: IconButton(icon: const Icon(Icons.search,color: Colors.red),onPressed: (){
                    setState(() {
                      Valu = controller.text;
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Search(Provider.of<HomeProvider>(context, listen: false).GetApi(Valu))));
                    });
                  }),
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5,top: 5,),
          child: Text('Categories',style:  TextStyle(fontWeight: FontWeight.w500 ,fontSize: 17.sp,color: Colors.black ,)),
        ),
        const CategoriesWidget(),


      ],
    );
  }


}
/*
 Padding(
          padding:  const EdgeInsets.all(5.0),
          child: Text('Tranding',style:  TextStyle(fontWeight: FontWeight.w500 ,fontSize: 17.sp,color: Colors.black ,)),
        ),
         Padding(
          padding:  const EdgeInsets.all(5.0),
          child: DefaultPage(),
        ),
*/