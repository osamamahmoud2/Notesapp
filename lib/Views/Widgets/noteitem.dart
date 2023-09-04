import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Cubits/Notes_cubit/notes_cubit.dart';
import 'package:noteapp/Models/Note_Model.dart';
import 'package:noteapp/Views/editveiwbody.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key, required this.notes}) : super(key: key);
  final NoteModel notes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            ScaleTransition5(EditNoteView(
              notee: notes,
            )));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 26, left: 16),
        decoration: BoxDecoration(
            color: Color(notes.color), borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
                title: Text(
                  notes.titel,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(notes.subtitel,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                trailing: IconButton(
                  onPressed: () {
                    notes.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: Container(
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.red.shade900,
                                borderRadius: BorderRadius.circular(9999)),
                            child: const Center(
                                child: Text(
                              'The note was deleted',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )))));
                    const SizedBox(
                      height: 200,
                    );
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.black,
                  iconSize: 30,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(notes.date,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}

class ScaleTransition5 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition5(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 1000),
          reverseTransitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                parent: animation,
                reverseCurve: Curves.fastOutSlowIn);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
        );
}
