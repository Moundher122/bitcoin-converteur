// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/data.dart';
import 'package:provider/provider.dart';

import 'homepage.dart';
void main() {
  runApp(MultiProvider(providers: [ChangeNotifierProvider(create:(context) => isdark(),),ChangeNotifierProvider(create:(context) => money(new3: 'USD'),)],child: (myapp())));
}
class myapp extends StatelessWidget {
  const myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<isdark>().isdarckthem?darktheme:lighttheme,
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
final ThemeData lighttheme=ThemeData(
backgroundColor: Color.fromARGB(255, 49, 54, 63),
primaryColor: Color.fromARGB(255, 118, 171, 174),
textTheme: TextTheme(bodyText1: TextStyle(color: Color.fromARGB(255, 238, 238, 238))),
);
final ThemeData darktheme=ThemeData(
backgroundColor: Color.fromARGB(255, 13, 30, 62),
primaryColor: Color.fromARGB(255, 118, 171, 174),
textTheme: TextTheme(bodyText1: TextStyle(color: Color.fromARGB(255, 238, 238, 238))),
);