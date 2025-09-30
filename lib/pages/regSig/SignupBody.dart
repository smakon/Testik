import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testik/Database/methods.dart';

import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';
import 'package:testik/design/images.dart';
import 'package:testik/pages/regSig/functions.dart';

var input = "";

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
    return Positioned(
      top: -50,
      left: -10,
      width: 510,
      height: 271,
      child: upCurve, // например, изображение или CustomPaint
    );
  }

  Widget _downCurve() {
    return Positioned(
      bottom: 100,
      left: -37,
      width: 510,
      height: 271,
      child: downCurve,
    );
  }

  Widget _circle() {
    return Positioned(
      top: 190,
      left: 30,
      child: ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 38, sigmaY: 38),
        child: Container(
          width: 165,
          height: 165,
          decoration: BoxDecoration(
            color: primaryColor75Transparent,
            borderRadius: BorderRadius.all(Radius.circular(500)),
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -50), // двигаем форму на 80px ВВЕРХ
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
            child: Container(
              width: 360,
              height: 366,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.03),
                border: Border.all(color: textColor, width: 3),
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.15),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0xFF747474).withOpacity(0.05),
                    blurRadius: 1000,
                    spreadRadius: 1000,
                  ),
                ],
              ),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Вход или регистрация',
                        style: TextStyle(
                          fontSize: fontSize24,
                          color: textColor,
                        ),
                      ),
                      Text(
                        'Введите логин и почту',
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
                      onChanged: (value) => {input = value},
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: backgroundColor,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: primaryColor75Transparent,
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await checkUserAndNavigate(context, input);
                    },
                    style: ElevatedButton.styleFrom(
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
                    child: Text('Войти'),
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
