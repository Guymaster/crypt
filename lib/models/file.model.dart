import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class File extends HiveObject {
  @HiveField(0)
  String collection_name;

  @HiveField(1)
  String content;

  @HiveField(3)
  int timestamp = DateTime.timestamp().millisecondsSinceEpoch;

  File(this.collection_name, this.content);
}