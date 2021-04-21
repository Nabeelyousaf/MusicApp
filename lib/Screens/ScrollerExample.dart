// import 'package:flutter/material.dart';

// class ScrollMovement extends StatefulWidget {
//   @override
//   _ScrollMovementState createState() => _ScrollMovementState();
// }

// class _ScrollMovementState extends State<ScrollMovement> {
//   ScrollController _controller;

//   @override
//   void initState() {
//     _controller = ScrollController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final itemSize = MediaQuery.of(context).size.width * 0.4;

//     _moveUp() {
//       //_controller.jumpTo(_controller.offset - itemSize);
//       _controller.animateTo(_controller.offset - itemSize,
//           curve: Curves.linear, duration: Duration(milliseconds: 500));
//     }

//     _moveDown() {
//       //_controller.jumpTo(_controller.offset + itemSize);
//       _controller.animateTo(_controller.offset + itemSize,
//           curve: Curves.linear, duration: Duration(milliseconds: 500));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Scroll Movement"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             height: 50.0,
//             color: Colors.green,
//             child: Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   RaisedButton(
//                     child: Text("up"),
//                     onPressed: _moveUp,
//                   ),
//                   RaisedButton(
//                     child: Text("down"),
//                     onPressed: _moveDown,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               controller: _controller,
//               itemCount: 5,
//               itemExtent: itemSize,
//               itemBuilder: (context, index) {
//                 // return ListTile(title: Text("Index : $index"));
//                 return Container(
//                   child: SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           height: MediaQuery.of(context).size.height * 0.4,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 1)),
//                             ],
//                             color: Colors.black,
//                             image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('assets/1591.jpg')),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width * 0.9,
//                           height: MediaQuery.of(context).size.height * 0.4,
//                           decoration: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                   color: Colors.black,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 1)),
//                             ],
//                             color: Colors.black,
//                             image: DecorationImage(
//                                 fit: BoxFit.fill,
//                                 image: AssetImage('assets/1591.jpg')),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
