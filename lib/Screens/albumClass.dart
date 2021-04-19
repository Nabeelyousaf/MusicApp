import 'package:cloud_firestore/cloud_firestore.dart';

class Model {
  String coverImage;
  String albumtitle;
  Model({this.albumtitle, this.coverImage});
  Model.fromDocumentSnapshot({DocumentSnapshot documentSnapshot}) {
    coverImage = documentSnapshot.get('CoverImage');
    albumtitle = documentSnapshot.get('AlbumTitle');
  }
}
