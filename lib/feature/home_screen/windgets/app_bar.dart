import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title1;
  final String title2;
  const CustomAppbar({super.key, required this.title1, required this.title2});

  @override
  Size get preferredSize => Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
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
}
