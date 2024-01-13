import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? ssn; // rakam hawya
  final String name;
  final String password;

  final String phone;

  final String role; // el sala7ya
  // elmarkz
  final String roleName;
  final String imagesignature;
  UserModel(
      {required this.password,
      required this.ssn,
      required this.phone,
      required this.role,
      required this.name,
      required this.roleName,
      required this.imagesignature});
  toJson() {
    return {
      "phone": phone,
      "ssn": ssn,
      "role": role,
      "password": password,
      "name": name,
      "roleName": roleName,
      "imagesignature": imagesignature
    };
  }

  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      ssn: data['ssn'],
      phone: data["phone"],
      role: data["role"],
      password: data["password"],
      name: data["name"],
      roleName: data["roleName"],
      imagesignature: data["imagesignature"],
    );
  }
}
