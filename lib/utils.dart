import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  Random random = Random();
  return Color.fromARGB(random.nextInt(100), random.nextInt(256),
      random.nextInt(256), random.nextInt(256));
}
