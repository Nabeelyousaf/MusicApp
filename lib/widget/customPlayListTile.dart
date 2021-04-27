import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/Model/MusicName.dart';
import 'package:musicapp/Screens/PlayerScreen.dart';

import 'CustomDialog.dart';
import 'DialogIconData.dart';

// this widget is use for Album List Tile ..... for this widget we provide imag,music url,title,
class CustomPlayListTile extends StatelessWidget {
  String image;
  String musicUrl;
  String title;
  Function function;
  CustomPlayListTile({this.image, this.musicUrl, this.title, this.function});
  MusicCollection musicCollection = MusicCollection();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlayerScreen(
              songTitle: title,
              musicUrl: musicUrl,
              image: image,
            ),
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // dummy Song name from MusicCollection Model
                        musicCollection.getSongName(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        // Dummy Song descripiton From MusicCollection model
                        musicCollection.getSongDescription(),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    // this button is use for download Song Form Album
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: function,
                      // this Icon Button is use for more in which new Screen open and more..
                      icon: Icon(
                        Icons.more_vert_outlined,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
