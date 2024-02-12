import 'package:flutter/material.dart';
import 'package:flutter_application_1/utilis/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name ="";
  bool change = false;
  final Key = GlobalKey<FormState>();
  moveToHome(BuildContext context)async{
    if (Key.currentState!.validate())  {
  
     setState(() {
                     change =true; 
                    });
                
                    await Future.delayed(Duration(seconds:1));
                  await  Navigator.pushNamed(context, MyRoutes.homeRoute);
                  setState(() {
                     change =false; 
                    });
                  
  }
  }
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
  child:Form(
    key: Key,
    child: Column(
      children: [
       Image.asset("assets/images/login_image.png",
        fit: BoxFit.cover,
        height: 300,
    
       ),
       SizedBox(height: 20.0,
            
            ),
       Text(
        "login $name",
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
              validator:(value)
              {
                if(value!.isEmpty)
                {
                  return "Username cannot be empty";
                }
                return null;
              } ,
              onChanged:(value)
              {
                name =value;
                setState(() {
                  
                });
              } ,
            ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
                validator: (value)
                {
                  if(value!.isEmpty)
                  {
                    return "Password cannot be empty";
                  }
                  else if(value.length<6)
                  {
                    return "Password length should be atleast 6";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
    
            /*  ElevatedButton(onPressed: (){print("hi");
              Navigator.pushNamed(context, MyRoutes.homeRoute);
              }, child: Text("Login"),
             // style: ButtonStyle(
               // foregroundColor: MaterialStateProperty.all(Colors.blue)
               style: TextButton.styleFrom(
                minimumSize: Size(150,40)
                
              ),
              )*/
              Material(
                color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(change ? 20:8),
                child: InkWell(
                  
                  onTap: ()=>moveToHome(context),
                  child:AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: change ? 50 : 150,
                    height: 50,
                    
                  alignment: Alignment.center,
                  
                 
                  child: change ? Icon(
                    Icons.done,
                  color: Colors.white,
                  ) 
                
                  :Text("Login",style:TextStyle(
                    color: Colors.white,
                    fontWeight:FontWeight.bold,
                      fontSize: 20,
                    )
                  ),
                 
                ),
                ),
              ),
            ],),),
            ],
           ),
  ),
     
      ),

    );
  }
} 