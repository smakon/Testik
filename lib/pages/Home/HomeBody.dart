import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';
import 'package:testik/design/ui/glassWidget.dart';
import 'package:testik/design/ui/uiMethods.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 110,
            children: [_orangeCircle(), _orangeCircle()],
          ),
        ).offset(0, 110),

        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 83,
          child: ClipRRect(
            child: GlassContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_button('Пройти тест'), _button('Создать тест')],
              ).offset(0, -30),
            ),
          ),
        ),
      ],
    );
  }

  Widget _orangeCircle() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: accentColor, width: 230),
      ),
    );
  }

  Widget _button(String text) {
    return Container(
      width: 164,
      height: 159,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        // 🌈 Градиентный фон
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 255, 185, 95),
            const Color(0xFF49c33f),
          ],
          stops: [0.05, 0.3],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
        // 🌞 Мягкое оранжевое свечение (не тень!)
        boxShadow: [
          BoxShadow(
            color: primaryColor,
            blurRadius: 0,
            spreadRadius: 0,
            blurStyle: BlurStyle.inner,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent, // прозрачный фон кнопки
          elevation: 0, // убираем стандартную тень
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          padding: EdgeInsets.zero, // убираем внутренние отступы
        ),
        onPressed: () {
          print("sas");
        },
        child: Text(
          text, // или 'Создать тест'
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,

            fontWeight: FontWeight.bold,
            color: Colors.white, // белый текст
          ),
        ),
      ),
    );
  }
}
