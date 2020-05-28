import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uevents/data/data.dart';

class DatabaseService {
  final CollectionReference _eventCollection =
      Firestore.instance.collection('events');

  Future addOrUpdateEvent(Data events) async {
    return await _eventCollection.document(events.uid).setData(events.toMap());
  }

  Stream<List<Data>> getEvents() {
    return _eventCollection.snapshots().map((QuerySnapshot data) =>
        data.documents.map(
            (DocumentSnapshot doc) => Data.fromJson(doc.documentID, doc.data)).toList());
  }
}
