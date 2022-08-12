import 'package:contest/Screens/login_screen.dart';
import 'package:contest/Screens/registration_screen.dart';
import 'package:contest/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'Screens/Home.dart';
import 'controller/provider.dart';
import 'package:firebase_core/firebase_core.dart';

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:  const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context,child) {
          return ChangeNotifierProvider(
        create: (context) => HomeProvider(),
        child:    MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
          routes: {
            "registration":(context) => RegistrationScreen(),
            "home":(context)=>Home(),
            "log_in":(context)=>SignInScreen()
          },
        ),
      );  },
       child:  const WelcomeScreen()
    );
  }
}
