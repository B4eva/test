import 'package:flutter/material.dart';
import 'package:test/views/home_view.dart';

const Color mainThemeColor = Color(0xFF272D8D);

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: mainThemeColor)),
      debugShowCheckedModeBanner: false,
      home: const SplashPage()));
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    });

    return Scaffold(
        body: Stack(children: [
      Container(
          color: mainThemeColor,
          child: const Align(
              alignment: Alignment.center,
              child: Icon(Icons.pool, size: 65, color: Colors.white))),
      Align(
        alignment: Alignment.bottomCenter,
        child: LinearProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.5))),
      )
    ]));
  }
}
