import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/login_page.dart';

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
      darkTheme: ThemeData(
        //useMaterial3: false,
        //  
        brightness: Brightness.dark
      ),
      routes: {
        "/":(context) => Login(),
        "/home":(context) => homepage(),
        
      },
    );
   
  }
  
 
}

