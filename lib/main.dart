import 'package:flutter/material.dart';
import 'package:test_swift/pages/list/show_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODOLIST',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen
      ),
      home: const Show_List(),
    );
  }
}

