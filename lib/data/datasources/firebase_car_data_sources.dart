import 'package:car_rental/data/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDataSources {
  final FirebaseFirestore firestore;

  FirebaseCarDataSources({required this.firestore});

  Future<List<CarModel>> getCars() async {
    var snapShot = await firestore.collection('cars').get();
    return snapShot.docs.map((doc) => CarModel.fromMap(doc.data())).toList();
  }
}