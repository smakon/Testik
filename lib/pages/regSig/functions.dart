import 'package:flutter/material.dart';
import 'package:testik/Database/methods.dart';
import 'package:testik/services/AuthService.dart';

Future<void> checkUserAndNavigate(
  BuildContext context,
  String emailOrLogin,
  String password,
) async {
  try {
    // 1. Попробуем найти по email
    var user = await findOneInCollection("users", {"email": emailOrLogin});

    // 2. Если не нашли по email — ищем по login
    if (user == null) {
      user = await findOneInCollection("users", {"name": emailOrLogin});
    }

    // 3. Если пользователь не найден ни по email, ни по login
    if (user == null) {
      // Переход к регистрации
      Navigator.pushReplacementNamed(context, '/registration');
      return;
    }

    // 4. Проверяем пароль
    final storedPassword = user['password'];
    if (storedPassword == null) {
      // Защита от багов: если в БД нет пароля
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка: аккаунт повреждён')));
      return;
    }

    if (storedPassword != password) {
      // Пароль не совпадает
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Неверный пароль')));
      return;
    }

    // 5. Всё верно — сохраняем пользователя
    final authService = AuthService();
    await authService.saveUser(
      user['_id'].toString(),
      user['email'],
      user['name'],
    );

    // 6. Переходим на главный экран
    Navigator.pushReplacementNamed(context, '/home');
  } catch (e) {
    // Обработка ошибок (например, нет подключения к БД)
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Ошибка входа: $e')));
  }
}
