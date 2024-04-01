
class Collection {
  int id = 0;
  String name;
  int? createdAt = DateTime.timestamp().millisecondsSinceEpoch;
  int? updatedAt = DateTime.timestamp().millisecondsSinceEpoch;

  Collection({required this.id, required this.name, this.createdAt, this.updatedAt});
}