import 'package:flutter/material.dart';

class homepage extends StatelessWidget {
   final  int days =30;
    final String name ="Saumya";
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("TESTING"),
        ),

        body:Center(
        child:Container(
      child:Text("welcome to $days of $name"),
    ),
        ),
      drawer: Drawer(),
      );
  }
}