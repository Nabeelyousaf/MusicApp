import 'package:musicapp/Screens/HomeScreen.dart';

class MusicModel {
  String songName;
  String songDescription;
  String songImage;
  MusicModel({this.songDescription, this.songName, this.songImage});
}

class MusicCollection {
  int musicIndex = 0;
  List<MusicModel> playList = [
    MusicModel(
      songName: "What's Next",
      songDescription: 'Drake-Scary Hours2',
      songImage: 'assets/1591.jpg',
    ),
    MusicModel(
      songName: 'Toosie Slide',
      songDescription: 'Drake-Toosie Slide',
      songImage: 'assets/9868.jpg',
    ),
  ];
  String getSongName() {
    return playList[musicIndex].songName;
  }

  String getSongDescription() {
    return playList[musicIndex].songDescription;
  }

  String getImagePath() {
    return playList[musicIndex].songImage;
  }
}
