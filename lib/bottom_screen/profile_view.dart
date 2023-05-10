import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/ColorConstants.dart';
import '../util/appText.dart';
import '../util/dimensions.dart';
import '../util/styles.dart';
import '../utils/storage_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var name="";
  var email="";

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData(){
    StorageUtil.getData(StorageUtil.keyName).then((value) {
      if (value != null) {
       setState(() {
         name=value;
       });
      }
    });
    StorageUtil.getData(StorageUtil.keyEmail).then((value) {
      if (value != null) {
        setState(() {
          email=value;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                ClipOval(child: FlutterLogo()),
                SizedBox(
                  height: 5,
                ),
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: poppinsSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeOverLarge,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  email,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: poppinsSemiBold.copyWith(
                      fontSize: Dimensions.fontSizeOverLarge,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),

                ElevatedButton(onPressed: (){
                  logout();
                }, child: Text("Logout")),
              ],
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
