import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../widgets/app_text_field.dart';
import '../controllers/form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var w = constraints.maxWidth;
      return Scaffold(
        appBar: AppBar(
          
          centerTitle: true,
          title: const Text(
            "Sign Up",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: controller.registerformkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                        color: Color(0xff208599),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Divider(),
                    inputfield(
                      w: w,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Full Name is required";
                        }
                        return null;
                      },
                      inputfield: "Full Name",
                      hintText: 'Please Enter Your Full Name',
                      controller: controller.name,
                      textInputType: TextInputType.name,
                    ),
                    inputfield(
                      w: w,
                      inputfield: "Email",
                      hintText: 'Please Enter Your Email',
                      controller: controller.email,
                      inp: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r"\s"),
                        )
                      ],
                      validator: (value) {
                        String pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regExp = RegExp(pattern);
                        if (value!.trim().isEmpty) {
                          return "Email is Required";
                        } else if (!regExp.hasMatch(value.trim())) {
                          return "Invalid Email";
                        }

                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    inputfield(
                      w: w,
                      inputfield: " Phone (Same as Whatsapp)",
                      hintText: "Enter 10 digit phone number",
                      validator: (value) {
                        String patttern = r'(^[0-9]*$)';
                        RegExp regExp = RegExp(patttern);
                        if (value!.trim().isEmpty) {
                          return "Parent\'s Phone Number is Required";
                        } else if (value.trim().length != 10) {
                          return "Mobile number must be of 10 digits";
                        } else if (!regExp.hasMatch(value.trim())) {
                          return "Mobile Number must be digits";
                        }
                        return null;
                      },
                      controller: controller.phone,
                      textInputType: TextInputType.phone,
                    ),
                    Obx(() => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: InkWell(
                            onTap: () async {
                              await controller.saveUser();
                            },
                            child: Container(
                              width: w,
                              height: 45,
                              decoration: BoxDecoration(
                                color: const Color(0xff208599),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: controller.isLoading.value
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white),
                                      )
                                    : const Text(
                                        "Sign Up",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget inputfield(
      {required double w,
      required String inputfield,
      required String hintText,
      required String? Function(String?)? validator,
      List<TextInputFormatter>? inp,
      required TextEditingController controller,
      required TextInputType textInputType,
      bool? enabled}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            inputfield,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.8,
            ),
          ),
          InputText(
            controller: controller,
            hintText: hintText,
            validator: validator,
            inp: inp ?? [],
            textInputType: textInputType,
            enabled: enabled ?? true,
            w: w,
          ),
        ],
      ),
    );
  }
}
