import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Views/Constants.dart';
import 'package:noteapp/Views/Notes_View.dart';

void main() async{
 await Hive.initFlutter();
 await Hive.openBox(kNotesBoxs);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      theme: ThemeData(brightness: Brightness.dark,
      fontFamily: 'Poppins',
      ),
      home:const NotesView(),
    );
  }
}
