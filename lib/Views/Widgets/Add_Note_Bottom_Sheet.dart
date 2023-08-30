import 'package:flutter/material.dart';

import 'package:noteapp/Views/Widgets/Custom_text_Field.dart';

import 'Custom_Bottom.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child:  Container(
        child:const SingleChildScrollView(
          child: Column(
            children:   [
               SizedBox(
                height: 32,
              ),
              CustomTextField(
                HintText: "Title",
              ),
              SizedBox(
                height: 16,
              ),
              CustomTextField(
                HintText: "Contant",
                MixLine: 5,
              ),
              SizedBox(
                height: 32,
              ),
              CustomBottom(),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
