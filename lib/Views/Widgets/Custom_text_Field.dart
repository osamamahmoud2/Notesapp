import 'package:flutter/material.dart';
import 'package:noteapp/Views/Constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.HintText,  this.MixLine=1});
  final String HintText;
  final int MixLine;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: MixLine,
      cursorColor:KPrimaryColor,
      decoration: InputDecoration(
        hintText: HintText,
        
        hintStyle: TextStyle(color: KPrimaryColor),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:KPrimaryColor),
            borderRadius: BorderRadius.circular(16)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:KPrimaryColor),
            borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(16))),
            
    );
  }
}
