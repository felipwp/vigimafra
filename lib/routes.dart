import 'package:flutter/material.dart';
import 'package:vigimafra/views/home.dart';
import 'package:vigimafra/views/dashboard.dart';
import 'package:vigimafra/views/quiz.dart';
import 'package:vigimafra/views/tos.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case "/":
        return MaterialPageRoute(
          builder: (_) => Home()
        );
      case "/dashboard":
        return MaterialPageRoute(
          builder: (_) => Dashboard()
        );
      case "/quiz":
        return MaterialPageRoute(
          builder: (_) => Quiz()
        );
      case "/tos":
        return MaterialPageRoute(
          builder: (_) => Tos()
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Home()
        );
    }
  }
}