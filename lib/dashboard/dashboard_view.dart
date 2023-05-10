
import 'package:flutter/material.dart';
import 'package:flutter_test_project/dashboard/dashboard_controller.dart';
import 'package:get/get.dart';

import '../bottom_screen/home_view.dart';
import '../bottom_screen/profile_view.dart';
import '../util/ColorConstants.dart';
import '../util/appText.dart';
import '../util/dimensions.dart';
import '../util/styles.dart';
import '../utils/storage_utils.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard"),
        actions: [
          IconButton(onPressed: (){
            logout();
          }, icon: Icon(Icons.logout))
        ],
      ),
      body:Obx(()=>IndexedStack(
          index: controller.currentIndex.value,
          children: [
            HomePage(),
            Container(child: Center(child: Text("Order")),),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.reorder),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
    );
  }

  logout() {
    Get.defaultDialog(
        backgroundColor: Color(0xFFFC7DFCA),
        title: "",
        middleText: "",
        content: Container(
          padding: EdgeInsets.only(left: 20),
          height: 180,
          width: Get.size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    logout1,
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.fontSizeSmall, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: Get.size.height / 30,
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    msgAreYouSureLMessage,
                    style: poppinsRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: Get.size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Text(
                        cancel,
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      StorageUtil.setData(StorageUtil.isLogin, false);

                      Get.back();
                      Get.offAllNamed("/login");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorConstants.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Text(
                        "logout",
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeSmall,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

}

