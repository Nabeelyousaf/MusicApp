import 'package:flutter/material.dart';
import 'package:musicapp/Model/MusicName.dart';

class ScrollList extends StatefulWidget {
  @override
  _ScrollListState createState() => _ScrollListState();
}

class _ScrollListState extends State<ScrollList> {
  int currentIndex = 0;
  PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MusicModel musicModel = MusicModel();
    MusicCollection musicCollection = MusicCollection();
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: musicCollection.playList.length,
                // itemCount: ,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Container(
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          musicCollection.playList[i].songImage,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
