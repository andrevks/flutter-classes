import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_core/firebase_core.dart";

//FirebaseFirestore -> permite acesso as dados no FIREBASE
//através da obtenção da instância deste.
FirebaseFirestore _firestore = FirebaseFirestore.instance;
//Objeto para obter uma referência da coleção
CollectionReference _reference = _firestore.collection("academic");

class Database {
  static late String userId;
  //método para adicionar dados no Firebase
  static addStudent(
      {required String name,
      required String socialMedia,
      String? sex,
      int? age}) async {
    DocumentReference documentReference =
        _reference.doc(userId).collection('students').doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "socialMedia": socialMedia,
      "sex": sex,
      "age": age,
    };

    await documentReference
        .set(data)
        .whenComplete(() => print("Estudante gravado com sucesso!!!"));
  }

  static Stream<QuerySnapshot> studentsList() {
    CollectionReference studentsCollection =
        _reference.doc(userId).collection('students');
    return studentsCollection.snapshots();
  }

  static Future<FirebaseApp> initializerFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
