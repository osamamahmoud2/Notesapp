import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Models/Note_Model.dart';
import 'package:noteapp/Simple_bloc_Observer.dart';
import 'package:noteapp/Views/Constants.dart';
import 'package:noteapp/Views/Notes_View.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      home: const NotesView(),
    );
  }
}
