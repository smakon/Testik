// Добавить документ в любую коллекцию
import 'package:testik/Database/db.dart';

Future<void> insertToCollection(String collectionName, Map<String, dynamic> data) async {
  try {
    var collection = MongoDatabase.collection(collectionName);
    await collection.insertOne(data);
    print("✅ Данные добавлены в коллекцию: $collectionName");
  } catch (e) {
    print("❌ Ошибка при вставке: $e");
  }
}

// Получить все документы из коллекции
Future<List<Map<String, dynamic>>> getAllFromCollection(String collectionName) async {
  try {
    var collection = MongoDatabase.collection(collectionName);
    var cursor = collection.find();
    List<Map<String, dynamic>> result = await cursor.toList();
    print("✅ Получено ${result.length} документов из $collectionName");
    return result;
  } catch (e) {
    print("❌ Ошибка при чтении: $e");
    return [];
  }
}

// Найти один документ
Future<Map<String, dynamic>?> findOneInCollection(String collectionName, Map<String, dynamic> query) async {
  try {
    var collection = MongoDatabase.collection(collectionName);
    var result = await collection.findOne(query);
    return result;
  } catch (e) {
    print("❌ Ошибка при поиске: $e");
    return null;
  }
}

// Обновить документ
Future<void> updateOneInCollection(
    String collectionName,
    Map<String, dynamic> filter,
    Map<String, dynamic> update,
    ) async {
  try {
    var collection = MongoDatabase.collection(collectionName);
    await collection.updateOne(filter, { r'$set': update });
    print("✅ Обновлено в $collectionName");
  } catch (e) {
    print("❌ Ошибка при обновлении: $e");
  }
}

// Удалить документ
Future<void> deleteOneFromCollection(String collectionName, Map<String, dynamic> filter) async {
  try {
    var collection = MongoDatabase.collection(collectionName);
    await collection.deleteOne(filter);
    print("✅ Удалено из $collectionName");
  } catch (e) {
    print("❌ Ошибка при удалении: $e");
  }
}