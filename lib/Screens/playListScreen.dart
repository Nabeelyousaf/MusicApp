import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/Model/MusicName.dart';
import 'package:musicapp/Screens/PlayerScreen.dart';
import 'package:musicapp/Screens/albumClass.dart';
import 'package:musicapp/widget/CustomTitleText.dart';

class PlaylistScreen extends StatefulWidget {
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
  void initState() {
    super.initState();
    print(widget.musicUrl);
  }

  MusicCollection musicCollection = MusicCollection();
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  var dummy;
  // final db = FirebaseFirestore.instance
  //     .collection('Albums')
  //     .doc()
  //     .collection('Songs')
  //     .doc()
  //     .snapshots();

  bool pinned;
  @override
  Widget build(BuildContext context) {
    Model model = Model(
      albumtitle: widget.dummyData,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: firebase.collection('Albums').snapshots(),
              builder: (context, snapShot) {
                // int list = snapShot.data.docs.length;
                DocumentSnapshot documentSnapshot = snapShot.data.docs[0];
                widget.imageUrl = documentSnapshot.data()['CoverImage'];
                widget.musicUrl = documentSnapshot.data()['path'];
                widget.albumTitle = documentSnapshot.data()['AlbumTitle'];

                if (snapShot.hasData) {
                  // return ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: list,
                  //   itemBuilder: (context, index) {
                  //     // dummy = documentSnapshot.data()['ArtistName'];
                  // j
                  return CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      SliverAppBar(
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[800].withOpacity(0.5),
                            child: IconButton(
                              onPressed: () {
                                // print(db);
                                // print(dummy);
                                print(model.albumtitle);
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
                                  onPressed: () {},
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
                                image: AssetImage('assets/91513.jpg'),
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
                                      fit: BoxFit.fill,
                                      image: NetworkImage(''),
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
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return CustomPlayListTile(
                              image: widget.imageUrl,
                              musicUrl: widget.musicUrl,
                              title: widget.albumTitle,
                              // title: 'hello',
                            );
                          },
                          childCount: musicCollection.playList.length,
                        ),
                      ),
                    ],
                  );
                } else {
                  return LinearProgressIndicator();
                }
              }
              // DocumentSnapshot data = snapShot.data.docs[0];
              // dummy=data.data().['']

              // DocumentSnapshot documentSnapshot = snapShot.data.docs[0];
              // widget.imageUrl = documentSnapshot.data()['CoverImage'];
              // widget.musicUrl = documentSnapshot.data()['path'];
              // widget.albumTitle = documentSnapshot.data()['AlbumTitle'];
              // dummy = documentSnapshot.data()['ArtistName'];

              ),
        ),
      ),
    );
  }
}

class CustomPlayListTile extends StatelessWidget {
  String image;
  String musicUrl;
  String title;
  CustomPlayListTile({
    this.image,
    this.musicUrl,
    this.title,
  });
  MusicCollection musicCollection = MusicCollection();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('url:${musicUrl}');
        print('url:${image}');
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
                        musicCollection.getSongName(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
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
