import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testik/Database/methods.dart';
import 'package:testik/services/AuthService.dart';

Future<void> checkUserAndNavigate(BuildContext context, String email) async {
  var user = await findOneInCollection("users", {"email": email});
  if (user != null) {
    final authService = AuthService();
    await authService.saveUser(
      user['_id'].toString(),
      email,
    ); // сохраняем ID и email

    // Переходим на главный экран
    Navigator.pushReplacementNamed(context, '/home');
  } else {
    Navigator.pushReplacementNamed(context, '/registration');
  }
}
