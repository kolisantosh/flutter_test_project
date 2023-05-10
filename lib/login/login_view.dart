
import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text('LOGIN')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.loginFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                  controller: controller.emailController,
                  decoration:  InputDecoration(labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),),
                  validator: (value) {
                    return controller.emailValidator(value);
                  }),

              SizedBox(height: 16.0),
              Obx(()=> TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(labelText: 'Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.grey),
                      //<-- SEE HERE
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    suffixIcon: Obx(()=> IconButton(
                      icon: Icon(controller.isPasswordVisible.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.visibility_off_outlined),
                      onPressed: () {
                        controller.isPasswordVisible.value=!controller.isPasswordVisible.value;
                        controller.update();
                      },
                  ),
                    ),),
                  validator: (value) {
                    return controller.passwordValidator(value);
                  },
                  obscureText: controller.isPasswordVisible.value,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      // Implement forgot password logic here
                    },
                    child: Text('Forgot password?'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Login'),
                onPressed: controller.login,
              ),

              SizedBox(height: 16.0),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Or continue with',
                              style: FlutterFlowTheme.bodyText2,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0, 24, 0, 32),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20,
                                      buttonSize: 44,
                                      fillColor: Colors.black,
                                      icon: FaIcon(
                                        FontAwesomeIcons.apple,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () {}, borderWidth: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20,
                                      buttonSize: 44,
                                      fillColor: Color(0xFFF3001C),
                                      icon: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () {}, borderWidth: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20,
                                      buttonSize: 44,
                                      fillColor: Color(0xFF0079F3),
                                      icon: FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () {}, borderWidth: 1,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 40),
                                  child: InkWell(
                                    onTap: () async {

                                      Get.toNamed("/register");
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("Don\'t have an account? "),
                                        Text(
                                          'Sign Up',
                                          style: FlutterFlowTheme.login,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

