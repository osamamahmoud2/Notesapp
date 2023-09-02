import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({this.ontap, this.islouding = false});
  final void Function()? ontap;
  final bool islouding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: islouding
                ? const SizedBox(
                    height: 21,
                    width: 21,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ))
                : const Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
      ),
    );
  }
}
