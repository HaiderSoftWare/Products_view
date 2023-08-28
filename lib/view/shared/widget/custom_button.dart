import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant/const.dart';

class Custom_Button extends StatelessWidget {
  String text;
  final onpress;
  Custom_Button({Key? key, required this.text, required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.5.h,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            kPrimaryColor,
          ),
        ),
        onPressed: onpress,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
