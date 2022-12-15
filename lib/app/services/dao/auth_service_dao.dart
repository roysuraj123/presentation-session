

import '../../model/user.dart';

abstract class AuthServiceDAO {
  Future<UserModel> getUserByid({required String userId});
  Future<UserModel> createUser({required UserModel userModel});
  Future<UserModel> updateUser({required UserModel userModel});
  Future<UserModel> getLastUser();
  Future<List<UserModel>> getAllUsers();
}
