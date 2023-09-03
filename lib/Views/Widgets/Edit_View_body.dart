import 'package:flutter/material.dart';
import 'package:noteapp/Views/Widgets/Custom_App_bar.dart';
import 'package:noteapp/Views/Widgets/Custom_text_Field.dart';
import '../../Models/Note_Model.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({Key? key, required this.notee}) : super(key: key);
  final NoteModel notee;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? titlle, subbtille;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          CustomAppbar(
            onPressedd: () {
              widget.notee.titel = titlle ?? widget.notee.titel;
              widget.notee.subtitel = subbtille ?? widget.notee.subtitel;
            },
            titel: "Edit Note",
            icon: Icons.check,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTextField(
            onChanged: (data) {
              titlle = data;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (data) {
              subbtille = data;
            },
            hintText: 'content',
            mixLine: 5,
          ),
        ],
      ),
    );
  }
}