import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';
import 'package:flutter_application_1/utilis/routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    
    
    
    return MaterialApp(
    
      themeMode: ThemeMode.light,
      theme: ThemeData(
        //useMaterial3: false,
        //  
     //  fontFamily: GoogleFonts.lato().fontFamily,
        primarySwatch: Colors.amber,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        brightness: Brightness.light
      ),
     
      routes: {
        "/":(context) => Login(),
        MyRoutes.homeRoute:(context) => homepage(),
        MyRoutes.loginRoute:(context) => Login(),
        
      },
    );
   
  }
  
}

