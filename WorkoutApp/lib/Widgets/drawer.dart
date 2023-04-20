import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/Constants.dart' show Constants;
import 'package:toast/toast.dart';

//Rohit Singh
class MyDrawer extends StatelessWidget{
  // String email;
  // Future<void> getCurrentUserEmail() async{
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user =auth.currentUser;
  //
  //   if(user !=null){
  //     email = user.email;
  //     prin
  //   }
  //
  //
  // }


  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Drawer(
      child: ListView (
        padding: EdgeInsets.zero,
        children:<Widget> [
          UserAccountsDrawerHeader(
            accountName: Text("Sample"),
            accountEmail: Text("sample@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://as1.ftcdn.net/v2/jpg/05/37/38/08/1000_F_537380820_ul3MaiNgaIfyVhHMLHtUfTcouNTqsRWY.jpg"
              ),
            ),
          ),
          ListTile(
            leading:Icon(Icons.person),
            title:Text("Account"),
            subtitle: Text("Personal"),
            trailing: Icon(Icons.edit),
          ),

          ListTile(
            leading:Icon(Icons.settings),
            title:Text("Logout"),
            subtitle: Text("sign out"),
            onTap: (){

              FirebaseAuth.instance.signOut();
              Toast.show("Login Out", duration: Toast.lengthLong, gravity: Toast.bottom);
              Constants.prefs.setBool("loggedIn", false);
              Navigator.pushReplacementNamed(context,"/loginpage");
            },

          ),

        ],
      ),
    );

  }
  
}