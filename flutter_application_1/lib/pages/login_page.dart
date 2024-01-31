import 'package:flutter/material.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Material(
      child: Center(
        child: Text("Login page",
        style: TextStyle(
          fontSize: 25,
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}