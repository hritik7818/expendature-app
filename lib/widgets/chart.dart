// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 96, 202, 255),
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 40,
        child: Text(
          "expenses chart",
        ),
      ),
    );
  }
}
