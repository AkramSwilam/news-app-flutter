import 'package:contest/Screens/country_wideget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../viewrs/allNews.dart';
import '../viewrs/explore.dart';
import '../viewrs/saved.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
int indx = 0;
 List _namepages =[
  "Top News",
   "Countries News",
   "Saved",
   "Explore",
];

 List<Widget> _pages = <Widget>[
  DefaultPage(),
  const Countrywideget(),
  const SavedNews(),
  const Explore(),
];

class _HomeState extends State<Home> {
  int currentIndex = 0;

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
            children:  <Widget>[
              SizedBox(height: 8.h,),
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 5,bottom: 5,top: 5,right: 5).r,
                    margin:const EdgeInsets.only(left: 10, right: 10).r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                      child:  Text( "${_namepages[currentIndex]}" ,style:   TextStyle(fontWeight: FontWeight.w500 ,fontSize: 17.sp ,color: Colors.black ),
                      ),
                  ),
                ],
              ),
              _pages.elementAt(currentIndex),
            ]),
      ),

      /* ///////////////////////////////////////////////////////// */

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          type: BottomNavigationBarType.fixed,
          elevation: 10,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: const [

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled ,
                  size: 30,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.flag,
                  size: 30,
                ),
                label: "Countries"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                  size: 30,
                ),
                label: "Saved",),
                BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: "Explore",),
          ],
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.red.shade900,
        unselectedItemColor: Colors.black ,
      ),
    );
  }
}
