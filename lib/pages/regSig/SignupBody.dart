import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testik/Database/methods.dart';

import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';
import 'package:testik/design/images.dart';
import 'package:testik/design/ui/glassWidget.dart';
import 'package:testik/design/ui/uiMethods.dart';
import 'package:testik/pages/regSig/functions.dart';

var inputLogin = "";
var inputPassword = "";

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Верхняя волна
        _upCurve(),

        // 2. Круг (фоновый элемент)
        _circle(),

        // 3. Нижняя волна
        _downCurve(),

        // 4. Форма с эффектом frosted glass
        _form(context),
      ],
    );
  }

  Widget _upCurve() {
    return upCurve.positioned(left: -10, top: -70, width: 510, height: 300);
  }

  Widget _downCurve() {
    return downCurve.positioned(left: -37, bottom: 70, width: 510, height: 271);
  }

  Widget _circle() {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 38, sigmaY: 38),
      child: Container(
        width: 165,
        height: 165,
        decoration: BoxDecoration(
          color: primaryColor50Transparent,
          borderRadius: BorderRadius.all(Radius.circular(500)),
        ),
      ),
    ).positioned(top: 190, left: 30);
  }

  Widget _form(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -50), // двигаем форму на 80px ВВЕРХ
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: textColor, width: 3),
            borderRadius: BorderRadius.circular(28),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: GlassContainer(
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Вход',
                        style: TextStyle(
                          fontSize: fontSize24,
                          color: textColor,
                        ),
                      ),
                      Text(
                        'Введите логин/почту и пароль',
                        style: TextStyle(
                          fontSize: fontSize16,
                          color: accentColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 316,
                    height: 54,
                    child: TextField(
                      onChanged: (value) => {inputLogin = value},
                      decoration: InputDecoration(
                        hintText: 'Логин/почта',
                        hintStyle: TextStyle(
                          color: primaryColor,
                          fontSize: fontSize16,
                        ),
                        filled: true,
                        fillColor: backgroundColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: primaryColor, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor50Transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 316,
                    height: 54,
                    child: TextField(
                      onChanged: (value) => {inputPassword = value},
                      decoration: InputDecoration(
                        hintText: 'Пароль',
                        hintStyle: TextStyle(
                          color: primaryColor,
                          fontSize: fontSize16,
                        ),
                        filled: true,
                        fillColor: backgroundColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: primaryColor, width: 3),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: primaryColor50Transparent,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await checkUserAndNavigate(
                        context,
                        inputLogin,
                        inputPassword,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: elevationNone,
                      backgroundColor: primaryColor,
                      fixedSize: Size(316, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      textStyle: TextStyle(
                        color: backgroundColor,
                        fontSize: fontSize20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(
                      'Войти',
                      style: TextStyle(
                        fontSize: fontSize20,
                        fontWeight: FontWeight.w700,
                        color: backgroundColor,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text(
                      "Зарегестрироваться",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: fontSize16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
