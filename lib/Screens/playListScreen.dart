import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:musicapp/Controller/PlayerController.dart';
import 'package:musicapp/Screens/PlayerScreen.dart';
import 'package:musicapp/widget/CustomDialog.dart';
import 'package:musicapp/widget/customPlayListTile.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Model/MusicName.dart';
import 'package:musicapp/widget/CustomPlayLIstHeader.dart';
// this screen is the list of Songs

class PlaylistScreen extends StatefulWidget {
  // final PressedState pressController = Get.put(PressedState());
  String imageUrl;
  String musicUrl;
  String albumTitle;
  String dummyData;
  PlaylistScreen({
    this.imageUrl,
    this.musicUrl,
    this.albumTitle,
  });
  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  // Dummy Collection of music in which name , image and path

  MusicCollection musicCollection = MusicCollection();

  FirebaseFirestore firebase = FirebaseFirestore.instance;

  bool pinned;
  bool change = false;
  void changebutton() {
    setState(() {
      change = !change;
    });
  }

  @override
  Widget build(BuildContext context) {
    void showDialog() {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 400),
        context: context,
        pageBuilder: (_, __, ___) {
          return DialogBox();
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder<QuerySnapshot>(
          stream: firebase.collection('Albums').snapshots(),
          builder: (context, snapShot) {
            if (snapShot.data == null) {
              // if snapShort has not date then show CircularProgressIndicator
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // return ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: snapShot.data.docs.length,
              //   itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapShot.data.docs[0];
              widget.imageUrl = documentSnapshot.data()['CoverImage'];
              widget.musicUrl = documentSnapshot.data()['path'];
              widget.albumTitle = documentSnapshot.data()['AlbumTitle'];
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      // in this Screen i m use SliverApp bar
                      child: CustomScrollView(
                        physics: BouncingScrollPhysics(),
                        slivers: [
                          SliverAppBar(
                            // SliverAPP Bar Icons Button BUt now i m not use functionality
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Colors.grey[800].withOpacity(0.5),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: CircleAvatar(
                                    backgroundColor:
                                        Colors.grey[800].withOpacity(0.5),
                                    child: IconButton(
                                      onPressed: () {
                                        showDialog();
                                      },
                                      icon: Icon(
                                        Icons.more_vert_sharp,
                                        color: Colors.white,
                                      ),
                                    )),
                              )
                            ],
                            backgroundColor: Colors.white,
                            expandedHeight: 300,
                            floating: true,
                            pinned: true,
                            elevation: 0,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        // SliverApp Bar Background image import from Assets Dummy data
                                        'assets/91513.jpg'),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 5,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          // Album Profile Image
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            widget.imageUrl,
                                          ),
                                        ),
                                      ),
                                      height: 200,
                                      width: 200,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          CustomPlaylistHeader(
                            title: widget.albumTitle,
                            // Album title  import from firebase
                          ),
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return CustomPlayListTile(
                                  // Album list Tile in which give image and path of the song
                                  image: widget.imageUrl,
                                  musicUrl: widget.musicUrl,
                                  title: widget.albumTitle,
                                  function: () {
                                    showDialog();
                                  },
                                );
                              },
                              childCount: musicCollection.playList.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _isVisible,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PlayerScreen(
                                image: widget.imageUrl,
                                musicUrl: widget.musicUrl,
                                songTitle: widget.albumTitle,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          color: Colors.white,
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(widget.imageUrl),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Text(
                                'Song Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    changebutton();
                                  },
                                  icon: Icon(
                                    change ? Icons.play_arrow : Icons.pause,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
              //   },
              // );
            }
          },
        ),
      ),
    );
  }
}
