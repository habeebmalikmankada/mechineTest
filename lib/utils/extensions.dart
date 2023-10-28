import 'package:flutter/material.dart';

extension ResponsiveDimension on BuildContext{
  double sp(double value) =>  (value / 100) * MediaQuery.of(this).textScaleFactor;
  double w(double value) => MediaQuery.sizeOf(this).width*(value/100);
  double h(double value) => MediaQuery.sizeOf(this).height*(value/100);
}