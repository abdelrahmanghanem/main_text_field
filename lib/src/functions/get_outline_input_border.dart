import 'package:flutter/material.dart';

OutlineInputBorder getOutlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color,
      width: 1.2,
    ),
  );
}
