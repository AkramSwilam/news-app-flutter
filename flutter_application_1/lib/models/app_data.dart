import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_core/firebase_core.dart';

class AppData{
  static final auth=FirebaseAuth.instance;
  static  User? user;
  Future< void> getUser() async{
     try{
     user =auth.currentUser!;
  }catch(e){

  }
  }
 
  

}