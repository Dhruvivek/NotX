import "package:flutter/material.dart";
import "package:hive_flutter/adapters.dart";
import "package:notx/Screens/new_screen.dart";
// import 'package:notx/data/dummy_data.dart';
import "package:notx/Widgets/notes_card.dart";
import "package:notx/data/notes_data.dart";
// import 'package:hive/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // final List n = DummyData.getnotes();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text("NotX"), backgroundColor: Colors.orangeAccent,automaticallyImplyLeading: true,),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder:(context)=> NewScreen()));},
        elevation: 5,
        backgroundColor: const Color.fromARGB(255, 255, 162, 41),
        child: Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<NotesData>('Mybox').listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final note = box.getAt(index);
            
              return NotesCard(note: note);
            },
          );
        }
      ),
    );
  }
}
