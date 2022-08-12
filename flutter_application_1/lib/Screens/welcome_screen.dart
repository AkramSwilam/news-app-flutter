import "package:flutter/material.dart";

import '../widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute="welcome_screen";
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade600,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset("assets/1.png"),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            MyButton(
              myColor: Color.fromARGB(234, 255, 255, 255),
              textColor: Colors.red,
              
              text: "Sign in",
              myOnPressed: (){
                Navigator.pushNamed(context, "log_in");
              },
            ),
            MyButton(
              myColor: Colors.transparent,
              text: "Sign up",
              myOnPressed: (){
                Navigator.pushNamed(context,"registration");
              },
            ),
          ],
        ),
      ),
    );
  }
}

