

import 'package:flutter/material.dart';
import 'package:noteapp/Views/Edit_Note_Veiw.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
                  context, ScaleTransition5(const EditNoteView()));
      },
      child: Container(
        padding:const EdgeInsets.only(top: 24, bottom: 26,left: 16),
        decoration: BoxDecoration(
          color:const Color(0xffFFCC80),
          borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          ListTile(
            title:const  Text('Flutter Tips', style: TextStyle(color: Colors.black, fontSize: 26, ),),
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
class ScaleTransition5 extends PageRouteBuilder {
  final Widget page;

  ScaleTransition5(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
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