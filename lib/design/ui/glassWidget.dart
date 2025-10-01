import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:testik/design/colors.dart';
import 'package:testik/design/dimensions.dart';

class GlassContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;

  const GlassContainer({
    Key? key,
    required this.child,
    this.width = 360,
    this.height = 366,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(

      filter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.03),
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
        child: child,
      ),
    );
  }
}
