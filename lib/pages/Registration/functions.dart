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
