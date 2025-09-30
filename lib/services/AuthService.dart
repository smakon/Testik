import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyUserId = 'user_id';
  static const String _keyEmail = 'user_email';

  // Сохранить данные пользователя после входа/регистрации
  Future<void> saveUser(String userId, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserId, userId);
    await prefs.setString(_keyEmail, email);
  }

  // Проверить, авторизован ли пользователь
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyUserId);
  }

  // Получить данные пользователя
  Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(_keyUserId);
    final email = prefs.getString(_keyEmail);
    if (userId != null && email != null) {
      return {'id': userId, 'email': email};
    }
    throw Exception('Пользователь не найден');
  }

  // Выход из аккаунта
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyEmail);
  }
}
