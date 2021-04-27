import 'package:flutter/material.dart';

import 'CustomCard.dart';
import 'CustomTitleText.dart';

// MUsic LIst in which show All Albums in Screen
// dummy data  from Assets
//
class MusicList extends StatelessWidget {
  final String title;
  MusicList({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitleText(
          title: title,
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomCard(
                height: 100,
                width: 100,
                image: 'assets/9868.jpg',
              ),
              CustomCard(
                height: 100,
                width: 100,
                image: 'assets/1591.jpg',
              ),
              CustomCard(
                height: 100,
                width: 100,
                image: 'assets/9868.jpg',
              ),
              CustomCard(
                height: 100,
                width: 100,
                image: 'assets/1591.jpg',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
