import 'package:flutter/material.dart';
import 'package:test/views/home_view.dart';

import 'views/splash_view.dart';

const Color mainThemeColor = Color(0xFF272D8D);

void main() {
  runApp(MaterialApp(
      theme: ThemeData(appBarTheme: const AppBarTheme(color: mainThemeColor)),
      debugShowCheckedModeBanner: false,
      home: const SplashPage()));
}
