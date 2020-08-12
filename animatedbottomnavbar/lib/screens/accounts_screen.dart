import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 0, 110, 1),
      body: Center(
        child: Text(
          'Accounts',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
