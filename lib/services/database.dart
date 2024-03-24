import 'package:crypt/common/values.dart';
import 'package:crypt/models/collection.model.dart';
import 'package:crypt/models/file.model.dart';
import 'package:hive/hive.dart';

abstract class Database {
  static Future<BoxCollection> getDb() async {
    return BoxCollection.open(HIVE_COLL_NAME, {"collections", "files"},
      path: "/",
    );
  }

  Future<List<Collection>> getCollections() async {
    var db = await getDb();
    var box = await db.openBox("collections");
    var keys = await box.getAllKeys();
    var values = await box.getAll(keys) as List<Collection>;
    values.sort((a, b){
      return (a.name.toUpperCase().compareTo(b.name.toUpperCase()));
    });
    return values;
  }

  addCollection(Collection collection) async {
    var db = await getDb();
    var box = await db.openBox("collections");
    await box.put(collection.name, collection);
  }

  deleteCollection(String name) async {
    var db = await getDb();
    var box = await db.openBox("collections");
    await box.delete(name);
  }

  Future<List<File>> getFiles() async {
    var db = await getDb();
    var box = await db.openBox("files");
    var keys = await box.getAllKeys();
    var values = await box.getAll(keys) as List<File>;
    values.sort((a, b){
      return (a.timestamp.compareTo(b.timestamp));
    });
    return values;
  }

  addFile(File file) async {
    var db = await getDb();
    var box = await db.openBox("files");
    await box.put(file.timestamp.toString(), file);
  }

  deleteFile(File file) async {
    var db = await getDb();
    var box = await db.openBox("files");
    await box.delete(file.timestamp.toString());
  }
}

/*class Encryptor extends HiveCipher {
  @override
  int calculateKeyCrc() {
    // TODO: implement calculateKeyCrc
    throw UnimplementedError();
  }

  @override
  int decrypt(Uint8List inp, int inpOff, int inpLength, Uint8List out, int outOff) {
    // TODO: implement decrypt
    throw UnimplementedError();
  }

  @override
  int encrypt(Uint8List inp, int inpOff, int inpLength, Uint8List out, int outOff) {
    // TODO: implement encrypt
    throw UnimplementedError();
  }

  @override
  int maxEncryptedSize(Uint8List inp) {
    // TODO: implement maxEncryptedSize
    throw UnimplementedError();
  }

}*/