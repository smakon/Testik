import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/design/ui/uiMethods.dart';
import 'package:testik/pages/Home/HomeBody.dart';
import 'package:testik/pages/Home/HomeHeader.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [HomeHeader(), HomeBody()]),
      decoration: (BoxDecoration(color: backgroundColor)),
    );
  }
}
