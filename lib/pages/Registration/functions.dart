import 'package:flutter/material.dart';
import 'package:testik/Database/methods.dart';
import 'package:testik/services/AuthService.dart';

Future<void> registration(
  String email,
  String password,
  String login,
  BuildContext context,
) async {
  try {
    var user = await findOneInCollection("users", {"email": email});

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пользователь с таким email уже существует')),
      );
    } else {
      var isEmailValid = isValidEmail(email, context);
      if (!isEmailValid) {
        return;
      }
      var isPasswordValid = isValidPassword(password, context);
      if (!isPasswordValid) {
        return;
      }
      await insertToCollection("users", {
        "name": login,
        "password": password,
        "email": email,
        "myTests": [],
        "myPassedTests": [],
      });

      user = await findOneInCollection("users", {"email": email});

      if (user == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Ошибка при регистрации')));
        return;
      }

      final authService = AuthService();
      await authService.saveUser(
        user["_id"].toString(),
        user["email"],
        user["name"],
      );

      // 6. Переходим на главный экран
      Navigator.pushReplacementNamed(context, '/home');
    }
  } catch (e) {
    print(e);
  }
}

bool isValidEmail(String email, BuildContext context) {
  // Это регулярное выражение (regex), братан, для проверки email
  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegex.hasMatch(email)) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Неверный email')));
  }
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password, BuildContext context) {
  // Проверяем, чтобы был хотя бы 1 заглавный, 1 строчный, 1 цифра, и длина не меньше 8
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$',
  );
  if (!passwordRegex.hasMatch(password)) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Ненадёжный пароль')));
  }
  return passwordRegex.hasMatch(password);
}
