import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addItem(Map<String, dynamic> itemMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Items')
        .doc(id)
        .set(itemMap);
  }

  Future<Stream<QuerySnapshot>> getItem() async {
    return await FirebaseFirestore.instance.collection('Items').snapshots();
  }
}
