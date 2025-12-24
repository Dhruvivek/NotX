import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';

part 'notes_data.g.dart';

@HiveType(typeId: 0)
class NotesData  extends HiveObject{
  // @HiveField(0)
  // String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;

  @HiveField(3)
  String createdAt;

  @HiveField(4)
  String updatedAt;

  // bool ispinned;

  NotesData({
    // required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    // required this.ispinned,
  });
}
