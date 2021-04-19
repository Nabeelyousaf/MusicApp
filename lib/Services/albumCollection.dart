// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';

// class AlbumCollection extends StatelessWidget {
//   FirebaseFirestore firebase = FirebaseFirestore.instance;
//   DocumentReference album =
//       FirebaseFirestore.instance.collection('Albums').doc('ALbumsName');
//   var streamData = FirebaseFirestore.instance.collection('Albums').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: firebase.collection('Albums').snapshots(),
//       builder: (context, snapShot) {

//       },
//     );
//   }
// }
