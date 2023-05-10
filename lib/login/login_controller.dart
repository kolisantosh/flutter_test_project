import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/storage_utils.dart';
import '../../utils/string_utils.dart';
import '../main.dart';
import '../util/appText.dart';

class LoginController extends GetxController {

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = true.obs;
  @override
  void onInit() {

    StorageUtil.getData(StorageUtil.isLogin).then((value) {
      if (value != null) {
        if(value){
          Get.offAll("/dashboard");
        }
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? emailValidator(String? value) {
    // Add email validation logic here

    if (checkString(value)) {
      return msgEmailRequired;
    }
    if (isEmail(value!)) {
      return msgEmailNotValid;
    }
    return null;
  }
  String? passwordValidator(String? value) {

    // Add password validation logic here
    if (checkString(value)) {
      return msgPWDRequired;
    }
    if (value!.length < 6) {
      return msgPWDLenRequired;
    }
    if (isPasswordStonge(value)) {
      return msgPWDStrongeRequired;
    }
    return null;
  }

  Widget isPwdShow(){
    return Icon(isPasswordVisible.value
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined);
  }

  void login() {
    if (loginFormKey.currentState!.validate()) {
      openAndCloseLoadingDialog(true);
      checkUser(emailController.text, passwordController.text).then((auth) {
        openAndCloseLoadingDialog(false);

        if (auth) {
          Get.snackbar('Login', 'Login successfully');
          Get.offAllNamed('/dashboard');
        } else {
          Get.snackbar('Login', 'Invalid email or password');
        }
        emailController.clear();
        passwordController.clear();
      });
    }
  }

  Future<bool> checkUser(String userEmail, String userPassword) async {
    var email = await StorageUtil.getData(StorageUtil.keyEmail);
    var password = await StorageUtil.getData(StorageUtil.keyPassword);

    if (userEmail == email && userPassword == password) {
      return Future.value(true);
    }
    return Future.value(false);
  }


}
