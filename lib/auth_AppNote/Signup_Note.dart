// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Signup_Note extends StatefulWidget {
  const Signup_Note({Key? key}) : super(key: key);

  @override
  State<Signup_Note> createState() => _Signup_NoteState();
}

// ignore: camel_case_types
class _Signup_NoteState extends State<Signup_Note> {
  var myusername, mymeail, mypassowrd;
  // ignore: non_constant_identifier_names
  GlobalKey<FormState> FormS = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  SignUp() async {
    var formdata = FormS.currentState;

    if (formdata!.validate()) {
      formdata.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: mymeail, password: mypassowrd);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
                  context: context,
                  title: "error",
                  body: const Text('The password provided is too weak.'))
              .show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
                  context: context,
                  title: "error",
                  body:
                      const Text('The account already exists for that email.'))
              .show();
        }
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Image.asset(
          "images/note.jpg",
          width: 200,
          height: 250,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: FormS,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    onSaved: (vali) {
                      myusername = vali;
                    },
                    validator: (vali) {
                      if (vali!.length > 100) {
                        return "can't to be username than bigger 100 letters";
                      }
                      if (vali.length < 3) {
                        return "can't to be username than less 3 letters";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.near_me),
                      hintText: "UserName ",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (vali) {
                      mymeail = vali;
                    },
                    validator: (vali) {
                      if (vali!.length > 100) {
                        return "can't to be email than bigger 100 letters";
                      }
                      if (vali.length < 3) {
                        return "can't to be email than less 3 letters";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      hintText: " Email",
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 2)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (vali) {
                      mypassowrd = vali;
                    },
                    validator: (vali) {
                      if (vali!.length > 100) {
                        return "can't to be password than bigger 100 letters";
                      }
                      if (vali.length < 5) {
                        return "can't to be passowrd than less 5 letters";
                      } else {
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "PassWord",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 2))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Text(
                          "if you have account",
                          style: TextStyle(fontSize: 17),
                        ),
                        InkWell(
                          child: const Text(
                            "click here",
                            style: TextStyle(fontSize: 17, color: Colors.blue),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed("Login_Note");
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: 100,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        var res = await SignUp();

                        // ignore: unnecessary_null_comparison
                        if (res != null) {
                          Navigator.of(context)
                              .pushReplacementNamed("HomePage");
                        }
                      },
                      child: const Text(
                        "Signup",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ],
    ));
  }
}
