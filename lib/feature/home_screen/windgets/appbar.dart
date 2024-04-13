import 'package:flutter/material.dart';

AppBar appbar(String title1, String title2) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        Text(
          title2,
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ],
    ),
  );
}
