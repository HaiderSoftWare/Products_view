import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:products_view/controller/login_controller.dart';

import 'package:sizer/sizer.dart';

import '../shared/constant/const.dart';
import '../shared/function/function.dart';
import '../shared/widget/custom_button.dart';
import '../shared/widget/custom_text_feiled.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = Get.put(LoginController());

  GlobalKey<FormState> stateformr = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 6.w, right: 6.w),
        child: SingleChildScrollView(
          child: Form(
            key: stateformr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Lottie.asset(
                    'asset/lottile/login1.json',
                    width: double.infinity,
                    height: 35.h,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: CustomTextStyle(
                          fontsize: 26.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'Username',
                  style: CustomTextStyle(
                    fontsize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: 'admin',
                  controller: controller.userNameControler,
                  obscureText: false,
                  keyborad: TextInputType.name,
                  validatorf: (text) => vinputUsername(text),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Password',
                  style: CustomTextStyle(
                    fontsize: 13.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 1.h),
                TextFromFeiled(
                  hinttext: '***********',
                  controller: controller.passwordControler,
                  obscureText: true,
                  keyborad: TextInputType.visiblePassword,
                  validatorf: (text) => vinputpassword(text),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(fontSize: 11.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Custom_Button(
                  text: 'Login',
                  onpress: () {
                    if (stateformr.currentState!.validate()) {
                      controller.checkUser();
                    }
                  },
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Don’t have an ccount? Sign up',
                        style: TextStyle(fontSize: 11.sp, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
