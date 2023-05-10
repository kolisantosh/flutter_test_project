import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/storage_utils.dart';
import '../../utils/string_utils.dart';
import '../main.dart';
import '../util/appText.dart';

class RegisterController extends GetxController {

  final registerFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final isPasswordVisible = true.obs;
  final isCheckVisible = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    cpasswordController.dispose();
    super.onClose();
  }

  String? nameValidator(String? value) {
    // Add email validation logic here

    if (checkString(value)) {
      return msgNameRequired;
    }
    return null;
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

  String? cpasswordValidator(String? value) {

    // Add password validation logic here
    if (checkString(value)) {
      return msgPWDRequired;
    }
    if (!isSame(passwordController.text,value!)) {
      return msgPWDSameRequired;
    }
    return null;
  }

  Widget isPwdShow(){
    return Icon(isPasswordVisible.value
        ? Icons.remove_red_eye_outlined
        : Icons.visibility_off_outlined);
  }

  void register() {
    if(isCheckVisible.value) {
      if (registerFormKey.currentState!.validate()) {
        openAndCloseLoadingDialog(true);
        StorageUtil.setData(
            StorageUtil.keyName, nameController.value.text.toString().trim());
        StorageUtil.setData(
            StorageUtil.keyEmail, emailController.value.text.toString().trim());
        StorageUtil.setData(StorageUtil.keyPassword,
            passwordController.value.text.toString().trim());
        StorageUtil.setData(StorageUtil.isLogin, true);

        openAndCloseLoadingDialog(false);
        Get.snackbar('Register', 'Register successfully');
        Get.offNamed('/login');
        nameController.clear();
        emailController.clear();
        passwordController.clear();
        cpasswordController.clear();
      }
    }else{
      Get.snackbar('Register', 'Please accept our terms and condition & privacy policy');

    }
  }


}
