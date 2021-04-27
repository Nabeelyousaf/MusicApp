import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'DialogIconData.dart';

class DialogBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DialogIconData(
                              icon: FontAwesomeIcons.play,
                              title: 'Play',
                            ),
                            DialogIconData(
                              icon: Icons.favorite,
                              title: 'Save To Libray',
                            ),
                            DialogIconData(
                              icon: Icons.playlist_add,
                              title: 'Add to PlayList',
                            ),
                            DialogIconData(
                              icon: Icons.queue_play_next,
                              title: 'Play Next',
                            ),
                            DialogIconData(
                              icon: Icons.radio,
                              title: 'Play Radio',
                            ),
                            DialogIconData(
                              icon: Icons.download_outlined,
                              title: 'Download',
                            ),
                            DialogIconData(
                              icon: Icons.share_outlined,
                              title: 'Share',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 60,
                    color: Colors.black,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.5,
              left: MediaQuery.of(context).size.width * 0.23,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: FlutterLogo(),
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Song Name',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
