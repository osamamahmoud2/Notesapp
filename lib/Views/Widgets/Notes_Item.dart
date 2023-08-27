import 'package:flutter/material.dart';
import 'package:noteapp/Views/Edit_Note_Veiw.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 26,left: 16),
        decoration: BoxDecoration(
          color:const Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          ListTile(
            title: Text('Flutter Tips', style: TextStyle(color: Colors.black, fontSize: 26, ),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text('Training Makes Prefect', style: TextStyle(color: Colors.black.withOpacity(0.4),fontSize: 18)),
            ),
            trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.delete),color: Colors.black,iconSize: 30,)
          )
          ,Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text("may21, 2024", style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 16)),
          )
        ],),
      ),
    );
  }
}