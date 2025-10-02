import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';
import 'package:testik/design/images.dart';
import 'package:testik/design/ui/glassWidget.dart';
import 'package:testik/design/ui/uiMethods.dart';
import 'package:testik/pages/Registration/functions.dart';

var inputLogin, inputPassword, inputEmail;

class RegistrationBody extends StatelessWidget {
  const RegistrationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _greenCircle(),
        _orangeCircle(),
        _upCurve(),
        _downCurve(),
        _form(context),
      ],
    );
  }

  Widget _upCurve() {
    return upRegCurve.positioned(left: -800, top: 30, width: 2100, height: 270);
  }

  Widget _downCurve() {
    return downRegCurve.positioned(
      left: -70,
      bottom: 70,
      width: 567,
      height: 154,
    );
  }

  Widget _greenCircle() {
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
    ).positioned(top: 130, left: 30);
  }

  Widget _orangeCircle() {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 38, sigmaY: 38),
      child: Container(
        width: 165,
        height: 165,
        decoration: BoxDecoration(
          color: accentColor50Transparent,
          borderRadius: BorderRadius.all(Radius.circular(500)),
        ),
      ),
    ).positioned(bottom: 230, right: 30);
  }

  Widget _form(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -50), // двигаем форму на 80px ВВЕРХ
        child: Container(
          height: 510,
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
                  Text(
                    'Регистрация',
                    style: TextStyle(fontSize: fontSize36, color: textColor),
                  ),

                  Column(
                    spacing: 10,
                    children: [
                      Text(
                        'Имя',
                        style: TextStyle(
                          fontSize: fontSize24,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                      Container(
                        width: 316,
                        height: 54,
                        child: TextField(
                          onChanged: (value) => {inputLogin = value},
                          decoration: InputDecoration(
                            hintText: 'Имя',
                            hintStyle: TextStyle(
                              color: primaryColor,
                              fontSize: fontSize16,
                            ),
                            filled: true,
                            fillColor: backgroundColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 3,
                              ),
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
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Text(
                        'Почта',
                        style: TextStyle(
                          fontSize: fontSize24,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
                        ),
                      ),
                      Container(
                        width: 316,
                        height: 54,
                        child: TextField(
                          onChanged: (value) => {inputEmail = value},
                          decoration: InputDecoration(
                            hintText: 'Почта',
                            hintStyle: TextStyle(
                              color: primaryColor,
                              fontSize: fontSize16,
                            ),
                            filled: true,
                            fillColor: backgroundColor,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 3,
                              ),
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
                    ],
                  ),
                  Column(
                    spacing: 10,
                    children: [
                      Text(
                        'Пароль',
                        style: TextStyle(
                          fontSize: fontSize24,
                          fontWeight: FontWeight.bold,
                          color: accentColor,
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
                              borderSide: BorderSide(
                                color: primaryColor,
                                width: 3,
                              ),
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
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () async => await registration(
                      inputEmail,
                      inputPassword,
                      inputLogin,
                      context,
                    ),
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
                    child: Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                        fontSize: fontSize20,
                        fontWeight: FontWeight.w700,
                        color: backgroundColor,
                      ),
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
