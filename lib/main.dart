import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicapp/Screens/HomeScreen.dart';
import 'package:musicapp/Screens/playListScreen.dart';

import 'Controller/PlayerController.dart';
import 'widget/BottomNavBar.dart';
// import 'package:musicapp/Screens/PlayerScreen.dart';
// import 'package:musicapp/Screens/ScrollerExample.dart';

// import 'Screens/playListScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String url;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class Exp extends StatelessWidget {
  final PressedState pressController = Get.put(PressedState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            pressController.changeStatus();
          },
          child: GetBuilder<PressedState>(
            init: PressedState(),
            builder: (pressController) {
              return pressController.pressedBool
                  ? Icon(Icons.play_arrow)
                  : Icon(Icons.pause);
            },
          ),
        ),
      ),
    );
  }
}
