import 'package:flutter/material.dart';
import 'package:notx/Screens/update_screen.dart';
import 'package:notx/data/notes_data.dart';
// import 'package:intl/intl.dart';
import 'package:hive/hive.dart';
// import 'package:notx/main.dart';

class NotesCard extends StatefulWidget {
  const NotesCard({super.key, required this.note});
  final NotesData? note;

  @override
  State<NotesCard> createState() => _NotesCardState();
}

class _NotesCardState extends State<NotesCard> {
  var box = Hive.box<NotesData>('Mybox');
  @override
  Widget build(context) {
    return Card(
      child:InkWell(
        onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> UpdateScreen(notes: widget.note)));
        },
        child: ListTile(
        title: Text(widget.note!.title),
        subtitle: Text(widget.note!.description,maxLines: 3,
        overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(onPressed: () async {
          await widget.note!.delete();
        }, icon: Icon(Icons.delete_rounded)),
      ) ,
    ),);
  }
}
