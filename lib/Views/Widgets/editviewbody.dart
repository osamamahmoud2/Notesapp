import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/Notes_cubit/notes_cubit.dart';
import 'package:noteapp/Views/Widgets/cutomappbar.dart';
import 'package:noteapp/Views/constanats.dart';

import '../../Models/Note_Model.dart';
import 'AddNoteSheetForm.dart';
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
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  content: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(9999)),
                      child: const Center(
                          child: Text(
                        'Save changes',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )))));
              const SizedBox(
                height: 200,
              );
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
          const SizedBox(
            height: 16,
          ),
          EditColoritem(
            note: widget.notee,
          )
        ],
      ),
    );
  }
}

class EditColoritem extends StatefulWidget {
  const EditColoritem({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditColoritem> createState() => _EditColoritemState();
}

class _EditColoritemState extends State<EditColoritem> {
  late int currentindex;
  @override
  void initState() {
    currentindex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2.6,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: GestureDetector(
                  onTap: () {
                    currentindex = index;
                    widget.note.color = colors[index].value;
                    setState(() {});
                  },
                  child: ColorItam(
                    isactive: currentindex == index,
                    colors: colors[index],
                  )),
            );
          }),
    );
  }
}
