import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';
import 'package:testik/design/images.dart';
import 'package:testik/design/ui/uiMethods.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83,
      decoration: BoxDecoration(color: darkPrimaryColor),
      padding: EdgeInsets.only(left: 24, right: 24, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Testik',
            style: TextStyle(
              fontSize: fontSize24,
              color: backgroundColor,
              decoration: TextDecoration.none,
            ),
          ),
          profile,
        ],
      ),
    );
  }
}
