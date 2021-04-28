import 'package:flutter/material.dart';
import 'package:musicapp/Screens/HomeScreen.dart';
import 'package:musicapp/Screens/PlayerScreen.dart';
import 'package:musicapp/Screens/playListScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = new PageController();
  int currentIndex = 0;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
            debugPrint("${currentIndex}");
          });
        },
        children: [
          HomeScreenWidget(),
          PlaylistScreen(),
          PlayerScreen(),
          // Wishlist(),
          // Account()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.grey),
        selectedItemColor: Colors.grey[700],
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        iconSize: 26,
        selectedFontSize: 10,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        unselectedItemColor: Colors.green,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Featured'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'My Library'),
        ],
      ),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedItem = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CustomBottomNavigationBar(
//         iconList: [
//           Icons.home,
//           Icons.card_giftcard,
//           Icons.camera,
//           Icons.pie_chart,
//           Icons.person,
//         ],
//         onChange: (val) {
//           setState(() {
//             _selectedItem = val;
//           });
//         },
//         defaultSelectedIndex: 1,
//       ),
//       appBar: AppBar(
//         title: Text("Home"),
//       ),
//       body: Center(
//         child: Text(
//           "Hello from Item $_selectedItem",
//           style: TextStyle(fontSize: 26),
//         ),
//       ),
//     );
//   }
// }

// class CustomBottomNavigationBar extends StatefulWidget {
//   final int defaultSelectedIndex;
//   final Function(int) onChange;
//   final List<IconData> iconList;

//   CustomBottomNavigationBar(
//       {this.defaultSelectedIndex = 0,
//       @required this.iconList,
//       @required this.onChange});

//   @override
//   _CustomBottomNavigationBarState createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   int _selectedIndex = 0;
//   List<IconData> _iconList = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _selectedIndex = widget.defaultSelectedIndex;
//     _iconList = widget.iconList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> _navBarItemList = [];

//     for (var i = 0; i < _iconList.length; i++) {
//       _navBarItemList.add(buildNavBarItem(_iconList[i], i));
//     }

//     return Row(
//       children: _navBarItemList,
//     );
//   }

//   Widget buildNavBarItem(IconData icon, int index) {
//     return GestureDetector(
//       onTap: () {
//         widget.onChange(index);
//         setState(() {
//           _selectedIndex = index;
//         });
//       },
//       child: Container(
//         height: 60,
//         width: MediaQuery.of(context).size.width / _iconList.length,
//         decoration: index == _selectedIndex
//             ? BoxDecoration(
//                 border: Border(
//                   bottom: BorderSide(width: 4, color: Colors.green),
//                 ),
//                 gradient: LinearGradient(colors: [
//                   Colors.green.withOpacity(0.3),
//                   Colors.green.withOpacity(0.015),
//                 ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
//                 // color: index == _selectedItemIndex ? Colors.green : Colors.white,
//                 )
//             : BoxDecoration(),
//         child: Icon(
//           icon,
//           color: index == _selectedIndex ? Colors.black : Colors.grey,
//         ),
//       ),
//     );
//   }
// }

// import 'package:pixinpreset/main.dart';
