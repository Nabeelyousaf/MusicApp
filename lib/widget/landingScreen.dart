import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:musicapp/Screens/HomeScreen.dart';
import 'package:musicapp/Screens/SearchScreen.dart';

// NavBar but i m not use anywhere
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedItem = 0;

  final List<Widget> _children = [
    HomeScreenWidget(),
    SearchScreen(),
    HomeScreenWidget(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 0,
      ),
      body: _children[_selectedItem],
    );
  }
}

class CustomNavBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  CustomNavBar({this.defaultSelectedIndex = 0, @required this.onChange});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    final double dWidth = MediaQuery.of(context).size.width;
    final double dHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildNavBarItems(
          dWidth,
          dHeight,
          0,
          Icons.home,
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          1,
          FontAwesomeIcons.search,
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          2,
          FontAwesomeIcons.safari,
        ),
        buildNavBarItems(
          dWidth,
          dHeight,
          3,
          FontAwesomeIcons.user,
        ),
      ],
    );
  }

  Widget buildNavBarItems(
    double dWidth,
    double dHeight,
    int index,
    IconData icons,
  ) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Container(
            height: dWidth * 0.15,
            decoration: index == _selectedIndex
                ? BoxDecoration(
                    border: Border(
                      bottom: BorderSide(

                          // color: Colors.greenAccent,
                          ),
                    ),
                    // color: index == _selectedIndex ? Colors.green : Colors.pink,
                  )
                : BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  icons,
                  size: index == _selectedIndex ? 25 : 20,
                )
              ],
            )),
      ),
    );
  }
}
