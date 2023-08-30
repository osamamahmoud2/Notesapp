import 'package:flutter/material.dart';
import 'package:noteapp/Views/Widgets/Custom_App_bar.dart';
import 'package:noteapp/Views/Widgets/Custom_text_Field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Custom_App_bar(
            titel: "Edit Note",
            icon: Icons.check,
          ),
          SizedBox(
            height: 40,
          ),
          CustomTextField(hintText: "Title"),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: "Content",
            mixLine: 5,
          )
        ],
      ),
    );
  }
}
