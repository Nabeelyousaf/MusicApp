import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/Model/MusicName.dart';
import 'package:musicapp/widget/BottomNavBar.dart';
import 'package:musicapp/widget/CustomTitleText.dart';

class PlayerScreen extends StatefulWidget {
  String musicUrl;
  String image;
  String songTitle;
  PlayerScreen({
    this.image,
    this.musicUrl,
    this.songTitle,
  });
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  String currentTime = "00:00";
  String completeTime = "00:00";
  AudioPlayer audioPlayer = AudioPlayer();
  double _value = 0;
  Duration duration = new Duration();
  Duration position = new Duration();
  bool playing = false;
  int currentIndex = 0;
  PageController _controller;

  @override
  void initState() {
    playing = true;
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 0);

    audioPlayer.onAudioPositionChanged.listen((Duration duration) {
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });
    audioPlayer.onDurationChanged.listen((Duration duration) {
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });
    audioPlayer.onDurationChanged.listen((d) {
      setState(() {
        duration = d;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((p) {
      setState(() {
        position = p;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    playing = false;
    super.dispose();
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);

    audioPlayer.seek(newDuration);
  }

  void getAudio(String url) async {
    // String url = widget.musicUrl;
    // print(widget.musicUrl);
    if (playing) {
      var res = await audioPlayer.pause();
      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      var res = await audioPlayer.play(
        url,
        isLocal: true,
      );
      if (res == 1) {
        setState(() {
          playing = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MusicCollection musicCollection = MusicCollection();
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(
      //   iconList: [
      //     Icons.home,
      //     Icons.card_giftcard,
      //     Icons.camera,
      //     Icons.pie_chart,
      //     Icons.person,
      //   ],
      //   onChange: (int) {},
      // ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert_sharp,
            ),
          ),
        ],
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.times),
          onPressed: () {},
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: musicCollection.playList.length,
              onPageChanged: (int index) {
                setState(() {
                  playing = false;
                  currentIndex = index;
                  getAudio(
                    musicCollection.playList[currentIndex].musicPath,
                  );
                });
              },
              // itemCount: ,

              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                offset: Offset(0, 1)),
                          ],
                          color: Colors.black,
                          image: DecorationImage(
                            image: AssetImage(
                              musicCollection.playList[i].songImage,
                            ),
                            fit: BoxFit.fill,
                            // image: NetworkImage(
                            //   widget.image,
                            // ),
                          ),
                        ),
                      ),
                      SizedBox()
                    ],
                  ),
                );
              },
            ),
          ),
          Text('${currentIndex}'),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomTitleText(
                      title: widget.songTitle,
                    ),
                    Text(
                      'Song Description',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                  ),
                ),
              ],
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.grey[300],
              inactiveTrackColor: Colors.grey[200],
              trackShape: RectangularSliderTrackShape(),
              thumbColor: Colors.black,
              trackHeight: 2.0,
              overlayColor: Colors.black.withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) {
                  setState(() {
                    seekToSecond(value.toInt());
                    _value = value;
                  });
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTime,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
                Text(
                  completeTime,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.heart,
                  color: Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.stepBackward,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  // print('${currentIndex}');
                  setState(() {
                    getAudio(
                      musicCollection.playList[currentIndex].musicPath,
                    );
                  });
                },
                icon: playing
                    ? Icon(
                        Icons.play_circle_filled_outlined,
                        size: 30,
                      )
                    : Icon(
                        Icons.pause_circle_filled_outlined,
                        size: 30,
                      ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    getAudio(
                      musicCollection.playList[currentIndex + 1].musicPath,
                    );
                  });
                },
                icon: FaIcon(
                  FontAwesomeIcons.stepForward,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.arrowDown,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.random,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.random,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.repeat,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
