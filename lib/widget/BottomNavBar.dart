import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home,
          Icons.card_giftcard,
          Icons.camera,
          Icons.pie_chart,
          Icons.person,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text(
          "Hello from Item $_selectedItem",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Colors.green),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.green.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}

// import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:pixinpreset/Constants/constants.dart';
// import 'package:pixinpreset/Screens/accountScreen.dart';
// import 'package:pixinpreset/Screens/featuredScreen.dart';
// import 'package:pixinpreset/Screens/premiumScreen.dart';
// import 'package:pixinpreset/Screens/searchScreen.dart';
// import 'package:pixinpreset/Screens/wishListScreen.dart';
// import 'package:pixinpreset/main.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   PageController pageController = new PageController();
//   int currentIndex = 0;

//   // FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   // String _message;
//   // @override
//   // void initState() {
//   //   _firebaseMessaging.configure (
//   //       onLaunch: (Map<String, dynamic> message) async {
//   //     setState(() {
//   //       _message = message['title'];
//   //     });
//   //   });
//   //   super.initState();
//   // }

//   void onTap(int page) {
//     setState(() {
//       currentIndex = page;
//     });
//     pageController.jumpToPage(page);
//   }

//   @override
//   void initState() {
//     super.initState();
//     //TODO: enable it for notifications
//     // var initializationSettingsAndroid =
//     //     AndroidInitializationSettings('@mipmap/ic_launcher');
//     // var initializationSettings =
//     //     InitializationSettings(android: initializationSettingsAndroid);

//     // flutterLocalNotificationsPlugin.initialize(initializationSettings);

//     // FirebaseMessaging.onMessage.listen(
//     //   (RemoteMessage message) {
//     //     RemoteNotification notification = message.notification;
//     //     AndroidNotification android = message.notification?.android;
//     //     if (notification != null && android != null) {
//     //       flutterLocalNotificationsPlugin.show(
//     //         notification.hashCode,
//     //         notification.title,
//     //         notification.body,
//     //         NotificationDetails(
//     //           android: AndroidNotificationDetails(
//     //             channel.id,
//     //             channel.name,
//     //             channel.description,
//     //             icon: message.notification.android?.smallIcon,
//     //           ),
//     //         ),
//     //       );
//     //     }
//     //   },
//     // );

//     // getToken();
//   }

//   getToken() async {
//     String token = await FirebaseMessaging.instance.getToken();
//     print('This is token here ::::::::::::::::::::::');
//     print(token);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: pageController,
//         onPageChanged: (index) {
//           setState(() {
//             currentIndex = index;
//             debugPrint("${currentIndex}");
//           });
//         },
//         children: [Featured(), Search(), Premium(), Wishlist(), Account()],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTap,
//         backgroundColor: kBackGreyColor,
//         selectedIconTheme: IconThemeData(color: kOrangeColor),
//         selectedItemColor: kOrangeColor,
//         unselectedIconTheme: IconThemeData(color: kWhiteColor),
//         unselectedLabelStyle: TextStyle(color: kWhiteColor),
//         iconSize: 26,
//         selectedFontSize: 14,
//         unselectedFontSize: 12,
//         currentIndex: currentIndex,
//         unselectedItemColor: kWhiteColor,
//         showSelectedLabels: true,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Featured'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//           BottomNavigationBarItem(
//               icon: Icon(EvaIcons.heartOutline), label: 'Wishlist'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.account_box), label: 'Account'),
//         ],
//       ),
//     );
//   }
// }
