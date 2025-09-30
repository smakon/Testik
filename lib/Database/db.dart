import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static late Db db;

  // URL подключения
  static const String uri =
      "mongodb://192.168.1.249:27017/testik_db";

  // Подключение
  static Future<void> connect() async {
    db = Db(uri);
    await db.open();
    print("✅ Подключено к MongoDB: testik_db");
  }

  // Получить коллекцию по имени
  static DbCollection collection(String name) {
    return db.collection(name);
  }

  // Закрыть соединение
  static Future<void> close() async {
    await db.close();
  }
}