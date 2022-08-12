import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


import '../widgets/my_button.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute="signin_screen";
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //  String getMessageFromErrorCode(String firebaseError) {
  //   switch (firebaseError) {
  //     case "ERROR_EMAIL_ALREADY_IN_USE":
  //     case "account-exists-with-different-credential":
  //     case "email-already-in-use":
  //       return getText('error_3');
  //     case "ERROR_WRONG_PASSWORD":
  //     case "wrong-password":
  //       return getText('error_4');
  //     case "ERROR_USER_DISABLED":
  //     case "user-disabled":
  //       return getText('error_5');
  //     case "ERROR_TOO_MANY_REQUESTS":
  //       return getText('error_6');
  //     case "ERROR_OPERATION_NOT_ALLOWED":
  //     case "operation-not-allowed":
  //       return "${getText('error_7')}. ${getText('error_8')}";
  //     case "ERROR_INVALID_EMAIL":
  //     case "invalid-email":
  //       return getText('error_9');
  //     case "ERROR_USER_NOT_FOUND":
  //     case "user-not-found":
  //       return getText('error_10');
  //     default:
  //       return "${getText('error_11')}. ${getText('error_8')}";
  //   }
  // }
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
                          EdgeInsets.symmetric(vertical: 15, horizontal: 20),
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
                    
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    decoration: const InputDecoration(
                      hintText: "Enter your Password",
                      hintStyle: TextStyle(color: Colors.white60,fontWeight: FontWeight.w700),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 28),
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
                  text: "Sign in", myColor: Color.fromARGB(234, 255, 255, 255),
                  textColor: Colors.red,
                   myOnPressed: () async{
                    setState(() {
                      showSpinner=true;
                    });
                    try {
                      
                      final user =await _auth.signInWithEmailAndPassword(email: email, password: password);    
                    if (user!=null) {
                      
                      Navigator.pushNamed(context,"home");
                      setState(() {
                        showSpinner=false;
                      });
                      }else{
                        setState(() {showSpinner=false;
                          
                        });
                      }
                    
                    
                    } on FirebaseAuthException catch (firebaseException) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pop();
        
      });

      print(firebaseException);

    } catch (e) {
      print(e);
    }
                }),
                ]),
          ),
        ),
      ),
    );
  // bool showSpinner=false;
  // final _auth=FirebaseAuth.instance;
  // late String email;
  // late String Password;
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     body: ModalProgressHUD(
  //       inAsyncCall: showSpinner,
  //       child: SingleChildScrollView(
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 24.0 ,vertical: 28),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: [
  //               Container(
  //                 child: Image.asset("assets/news_logo.jpeg"),
  //               ),
  //               SizedBox(
  //                 height: 50,
  //               ),
  //               TextField(
  //                 keyboardType:TextInputType.emailAddress,
  //                 textAlign: TextAlign.center,
  //                 onChanged: (value){
  //               email=value;
  //                 },
  //                 decoration: InputDecoration(
  //                   hintText: "Enter your Email",
  //                   contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.all(Radius.circular(10))
  //                   ),
  //                   enabledBorder:OutlineInputBorder(
  //                     borderSide:BorderSide(color: Colors.lightBlue,width: 1) ,
  //                     borderRadius: BorderRadius.all(Radius.circular(10))
  //                   ),
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide:BorderSide(color: Colors.blue,width: 2) ,
  //                     borderRadius: BorderRadius.all(Radius.circular(10))
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 12.0,),
  //               TextField(
  //                 obscureText: true,
  //                 textAlign: TextAlign.center,
  //                 onChanged: (value){
  //               Password=value;
  //                 },
  //                 decoration: InputDecoration(
  //                   hintText: "Enter your Password",
  //                   contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.all(Radius.circular(10))
  //                   ),
  //                   enabledBorder:OutlineInputBorder(
  //                     borderSide:BorderSide(color: Colors.lightBlue,width: 1) ,
  //                     borderRadius: BorderRadius.all(Radius.circular(10))
  //                   ),
  //                   focusedBorder: OutlineInputBorder(
  //                     borderSide:BorderSide(color: Colors.blue,width: 2) ,
  //                     borderRadius: BorderRadius.all(Radius.circular(10))
  //                   ),
  //                 ),
  //               ),
  //               SizedBox(height: 12,),
  //               MyButton(
  //                 text: "Sign in", myColor: Colors.blue[800]!,
  //                  myOnPressed: () async{
  //                   setState(() {
  //                     showSpinner=true;
  //                   });
  //                   try {
  //                     final user =await _auth.signInWithEmailAndPassword(email: email, password: Password);
  //                   if (user!=null) {
  //                     Navigator.pushNamed(context,"home");
  //                     setState(() {
  //                       showSpinner=false;
  //                     });
  //                   }
  //                   } catch (e) {
  //                     print(e);
  //                   }
  //               }),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  }
}