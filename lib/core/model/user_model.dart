import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String uid;
  final String email;
  final String fullName;
  final String number;
  final String password;
  const UserModel (
      {
        required this.uid,
        required this.email,
        required this.fullName,
        required this.number,
        required this.password,
      });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) =>
      UserModel(
        uid: json['uid'],
        email: json['email'],
        fullName: json['fullName'],
        number: json['number'],
        password: json['password'],
      );
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['email'] = email;
    data['fullName'] = fullName;
    data['number'] = number;
    data['password'] = password;
    return data;
  }
}
