import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Collection extends HiveObject {
  @HiveField(0)
  String name;

  Collection(this.name);
}