import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DocumentReference usero = FirebaseFirestore.instance
      .collection("users")
      .doc("AJhgdohww4zHbDJ9UtgH");
  DocumentReference usert = FirebaseFirestore.instance
      .collection("users")
      .doc("sGDXVwuxJNgxjPLxuZ72");
  batch() async {
    WriteBatch batch = await FirebaseFirestore.instance.batch();

    batch.delete(usert);
    batch.update(usero, {"phone": 09214635});
    batch.commit();
  }

  @override
  void initState() {
    super.initState();
    batch();
  }

  List notes = [
    {"note": "I always wake up 6 oclock", "image": "2.jpg"},
    {"note": "I always wake up 5 oclock", "image": "2.jpg"},
    {"note": "I always wake up 4 oclock", "image": "2.jpg"},
    {"note": "I always wake up 3 oclock", "image": "2.jpg"}
  ];

  getuser() {
    // ignore: unused_local_variable
    var user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacementNamed("Login_Note");
              },
              icon: const Icon(Icons.exit_to_app))
        ],
        title: const Text('HomePage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("AddNote");
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, i) {
            return Dismissible(
                key: Key("$i"),
                child: listnotes(
                  nt: notes[i],
                ));
          }),
    );
  }
}

// ignore: camel_case_types
class listnotes extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final nt;
  // ignore: use_key_in_widget_constructors
  const listnotes({this.nt});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Expanded(
            flex: 1,
            child: Image.asset(
              "images/2.jpg",
              fit: BoxFit.fill,
              height: 100,
            )),
        Expanded(
          flex: 2,
          child: ListTile(
              subtitle: Text("${nt['note']}"),
              title: const Text("Title"),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              )),
        ),
      ],
    ));
  }
}
