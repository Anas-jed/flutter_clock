import 'package:flutter/material.dart';

String twoDigits(int n) => n.toString().padLeft(2, '0');

List<BoxShadow> customBoxShadow() => [
      BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: 0.0,
          blurRadius: 10,
          offset: const Offset(3.0, 3.0)),
      BoxShadow(
          color: Colors.grey.shade400,
          spreadRadius: 0.0,
          blurRadius: 10 / 2.0,
          offset: const Offset(3.0, 3.0)),
      const BoxShadow(
          color: Colors.white,
          spreadRadius: 2.0,
          blurRadius: 10,
          offset: Offset(-3.0, -3.0)),
      const BoxShadow(
          color: Colors.white,
          spreadRadius: 2.0,
          blurRadius: 10,
          offset: Offset(-3.0, -3.0))
    ];
