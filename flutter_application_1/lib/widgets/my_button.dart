import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String? text;
  final Color? myColor;
  final VoidCallback myOnPressed; 
  Color textColor=Colors.white;
  MyButton({ required this.text, required this.myColor, required this.myOnPressed , textColor}){
    if (textColor==null) {
      this.textColor=Colors.white;
    }else{
      this.textColor=textColor;
    }
  } 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child: Material(
        elevation: 5,
        color: myColor,
        borderRadius: BorderRadius.circular(15),
        child: MaterialButton(
           child: 
           Text(
            text!,
            style: TextStyle(
                color:textColor,
                fontSize: 18
            ),
            ),
          onPressed:myOnPressed,
          minWidth: 200,
          height: 40,
         
          ),
      ),
    );
  }
}