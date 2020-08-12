import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(251, 86, 7, 1),
      body: Center(
        child: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
