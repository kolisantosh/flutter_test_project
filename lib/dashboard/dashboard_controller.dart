import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/storage_utils.dart';
import '../../utils/string_utils.dart';
import '../main.dart';
import '../util/appText.dart';

class DashboardController extends GetxController {

  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isPasswordVisible = true.obs;
  final currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  changePage(index){
    currentIndex.value=index;
  }

}
