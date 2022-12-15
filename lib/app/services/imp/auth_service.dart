
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user.dart';
import '../dao/auth_service_dao.dart';


class AuthService extends AuthServiceDAO {
  final _userRef = FirebaseFirestore.instance
      .collection("users")
      .withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromSnapshot(snapshot),
          toFirestore: (user, _) => user.toJson());

  @override
  Future<UserModel> getUserByid({required String userId}) async {
    try {
      var userSnap = await _userRef.doc(userId).get();
      return userSnap.data()!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> createUser({required UserModel userModel}) async {
    await FirebaseFirestore.instance
        .collection("users").add(userModel.toJson());
        
    return userModel;
  }
@override
  Future<List<UserModel>> getAllUsers() async {
    try {
      var usersSnap = await _userRef.get();
      print(usersSnap.docs.map((e) => e.data()).toList());
      return usersSnap.docs.map((e) => e.data()).toList();
    } catch (e) {
      rethrow;
    }
  }
  @override
  Future<UserModel> getLastUser() async {
    var usersSnap =
        await _userRef.orderBy("createdAt", descending: true).limit(1).get();
    UserModel userModel = usersSnap.docs.first.data();
    return userModel;
  }

  @override
  Future<UserModel> updateUser({required UserModel userModel}) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userModel.id)
        .update(userModel.toJson());
    return userModel;
  }
}
