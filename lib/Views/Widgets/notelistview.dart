import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:noteapp/Cubits/Notes_cubit/notes_cubit.dart';
import 'package:noteapp/Models/Note_Model.dart';

import 'noteitem.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes ??
            []; // if note model is empty it will dis play empty screen
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: AnimationLimiter(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: notes.length,
              padding: EdgeInsets.zero,
              itemBuilder: ((BuildContext c, int i) {
                return AnimationConfiguration.staggeredList(
                    position: i,
                    delay: const Duration(milliseconds: 100),
                    child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        horizontalOffset: 30,
                        verticalOffset: 300.0,
                        child: FlipAnimation(
                          duration: const Duration(milliseconds: 3000),
                          curve: Curves.fastLinearToSlowEaseIn,
                          flipAxis: FlipAxis.y,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: NoteItem(
                              notes: notes[i],
                            ),
                          ),
                        )));
              }),
            ),
          ),
        );
      },
    );
  }
}
