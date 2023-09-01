import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Cubits/cubit/add_note_cubit.dart';
import 'package:noteapp/Simple_bloc_Observer.dart';
import 'package:noteapp/Views/Constants.dart';
import 'package:noteapp/Views/Notes_View.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBoxs);
  Bloc.observer = SimlpleBlocObserver();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddNoteCubit(),)
      ],
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
