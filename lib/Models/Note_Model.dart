import 'package:hive/hive.dart';
part 'Note_Model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  final String titel;
  @HiveField(1)
  final String subtitel;
  @HiveField(2)
  final String date;
  @HiveField(3)
  final int color;

  NoteModel({required this.titel,required this.subtitel,required this.date,required this.color});
}