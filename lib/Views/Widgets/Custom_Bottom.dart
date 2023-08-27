import 'package:flutter/material.dart';

import '../Constants.dart';
class CustomBottom extends StatelessWidget {
  const CustomBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(color: KPrimaryColor,borderRadius: BorderRadius.circular(8)),
      child:const Center(child: Text('Add',style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),)),
    );
  }
}