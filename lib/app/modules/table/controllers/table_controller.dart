import 'package:get/get.dart';
import 'package:presentation/app/model/user.dart';
import 'package:presentation/app/services/imp/auth_service.dart';

class TableController extends GetxController {
  //TODO: Implement TableController
  final userList = <UserModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() async {
    await getUserDetails();
    super.onInit();
  }

  getUserDetails() async {
    userList.value = await AuthService().getAllUsers();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
