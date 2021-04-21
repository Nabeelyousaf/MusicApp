import 'package:musicapp/Screens/HomeScreen.dart';

class MusicModel {
  String songName;
  String songDescription;
  String songImage;
  String musicPath;
  MusicModel(
      {this.songDescription, this.songName, this.songImage, this.musicPath});
}

class MusicCollection {
  int musicIndex = 0;
  List<MusicModel> playList = [
    MusicModel(
        songName: "What's Next",
        songDescription: 'Drake-Scary Hours2',
        songImage: 'assets/1591.jpg',
        musicPath:
            'https://firebasestorage.googleapis.com/v0/b/musicapp-2424d.appspot.com/o/Serena%20-%20Safari%20(Lyrics).mp3?alt=media&token=1241ec28-2d19-4e0b-ab85-98c26946d520'),
    MusicModel(
        songName: 'Toosie Slide',
        songDescription: 'Drake-Toosie Slide',
        songImage: 'assets/9868.jpg',
        musicPath:
            'https://firebasestorage.googleapis.com/v0/b/musicapp-2424d.appspot.com/o/aashiqui-22612.mp3?alt=media&token=c0b71ced-1845-43b9-82e9-243078fd1f8b'),
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
