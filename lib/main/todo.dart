import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.documentReference = doc.reference;
    this.title = doc.data()['title'];

    final Timestamp timeStamp = doc.data()['createdAt'];
    this.createdAt = timeStamp.toDate();
  }

  String title;
  DateTime createdAt;
  bool isDone = false;
  DocumentReference documentReference;
}
