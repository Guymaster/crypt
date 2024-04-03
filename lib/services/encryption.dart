import 'package:dbcrypt/dbcrypt.dart';

abstract class EncryptionService {
  static DBCrypt getEncryptor() => DBCrypt();
  static const String _salt = "|_EXP3CT_TH4T_TH|S_S4LT_|S_STRONG_3N0UGH";

  static ({String hash, String salt}) generateHash(String password){
    final encryptor = getEncryptor();
    final salt = encryptor.gensalt();
    return (hash: encryptor.hashpw(password, salt), salt: salt);
  }

  static bool check(String password, String hash){
    final encryptor = getEncryptor();
    bool isValid = encryptor.checkpw(password, hash);
    return isValid;
  }
}