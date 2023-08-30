import 'package:flutter/material.dart';

import '../Constants.dart';
class CustomBottom extends StatelessWidget {
  const CustomBottom({this.ontap});
final  Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(color: kPrimaryColor,borderRadius: BorderRadius.circular(8)),
        child:const Center(child: Text('Add',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}