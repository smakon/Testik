import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _keyUserId = 'user_id';
  static const String _keyEmail = 'user_email';

  // Сохранить данные пользователя после входа/регистрации
  Future<void> saveUser(String userId, String email, String login) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
    await prefs.setString('user_email', email);
    await prefs.setString('user_login', login);
  }

  // Проверить, авторизован ли пользователь
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_keyUserId);
  }

  // Получить данные пользователя
  Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('user_id');
    final userEmail = prefs.getString('user_email');
    final userLogin = prefs.getString('user_login');

    if (userId != null && userEmail != null) {
      return {'id': userId, 'email': userEmail, 'login': userLogin ?? ''};
    }
    throw Exception('Пользователь не авторизован');
  }

  // Выход из аккаунта
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyEmail);
  }
}
