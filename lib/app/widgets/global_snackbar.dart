import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalPopUp {
  void showErrorSnackBar(String? errortext) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    errortext!,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.abhayaLibre().fontFamily,
                    ),
                    maxLines: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        elevation: 3,
      ),
    );
  }

  void showSuccessSnackBar(String? successmsg) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Text(
                    successmsg.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: GoogleFonts.gafata().fontFamily,
                    ),
                    maxLines: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        elevation: 3,
      ),
    );
  }
}
