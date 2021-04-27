import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CustomTitleText.dart';
import 'customIcon.dart';
// this Widget is use in PlaylistScreen
// and its use Album Title Exp Sad Song ....
// and Description of the Album

class CustomPlaylistHeader extends StatelessWidget {
  String title;
  CustomPlaylistHeader({
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.pinkAccent,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.playCircle,
                    color: Colors.pinkAccent,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              CustomTitleText(
                title: title,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomIcon(
                    iconData: Icons.file_download,
                  ),
                  CustomIcon(iconData: Icons.upload_outlined),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
