// import 'package:flutter/material.dart';
// import 'package:musicapp/Model/MusicName.dart';

// class ScrollList extends StatefulWidget {
//   @override
//   _ScrollListState createState() => _ScrollListState();
// }

// class _ScrollListState extends State<ScrollList> {
//   int currentIndex = 0;
//   PageController _controller;
//   @override
//   void initState() {
//     _controller = PageController(initialPage: 0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // MusicModel musicModel = MusicModel();
//     MusicCollection musicCollection = MusicCollection();
//     return Scaffold(
//       body: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _controller,
//                 itemCount: musicCollection.playList.length,
//                 // itemCount: ,

//                 itemBuilder: (_, i) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     height: MediaQuery.of(context).size.height * 0.4,
//                     // color: Colors.amber,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                             color: Colors.black,
//                             blurRadius: 5,
//                             offset: Offset(0, 1)),
//                       ],
//                       image: DecorationImage(
//                         image: AssetImage(
//                           musicCollection.playList[i].songImage,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       home: new InnerSwiper(),
//     );
//   }
// }

class MyStructure {
  final int id;
  final String text;
  MyStructure({this.id, this.text});
}

class MyWidget extends StatelessWidget {
  final MyStructure widgetStructure;
  MyWidget(this.widgetStructure);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        child: Text('${widgetStructure.id} ${widgetStructure.text}'));
  }
}

class InnerSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InnerSwiperState();
  }
}

class _InnerSwiperState extends State<InnerSwiper> {
  SwiperController controller;

  List<bool> autoplayes;

  List<SwiperController> controllers;
  List<MyStructure> widgetList = [];

  @override
  void initState() {
    controller = new SwiperController();
    autoplayes = new List()
      ..length = 10
      ..fillRange(0, 10, false);
    controllers = new List()
      ..length = 10
      ..fillRange(0, 10, new SwiperController());

    // for (int i = 0; i < 10; i++) {
    //   widgetList.add(MyStructure(id: i, text: ' this is index ${i}'));
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        body: new Swiper(
          loop: false,
          itemCount: widgetList.length,
          controller: controller,
          pagination: new SwiperPagination(),
          itemBuilder: (BuildContext context, int index) {
            return new Column(
              children: <Widget>[
                new SizedBox(
                  child: new Swiper(
                    controller: controllers[index],
                    pagination: new SwiperPagination(),
                    itemCount: widgetList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MyWidget(widgetList[index]);
                    },
                    autoplay: autoplayes[index],
                  ),
                  height: 300.0,
                ),
                new RaisedButton(
                  onPressed: () {
                    setState(() {
                      autoplayes[index] = true;
                    });
                  },
                  child: new Text("Start autoplay"),
                ),
                new RaisedButton(
                  onPressed: () {
                    setState(() {
                      autoplayes[index] = false;
                    });
                  },
                  child: new Text("End autoplay"),
                ),
                new Text("is autoplay: ${autoplayes[index]}")
              ],
            );
          },
        ),
      ),
    );
  }
}
