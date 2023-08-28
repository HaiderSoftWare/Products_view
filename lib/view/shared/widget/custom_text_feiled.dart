import 'package:flutter/material.dart';

import '../constant/const.dart';

class TextFromFeiled extends StatelessWidget {
  String? hinttext;
  final controller;
  final validatorf;
  final obscureText;
  int? maxlength;

  TextInputType? keyborad;

  TextFromFeiled(
      {super.key,
      required this.hinttext,
      required this.controller,
      required this.validatorf,
      this.keyborad,
      this.maxlength,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        maxLength: maxlength,
        obscureText: obscureText,
        validator: validatorf,
        textAlign: TextAlign.start,
        controller: controller,
        keyboardType: keyborad,
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.grey),
          hintTextDirection: TextDirection.ltr,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1,
              color: ColorSelect.cgray,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 1,
              color: kPrimaryColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(width: 1, color: kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
