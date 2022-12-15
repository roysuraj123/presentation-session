import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/user.dart';
import '../../../services/imp/auth_service.dart';
import '../../../widgets/global_snackbar.dart';

class FormController extends GetxController {
  //TODO: Implement FormController
  final count = 0.obs;
  final registerformkey = GlobalKey<FormState>();
  final isLoading = false.obs;

  //controllers
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();

  final TextEditingController phone = TextEditingController();

  final TextEditingController userClass = TextEditingController();
  final TextEditingController school = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  saveUser() async {
    if (registerformkey.currentState!.validate()) {
      try {
        isLoading.value = true;
        final userModel = UserModel();
        userModel.name = name.text;
        userModel.phone = phone.text;
        userModel.email = email.text;

        userModel.createdAt = DateTime.now();

        await AuthService().createUser(userModel: userModel);

        isLoading.value = false;
        GlobalPopUp()
            .showSuccessSnackBar("Student Profile created successfully");
      } catch (e) {
        isLoading.value = false;
        GlobalPopUp().showErrorSnackBar(e.toString());
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
