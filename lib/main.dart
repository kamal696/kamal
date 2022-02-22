import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newb/AddNOTE/addnotes.dart';
import 'package:newb/Home_Note/HomePage.dart';
import 'package:newb/auth_AppNote/Login_Note.dart';
import 'package:newb/auth_AppNote/Signup_Note.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:newb/test.dart';

// ignore: prefer_typing_uninitialized_variables
var islogin;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: test(),
      // islogin == false ? const Login_Note() : const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          primary: Colors.blue,
        )),
      ),
      routes: {
        "Login_Note": (context) => const Login_Note(),
        "Signup_Note": (context) => const Signup_Note(),
        "HomePage": (context) => const HomePage(),
        "AddNote": (context) => const AddNotes()
      },
    );
  }
}
