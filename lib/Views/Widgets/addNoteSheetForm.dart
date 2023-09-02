import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noteapp/Models/Note_Model.dart';
import '../../Cubits/add_Note_Cubit/add_note_cubit.dart';
import 'Custom_Bottom.dart';
import 'Custom_text_Field.dart';
import 'package:intl/intl.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}
DateTime now = DateTime.now();


final GlobalKey<FormState> formkey = GlobalKey();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
String? titel, subtitel;

class _AddNoteFormState extends State<AddNoteForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (data) {
              titel = data;
            },
            hintText: "Title",
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onsaved: (data) {
              subtitel = data;
            },
            hintText: "Contant",
            mixLine: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBottom(
                islouding: state is AddNoteLouding ? true : false,
                ontap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var notemodel = NoteModel(
                        titel: titel!,
                        subtitel: subtitel!,
                        date: DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()).toString(),
  
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addnote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
