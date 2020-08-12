import 'package:flutter/material.dart';

class PaymentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(131, 56, 236, 1),
      body: Center(
        child: Text(
          'Payments',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
