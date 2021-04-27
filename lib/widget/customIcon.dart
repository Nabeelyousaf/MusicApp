import 'package:flutter/material.dart';

// Icons is use in Play LIstScreen
// like Fav or play Icon
class CustomIcon extends StatelessWidget {
  IconData iconData;
  CustomIcon({this.iconData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.yellow,
          ),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(
            iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
