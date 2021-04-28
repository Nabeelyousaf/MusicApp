import 'package:flutter/material.dart';
import 'package:musicapp/widget/CustomCard.dart';
import 'package:musicapp/widget/CustomTitleText.dart';
import 'package:musicapp/widget/musicList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: CustomBottomNav(),
        body: HomeScreenWidget(),
      ),
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey[300],
                child: Stack(
                  children: [],
                ),
              ),
              MusicList(
                title: 'Popular Song',
              ),
              CustomTitleText(
                title: 'Recently Played',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(
                      height: 150,
                      width: 150,
                      image: 'assets/1591.jpg',
                    ),
                    CustomCard(
                      height: 150,
                      width: 150,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      height: 150,
                      width: 150,
                      image: 'assets/1591.jpg',
                    ),
                    CustomCard(
                      height: 150,
                      width: 150,
                      image: 'assets/9868.jpg',
                    ),
                  ],
                ),
              ),
              CustomTitleText(
                title: 'Pop',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/1591.jpg',
                    ),
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      image: 'assets/1591.jpg',
                    ),
                  ],
                ),
              ),
              CustomTitleText(
                title: 'Pop',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/1591.jpg',
                    ),
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      image: 'assets/1591.jpg',
                    ),
                  ],
                ),
              ),
              CustomTitleText(
                title: 'Pop',
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/1591.jpg',
                    ),
                    CustomCard(
                      height: 100,
                      width: 100,
                      image: 'assets/9868.jpg',
                    ),
                    CustomCard(
                      image: 'assets/1591.jpg',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 'Popular Song'

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
//                   bottom: BorderSide(
//                     width: 4,
//                     color: Colors.green,
//                   ),
//                 ),

//                 // color: index == _selectedItemIndex ? Colors.green : Colors.white,
//               )
//             : BoxDecoration(),
//         child: Icon(
//           icon,
//           color: index == _selectedIndex ? Colors.black : Colors.grey,
//         ),
//       ),
//     );
//   }
// }
////////////////////////CustomBottomNavigationBar(
// iconList: [
//   Icons.home,
//   Icons.search,
//   Icons.browser_not_supported,
//   Icons.person,
// ],
// onChange: (val) {
//   setState(() {
//     _selectedItem = val;
//   });
// },
// defaultSelectedIndex: 1,
// ),
