import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class File extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String collection_name;

  @HiveField(2)
  String content;

  @HiveField(3)
  int timestamp = DateTime.timestamp().millisecondsSinceEpoch;

  File(this.collection_name, this.title, this.content);
}