import 'package:flutter/material.dart';
import 'package:musicapp/widget/CustomBottomNav.dart';

// SearchScreen is use in PlaylistScreen In SliverAppBar
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var activeColor;
  @override
  void initState() {
    super.initState();
    activeColor = Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomBottomNav(
      //   activeColor: activeColor,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SearchScreen'),
        ],
      ),
    );
  }
}
