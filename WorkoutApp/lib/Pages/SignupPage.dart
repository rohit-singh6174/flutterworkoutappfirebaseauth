
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/Constants.dart';
import '../Widgets/BgImage.dart' show BgImage;
import 'package:toast/toast.dart';


class SignupPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _SignupPage();
}

class _SignupPage extends State {
  final userNameController = TextEditingController();
  final emailController= TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    ToastContext().init(context);
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
                                       hintText: "Enter Username",
                                       labelText:"Username",
                                       prefixIcon: Icon(Icons.account_circle,color: Colors.black,),
                                     ),
                                     controller: userNameController,
                                   ),

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

                           FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password:pass)
                               .then((value) {

                             Toast.show("Registration Successfuly", duration: Toast.lengthLong, gravity: Toast.bottom);

                             Navigator.pushReplacementNamed(context, "/loginpage");

                           }).onError((error, stackTrace){

                             Toast.show("Registration Failed", duration: Toast.lengthLong, gravity: Toast.bottom);
                             print(error);

                           });

                           // Navigator.push(
                           //     context, MaterialPageRoute(
                           //     builder: (context)=>HomePage()
                           // ));



                           // showDialog(
                           //     context: context,
                           //     builder: ( BuildContext context){
                           //       return AlertDialog(
                           //         title: Text("Welcome"),
                           //         content: Text(userNameController.text),
                           //       );
                           //     }
                           // );

                           // Constants.prefs.setBool("loggedIn", true);
                           // Navigator.pushReplacementNamed(context, "/homepage");
                         },

                         child: Text("Sign in"),
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