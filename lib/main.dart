// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ex1/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 2',
      theme: ThemeData
      (
        primarySwatch: Colors.pink
      ),
      home: MyHomePage(
        title: 'Flutter Excercise'
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        style: TextButton.styleFrom
        (
          shape: RoundedRectangleBorder
          (
            borderRadius: BorderRadius.circular(5)
            ),
          primary: Colors.white,
          backgroundColor: Colors.pinkAccent,
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: TextStyle(
            fontSize: 180,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
