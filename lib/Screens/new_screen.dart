import "package:intl/intl.dart";
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notx/data/notes_data.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  String now = DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());
  final TextEditingController _title = TextEditingController();
  final TextEditingController _des= TextEditingController();
  var box = Hive.box<NotesData>('Mybox');
  
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xFFFFAB40),title: Text("Add Note"),actions: [IconButton(onPressed: () {
        final newNote = NotesData(
          title: _title.text.toString(),
          description : _des.text.toString(),
          createdAt : now,
          updatedAt : now.toString(),
        );
        if(_title.text.toString().isEmpty || _des.text.toString().isEmpty){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter the title and the note '),duration: Duration(seconds: 2),backgroundColor: Colors.redAccent,));
        }
        else{
        box.add(newNote);
        Navigator.pop(context);
        }
      }, icon: Icon(Icons.check)),IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(now),
            TextFormField(decoration: InputDecoration(hintText: "  Title"),controller: _title,),
            SizedBox(height: 30),
            TextFormField(maxLines: null,decoration: InputDecoration(hint: Text(" Start typing..."),border: InputBorder.none,),controller: _des,),
          ],
        ),
      ),
    );
  }
}
