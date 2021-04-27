import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/Screens/albumClass.dart';

// SongCollection
// ALbums->AlbumName->Songs->SongName
// data get from FireBase
class SongCollection extends StatelessWidget {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String musicName;
  String dummyData;
  SongCollection({
    this.musicName,
  });

  @override
  Widget build(BuildContext context) {
    Model model = Model(
      albumtitle: dummyData,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // print(dummyData);
              print(model.albumtitle);
            },
            icon: Icon(
              Icons.done,
            ),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        // stream: firebaseFirestore
        //     .collection('Albums')
        //     .doc('AlbumsName')
        //     .collection('Songs')
        //     .doc('SongName')
        //     .snapshots(),
        stream: firebaseFirestore
            .collection('Albums')
            .doc('AlbumsName')
            .collection('Songs')
            .snapshots(),
        builder: (context, snapshot) {
          var data = snapshot.data.docs;
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = snapshot.data.docs[index];
                  // var dummy = snapshot.data.docs;
                  String artistName = documentSnapshot.data()['ArtistName'];
                  dummyData = artistName;

                  return Center(
                    child: Column(
                      children: [
                        Text(artistName),
                      ],
                    ),
                  );
                });
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
// DocumentSnapshot documentSnapshot =
//     snapShot.data.docs[index];
// widget.imageUrl = documentSnapshot.data()['CoverImage'];
// widget.musicUrl = documentSnapshot.data()['path'];
// widget.albumTitle = documentSnapshot.data()['AlbumTitle'];
//       //
// if (snapShot.hasData) {
//   return ListView.builder(
//     // scrollDirection: Axis.vertical,
//     shrinkWrap: true,
//     itemCount: list,
//     itemBuilder: (context, index) {

// return CustomScrollView(
//   physics: BouncingScrollPhysics(),
//   slivers: [
//     SliverAppBar(
//       leading: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: CircleAvatar(
//           backgroundColor:
//               Colors.grey[800].withOpacity(0.5),
//           child: IconButton(
//             onPressed: () {
//               print(db);
//               print(dummy);
//             },
//             icon: Icon(
//               Icons.chevron_left,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 12.0,
//           ),
//           child: CircleAvatar(
//               backgroundColor:
//                   Colors.grey[800].withOpacity(0.5),
//               child: IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.more_vert_sharp,
//                   color: Colors.white,
//                 ),
//               )),
//         )
//       ],
//       backgroundColor: Colors.white,
//       expandedHeight: 300,
//       floating: true,
//       pinned: true,
//       elevation: 0,
//       flexibleSpace: FlexibleSpaceBar(
//         background: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               fit: BoxFit.cover,
//               image: AssetImage('assets/91513.jpg'),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black,
//                       blurRadius: 5,
//                     ),
//                   ],
//                   image: DecorationImage(
//                     fit: BoxFit.fill,
//                     image: NetworkImage(widget.imageUrl),
//                   ),
//                 ),
//                 height: 200,
//                 width: 200,
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//     CustomPlaylistHeader(
//       title: widget.albumTitle,
//     ),
//     SliverList(
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           return CustomPlayListTile(
//             image: widget.imageUrl,
//             musicUrl: widget.musicUrl,
//             title: widget.albumTitle,
//           );
//         },
//         childCount: musicCollection.playList.length,
//       ),
//     ),
//   ],
// );
//     },
//   );
// } else {
//   return LinearProgressIndicator();
// }
// }

// return CustomScrollView(
//                       physics: BouncingScrollPhysics(),
//                       slivers: [
//                         SliverAppBar(
//                           leading: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               backgroundColor:
//                                   Colors.grey[800].withOpacity(0.5),
//                               child: IconButton(
//                                 onPressed: () {
//                                   print(db);
//                                   print(dummy);
//                                 },
//                                 icon: Icon(
//                                   Icons.chevron_left,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           actions: [
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 12.0,
//                               ),
//                               child: CircleAvatar(
//                                   backgroundColor:
//                                       Colors.grey[800].withOpacity(0.5),
//                                   child: IconButton(
//                                     onPressed: () {},
//                                     icon: Icon(
//                                       Icons.more_vert_sharp,
//                                       color: Colors.white,
//                                     ),
//                                   )),
//                             )
//                           ],
//                           backgroundColor: Colors.white,
//                           expandedHeight: 300,
//                           floating: true,
//                           pinned: true,
//                           elevation: 0,
//                           flexibleSpace: FlexibleSpaceBar(
//                             background: Container(
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage('assets/91513.jpg'),
//                                 ),
//                               ),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       boxShadow: [
//                                         BoxShadow(
//                                           color: Colors.black,
//                                           blurRadius: 5,
//                                         ),
//                                       ],
//                                       image: DecorationImage(
//                                         fit: BoxFit.fill,
//                                         image: NetworkImage(widget.imageUrl),
//                                       ),
//                                     ),
//                                     height: 200,
//                                     width: 200,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                         CustomPlaylistHeader(
//                           title: widget.albumTitle,
//                         ),
//                         SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (context, index) {
//                               return CustomPlayListTile(
//                                 image: widget.imageUrl,
//                                 musicUrl: widget.musicUrl,
//                                 title: widget.albumTitle,
//                               );
//                             },
//                             childCount: musicCollection.playList.length,
//                           ),
//                         ),
//                       ],
//                     );
