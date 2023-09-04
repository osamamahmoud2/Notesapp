import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:noteapp/Models/Note_Model.dart';
import '../../Cubits/add_Note_Cubit/add_note_cubit.dart';


import 'package:intl/intl.dart';

import 'custombotton.dart';
import 'cutomtextfield.dart';

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
          ColorItemList(),
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
class ColorItam extends StatelessWidget {
  const ColorItam({super.key, required this.isactive, required this.colors});
final bool isactive;
final Color colors;
  @override
  Widget build(BuildContext context) {
    return isactive?
     CircleAvatar(
      radius: 27,
      backgroundColor: Colors.white,
      child:    CircleAvatar(
         radius: 25,
        backgroundColor:colors,
       child:const  Icon(Icons.check,color: Colors.black,),
       //Text('choiced',style: TextStyle(color: Colors.black),)
      ),
    ) :  CircleAvatar(
      radius: 30,
      backgroundColor:colors,
    );
  }
}
class ColorItemList extends StatefulWidget {
  const ColorItemList({super.key});

  @override
  State<ColorItemList> createState() => _ColorItemListState();
}

class _ColorItemListState extends State<ColorItemList> {
  int currentindex=0;
  List<Color> colors=const[
    Color(0xff277da1),
     Color(0xff02c39a),
      Color(0xff212f45),
       Color(0xffD499B9),
        Color(0xffE8C1C5),
        Colors.white,
         Color(0xff011638),
     Color(0xfff08080),
      Color(0xffced4da),
       Color(0xffb7b7a4),
        Color(0xffeff6e0),

  ]
  ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35*2.6,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context,index){
        return  Padding(
          padding:const   EdgeInsets.symmetric(horizontal: 5),
          child:   GestureDetector(
            onTap: (){
              currentindex =index;
              BlocProvider.of<AddNoteCubit>(context).color =colors[index];
              setState(() {
                
              });
            },
            child: ColorItam(isactive: currentindex==index,colors: colors[index],)),
        );
      }),
    );
  }
}

class Index {
}