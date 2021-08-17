import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:subero_mobile/controller/guide/guide_controller.dart';

class Guide extends StatelessWidget {
  final GuideController c = Get.find<GuideController>();
  Guide();

  @override
  Widget build(BuildContext context) {
    c.getData(Get.parameters['id'] ?? 'sample1');
    return Scaffold(
      appBar: AppBar(
        title: Text('ガイド'),
      ),
      body: Container(
        child: Obx(() => Column(
              children: [
                Text('ガイド'),
                GetUserName('sample1'),
                AddUser('osato takumi'),
                ElevatedButton(onPressed: () => c.getData('sample1'), child: Text('データを取得')),
                Text(c.obj),
              ],
            )),
      ),
    );
  }
}

// * データの取得
class GetUserName extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = firestore.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).collection('name').doc('dd9xjFFfhsmhGRDgf0EX').get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['name']}");
        }

        return Text("loading");
      },
    );
  }
}

// * データの登録
class AddUser extends StatelessWidget {
  final String fullName;

  AddUser(this.fullName);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'name': fullName, //
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
