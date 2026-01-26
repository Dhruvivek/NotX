import 'package:hive_flutter/hive_flutter.dart';
import "package:flutter/material.dart";
import "package:notx/Screens/home_screen.dart";
import "package:notx/data/notes_data.dart";
import "package:path_provider/path_provider.dart";


void main() async{
  //1.Ensure the flutter 
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Set path using path_provider
  final directory = await getApplicationDocumentsDirectory();

  // 3. initiate flutter
  await Hive.initFlutter(directory.path);
  
  // 4. registering generated adaptor
  Hive.registerAdapter(NotesDataAdapter());

  // 5. open hive box
  await Hive.openBox<NotesData>('Mybox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: HomeScreen());
  }
}
