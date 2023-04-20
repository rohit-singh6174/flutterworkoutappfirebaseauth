import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Widgets/BgImage.dart' show BgImage;
import '../utils/Constants.dart' show Constants;
import 'package:toast/toast.dart';


class AdminLogin extends StatefulWidget{
  @override
    State<StatefulWidget> createState()=> _AdminLogin();

}
class _AdminLogin extends State{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit:StackFit.expand,
          children: <Widget>[
            BgImage(),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child:Card(
                    child: Column(
                      children: <Widget>[
                        Form(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: <Widget>[
                                    Image.asset("assets/logo2.png",width: 150,height: 100),
                                    SizedBox(
                                      height: 30,
                                    ),

                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: "Enter Email",
                                        labelText:"Email",
                                        prefixIcon: Icon(Icons.mail,color: Colors.black,),
                                      ),
                                      controller: emailController,
                                    ),

                                    SizedBox(
                                      height: 20,
                                    ),

                                    TextFormField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Enter Password",
                                        labelText: "Password",
                                        prefixIcon: Icon(Icons.lock,color: Colors.black,),
                                      ),
                                      controller: passwordController,
                                    ),

                                  ],
                                ),
                              ),
                            )),

                        SizedBox(
                          height: 20,
                        ),

                        ElevatedButton(
                          onPressed: () {
                            String email=  emailController.text;
                            String pass= passwordController.text;

                            if(email=="rohit224455@gmail.com"){
                              if(pass=="123456"){
                                Toast.show("Welcome Admin", duration: Toast.lengthLong, gravity: Toast.bottom);
                              }
                              else{
                                Toast.show("Invalid Password", duration: Toast.lengthLong, gravity: Toast.bottom);
                              }

                            }
                            else{
                              Toast.show("Login Failed", duration: Toast.lengthLong, gravity: Toast.bottom);
                            }

                          },

                          child: Text("Admin Sign in"),
                          style:ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        TextButton(
                            child:Text("I have an account",
                              style:TextStyle(
                                  color:Colors.green,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, "/loginpage");
                            }
                        ),

                        SizedBox(
                          height: 20,
                        ),


                      ],
                    ),
                  ),
                ),
              ),
            )
          ]

      ),

    );
  }
  
}