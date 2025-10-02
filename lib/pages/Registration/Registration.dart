import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';
import 'package:testik/pages/Registration/RegistrationBody.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Testик',
          style: TextStyle(fontSize: fontSize36, color: textColor),
        ),
        backgroundColor: backgroundColor,
        elevation: elevationNone,
        centerTitle: true,
      ),
      body: RegistrationBody(),
      backgroundColor: backgroundColor,
    );
  }
}
