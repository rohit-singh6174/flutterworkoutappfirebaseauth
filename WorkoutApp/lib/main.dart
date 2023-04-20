import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:workoutapp/Pages/HomePage.dart';
import 'package:workoutapp/Pages/SignupPage.dart';
import 'package:workoutapp/Pages/admin.dart';
import './Pages/LoginPage.dart' show LoginPage;
import './utils/Constants.dart' show Constants;
import './Pages/admin.dart' show AdminLogin;
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import './Pages/Homelist.dart' show HomeList;
import './Pages/WorkoutDetail.dart' show WorkoutDetail;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs =await SharedPreferences.getInstance();

  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.green),
    home:Constants.prefs.getBool("loggedIn")==true?HomePage():LoginPage(),
    routes: {
      "/signuppage":(context)=>SignupPage(),
     "/loginpage":(context)=>LoginPage(),
      "/homepage":(context)=>HomeList(),
      "/admin":(context)=>AdminLogin(),
      WorkoutDetail.routeName:(context)=>WorkoutDetail(),
    },
  ));
}

