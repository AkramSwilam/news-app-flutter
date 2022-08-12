
import 'package:contest/models/ArticleModel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import "package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart";

import '../widgets/my_button.dart';



class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = "registration_screen";
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 
  bool showSpinner = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? validateEmail(String? formEmail) {
    if (formEmail == null || formEmail.isEmpty)
      return 'E-mail address is required.';

    return null;
  }

  String? validatePassword(String? formPassword) {
    if (formPassword == null || formPassword.isEmpty)
      return 'Password is required.';

    return null;
  }

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade600,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 180,
                    child: Image.asset("assets/1.png"),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    
                   
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                    },
                    
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.w700),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 153, 70, 64), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  TextFormField(
                    
                    obscureText: true,
                    validator: validatePassword,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.w700),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 28),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color.fromARGB(255, 153, 70, 64), width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                       text: "Register", myColor: Color.fromARGB(234, 255, 255, 255),
                  textColor: Colors.red,
                      myOnPressed: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        try {
                        //  if (_key.currentState!.validate()) {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            // await DatabaseServices(user_id: newUser.user!.uid).setUserData(Article(title: "", description: "", URLImage: "", url: ""));
                            Navigator.popAndPushNamed(context, "sign_in");
                          //}
                          setState(() {
                            showSpinner = false;
                          });
                        }on FirebaseAuthException catch (e) {
      print("FirebaseAuthException \n$e");
      
      showDialog(
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            content: Text(("invalid email or password")),
            actions: [
              TextButton(
                child: Text(('ok')),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );

    } catch (e){
      setState(() {
        showSpinner=false;
      });
    }
                      }),
                ]),
          ),
        ),
      ),
    );
  }
}
