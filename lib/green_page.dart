import 'package:flutter/material.dart';

class GreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.green,
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              "This is a green screen",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
