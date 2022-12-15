import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(ignore: true)
  String? id;
  String? name;

  String? email;

  String? phone;

  DateTime? updatedAt;
  DateTime? createdAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.updatedAt,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final userModel =
        UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    userModel.id = snapshot.reference.id;
    return userModel;
  }
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
