import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return   Material(
      color:Colors.white,
      child:SingleChildScrollView(
      //child: Center(
        /*child:Text("Login page",
        style: TextStyle(
          fontSize: 25,
          color: Colors.blue,
          fontWeight: FontWeight.bold
        ),),*/
  child:Column(
    children: [
     Image.asset("assets/images/login_image.png",
      fit: BoxFit.cover,
      height: 300,

     ),
     SizedBox(height: 20.0,
          
          ),
     Text(
      "login",
     style: TextStyle(
      fontSize:25,
       fontWeight: FontWeight.bold ),
      ),
    /*  Text("hello",
      style: TextStyle(
        fontFamily: "Coiny",
        fontWeight: FontWeight.bold
      ),),*/
     SizedBox(height: 20.0,
          
          ), 
          Padding(padding: const EdgeInsets.all(16.0),
          child:Column(children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter User Name",
                labelText: "User Name",
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                labelText: "Password",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            ElevatedButton(onPressed: (){print("hi");
            Navigator.pushNamed(context, MyRoutes.homeRoute);
            }, child: Text("Login"),
           // style: ButtonStyle(
             // foregroundColor: MaterialStateProperty.all(Colors.blue)
             style: TextButton.styleFrom(
              minimumSize: Size(150,40)
              
            ),
            )
            
          ],),),
          ],
         ),
     
      ),

    );
  }
} 