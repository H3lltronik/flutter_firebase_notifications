import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.red,
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              "This is a red screen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
