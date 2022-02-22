// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Login_Note extends StatefulWidget {
  const Login_Note({Key? key}) : super(key: key);

  @override
  State<Login_Note> createState() => _Login_NoteState();
}

// ignore: camel_case_types
class _Login_NoteState extends State<Login_Note> {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: myemail, password: mypassword);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
                  context: context,
                  title: "ERORR",
                  body: const Text('No user found for that email.'))
              .show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
                  context: context,
                  title: "ERORR",
                  body: const Text('Wrong password provided for that user.'))
              .show();
        }
      }
    }
  }

  var myemail, mypassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 180,
          width: 230,
          child: Image.asset(
            "images/note.jpg",
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: formstate,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onSaved: (val) {
                      myemail = val;
                    },
                    validator: (val) {
                      // ignore: prefer_is_empty
                      if (val!.length < 2) {
                        return "Email incorrect";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: "Email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      mypassword = val;
                    },
                    validator: (val) {
                      // ignore: prefer_is_empty
                      if (val!.length < 2) {
                        return "Passowrd incorrect";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "PassWord",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2))),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Text(
                          "if you haven't account",
                          style: TextStyle(fontSize: 17),
                        ),
                        InkWell(
                          child: const Text(
                            "click here",
                            style: TextStyle(fontSize: 17, color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed("Signup_Note");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        var log = await login();
                        if (log != null) {
                          Navigator.of(context)
                              .pushReplacementNamed("HomePage");
                        }
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      // style: ElevatedButton.styleFrom(
                      //     primary: Colors.blue, onPrimary: Colors.purple)
                    ),
                  ),
                ],
              )),
        ),
      ],
    ));
  }
}
