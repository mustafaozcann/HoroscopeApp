import 'package:app_horoscope/models/onGenerateRoute.dart';
import 'package:app_horoscope/screens/horoscope_list_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(HoroscopeApp());
}

class HoroscopeApp extends StatelessWidget {
  const HoroscopeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HoroscopeListPage(),
      onGenerateRoute: GenerateRoute.createRoute,
    );
  }
}
