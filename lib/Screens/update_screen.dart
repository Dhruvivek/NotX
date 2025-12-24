import 'package:flutter/material.dart';
import 'package:notx/data/notes_data.dart';
import 'package:intl/intl.dart';
class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key,required this.notes,});
  final NotesData? notes;
  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController _title;
  late TextEditingController _des;
  late String time;
  String now = DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.now());  
  @override
  void initState(){
    super.initState();
    String? originaltitle = widget.notes!.title;
    String? originaldes = widget.notes!.description;
    _title = TextEditingController(text: originaltitle);
    _des = TextEditingController(text: originaldes);
    time = widget.notes!.updatedAt;
  }

  @override 
  void dispose(){
    super.dispose();
    _title.dispose();
    _des.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          IconButton(onPressed: () {
            widget.notes!.title = _title.text.toString();
            widget.notes!.description = _des.text.toString();
            widget.notes!.updatedAt = now;

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.notes!.title} updated")));
            Navigator.pop(context);
          }, icon: Icon(Icons.check)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(time),
            TextFormField(
            controller: _title,
          ), SizedBox(height: 30), TextFormField(
            controller: _des,
            decoration: InputDecoration(border: InputBorder.none),
            maxLines: null,
          )],
        ),
      ),
    );
  }
}
