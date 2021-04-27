import 'package:flutter/material.dart';

// this Widget is use in PlayListScreen
// and Title of the Album
class CustomTitleText extends StatelessWidget {
  final String title;
  CustomTitleText({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
