import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:products_view/binding/binding.dart';
import 'package:sizer/sizer.dart';

import 'view/screen/login_screen.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    // Sizer For Responsive
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          // Binding
          initialBinding: MyBinding(),
          debugShowCheckedModeBanner: false,
          //Main Page
          home: LoginScreen(),
        );
      },
    );
  }
}
