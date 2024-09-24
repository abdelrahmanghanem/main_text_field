import 'package:flutter/material.dart';

OutlineInputBorder getOutlineInputBorder(
    {required Color color, required double radius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      color: color,
      width: 1.2,
    ),
  );
}
