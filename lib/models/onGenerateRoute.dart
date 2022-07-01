import 'package:app_horoscope/models/horoscope.dart';
import 'package:app_horoscope/screens/horoscope_detail_page.dart';
import 'package:flutter/material.dart';

class GenerateRoute {
  static Route<dynamic>? createRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/horoscopeDetailPage":
        return MaterialPageRoute(
            builder: ((context) => HoroscopeDetail(selectedHoroscope: settings.arguments as Horoscope,)),
             settings: settings);

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text("Error"),
              backgroundColor: Colors.redAccent,
            ),
            body: Center(child: Text("ERROR 404 NOT FOUND")),
          ),
        );
    }
  }
}
