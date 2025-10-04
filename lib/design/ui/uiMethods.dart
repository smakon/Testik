import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget background(Color color) {
    return DecoratedBox(
      decoration: BoxDecoration(color: color),
      child: this,
    );
  }

  Widget positioned({
    double? left,
    double? right,
    double? top,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  Widget offset(double dx, double dy) =>
      Transform.translate(offset: Offset(dx, dy), child: this);
}
