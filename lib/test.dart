import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  test({Key? key}) : super(key: key);

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  CollectionReference ref = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: ref.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      return Text("${snapshot.data!.docs[i]['email']}");
                    });
              }
              if (snapshot.hasError) {
                return Text("error");
              }
              return Text("lodaing");
            }));
  }
}
