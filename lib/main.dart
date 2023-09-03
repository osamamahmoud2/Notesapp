import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Cubits/Notes_cubit/notes_cubit.dart';
import 'package:noteapp/Models/Note_Model.dart';
import 'package:noteapp/Simple_bloc_Observer.dart';
import 'package:noteapp/Views/constanats.dart';
import 'package:noteapp/Views/notesview.dart';

void main() async {
  await Hive.initFlutter();
    Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBoxs);
  
  Bloc.observer = SimlpleBlocObserver();

  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        home: const NotesView(),
      ),
    );
  }
}
