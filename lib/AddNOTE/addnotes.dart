import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
              TextFormField(
                minLines: 1,
                maxLines: 2,
                maxLength: 60,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Title Note",
                    labelStyle: TextStyle(color: Colors.blue),
                    prefixIcon: Icon(
                      Icons.note,
                      color: Colors.blue,
                    )),
              ),
              TextFormField(
                minLines: 1,
                maxLines: 10,
                maxLength: 500,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Add Note",
                    labelStyle: TextStyle(color: Colors.blue),
                    prefixIcon: Icon(
                      Icons.note,
                      color: Colors.blue,
                    )),
              )
            ],
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        showbuttonsheet();
                      },
                      child: const Text("Add Image"))),
              SizedBox(
                  width: 100,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Add Note")))
            ],
          )
        ],
      ),
    );
  }

  showbuttonsheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.all(15),
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "* Please Choose Image *",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 30, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                      Text("Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.photo_album_outlined,
                              color: Colors.blue[900],
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue, width: 2)),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.blue[900],
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
