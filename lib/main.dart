import 'package:flutter/material.dart';
import 'package:vigimafra/views/home.dart';
import 'package:vigimafra/routes.dart';


void main() => runApp(MaterialApp(
  title: "Vigimafra",
  home: Home(),
  initialRoute: "/",
  onGenerateRoute: Routes.generateRoute,
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vigimafra',
    );
  }
}