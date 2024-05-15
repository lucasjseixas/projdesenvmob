import 'package:cloud_firestore/cloud_firestore.dart';

class DBMethods {
  Future addUser(Map<String, dynamic> userMap) async {
    return await FirebaseFirestore.instance
        .collection("Candidatos")
        .doc()
        .set(userMap);
  }

  Future<QuerySnapshot> getUserInfo(String name) async {
    return await FirebaseFirestore.instance
        .collection("Candidatos")
        .where("Nome", isEqualTo: name)
        .get();
  }
}

// Funciona, porém foi feita uma nova implementação dentro da aplicação