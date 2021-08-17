import 'package:cloud_firestore/cloud_firestore.dart';

class SampleModel {
  late String id;
  late String name;

  SampleModel({id: '', name: ''});

  SampleModel.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    print('SampleModel.fromDocumentSnapshot is running. id: ${documentSnapshot.id}, name: ${documentSnapshot['name']}');
    this.id = documentSnapshot.id;
    this.name = documentSnapshot['name'];
    print('${this.id}, ${this.name}');
  }
}
