import 'package:flutter/material.dart';

OutlineInputBorder InputFieldBorder() {
  //return type is OutlineInputBorder
  return OutlineInputBorder(
      //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.transparent));
}

OutlineInputBorder MyFocusBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.greenAccent,
        width: 3,
      ));
}
