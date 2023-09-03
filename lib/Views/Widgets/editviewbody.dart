import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/Notes_cubit/notes_cubit.dart';
import 'package:noteapp/Views/Widgets/cutomappbar.dart';

import '../../Models/Note_Model.dart';
import 'cutomtextfield.dart';

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
              widget.notee.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
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
            hintText: widget.notee.titel,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (data) {
              subbtille = data;
            },
            hintText: widget.notee.subtitel,
            mixLine: 5,
          ),
        ],
      ),
    );
  }
}