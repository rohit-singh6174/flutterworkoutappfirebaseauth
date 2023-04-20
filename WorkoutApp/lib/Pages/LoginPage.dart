import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Widgets/BgImage.dart' show BgImage;
import '../utils/Constants.dart' show Constants;
import 'package:toast/toast.dart';



class LoginPage  extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
  final emailController = TextEditingController();
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
                           String email =emailController.text;
                           String pass =passwordController.text;

                           FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass)
                               .then((value){

                             Toast.show("Login Successful", duration: Toast.lengthLong, gravity: Toast.bottom);

                                 Constants.prefs.setBool("loggedIn", true);
                                 Navigator.pushReplacementNamed(context, "/homepage");


                           }).onError((error, stackTrace){
                             Toast.show("Login Failed", duration: Toast.lengthLong, gravity: Toast.bottom);
                             print(error);

                           });



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
                         child:Text("I have don't have an account",
                           style:TextStyle(
                               color:Colors.green,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         onPressed: (){
                           Navigator.pushReplacementNamed(context, "/signuppage");
                         }
                     ),

                     SizedBox(
                       height: 10,
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

       )
     );
  }


}