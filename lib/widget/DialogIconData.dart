import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Widget is use in Dialog box

class DialogIconData extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function function;
  DialogIconData({
    this.icon,
    this.title,
    this.function,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: GestureDetector(
        onTap: () {
          print('clicked');
          // its use for Functionality
        },
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                icon,
                size: 15,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
