import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return   Material(
      color:Colors.white,
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
     ),
     SizedBox(height: 20.0,
          
          ),
     Text(
      "login",
     style: TextStyle(
      fontSize:22,
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

            ElevatedButton(onPressed: (){print("hi");}, child: Text("Login"),
           // style: ButtonStyle(
             // foregroundColor: MaterialStateProperty.all(Colors.blue)
             style: TextButton.styleFrom(
              
            ),
            )
          ],),),
          ],
         
     
      ),

    );
  }
} 