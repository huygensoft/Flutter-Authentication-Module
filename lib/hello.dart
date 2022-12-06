// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HelloPage extends StatefulWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  State<HelloPage> createState() => _HelloPageState();
}

class _HelloPageState extends State<HelloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(child: Text('Hello World',
      style: TextStyle(
        color: Color(0xFFF00002),
        fontSize: 40,
        fontFamily: 'Nunito',
      ),
      )),
    );
  }
}