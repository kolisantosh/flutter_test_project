import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_project/dashboard/dashboard_binding.dart';
import 'package:flutter_test_project/login/login_view.dart';
import 'package:flutter_test_project/register/register_view.dart';
import 'package:flutter_test_project/util/appText.dart';
import 'package:flutter_test_project/util/constants.dart';
import 'package:flutter_test_project/utils/storage_utils.dart';
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

import 'dashboard/dashboard_view.dart';
import 'login/login_binding.dart';
import 'register/register_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  StorageUtil.createSharedPref();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/register',
          page: () => RegisterPage(),
          binding: RegisterBinding(),
        ),
        GetPage(
          name: '/dashboard',
          page: () => DashboardPage(),
          binding: DashboardBinding(),
        ),
      ],
    );
  }
}

// This isMobile, isTablet, isDesktop help us later
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 1000;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width > 1125;


Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    showSnackBar(msgCheckConnection);
    return false;
  } else {
    return true;
  }
}

DateTime datTime(dtime) {
  // return DateTime.fromMillisecondsSinceEpoch(dtime * 1000);
  return DateTime.fromMillisecondsSinceEpoch(
      int.parse(dtime.toString()) * 1000);
}

void showSnackBar(String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    // maxWidth: size_500,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleText: Container(),
    // borderRadius: size_4,
    backgroundColor: Colors.red,
    colorText: Theme.of(Get.context!).colorScheme.surface,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 2),
    // margin: const EdgeInsets.all(size_10),
    /*mainButton: TextButton(
      child: Text('Undo'),
      onPressed: () {},
    ),*/
  );
}

void showSnackBarSucc(String message) {
  Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.TOP,
    snackStyle: SnackStyle.FLOATING,
    // maxWidth: size_500,
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleText: Container(),
    // borderRadius: size_4,
    backgroundColor: Colors.green,
    colorText: Theme.of(Get.context!).colorScheme.surface,
    isDismissible: false,
    animationDuration: const Duration(milliseconds: 500),
    duration: const Duration(seconds: 2),
    // margin: const EdgeInsets.all(size_10),
    /*mainButton: TextButton(
      child: Text('Undo'),
      onPressed: () {},
    ),*/
  );
}

Future<void> openAndCloseLoadingDialog(bool isShowHide) async {
  if (Get.overlayContext != null) {
    if (isShowHide) {
      showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
          onWillPop: () async => false,
          child: const Center(
            child: const SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );
    } else {
      Navigator.pop(Get.overlayContext!);
    }
  }
}
