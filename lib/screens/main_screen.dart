import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScreenPage extends StatelessWidget {
  const MainScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference booksCollection =
        FirebaseFirestore.instance.collection('books');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white24,
        elevation: 0.0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              'Okur',
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: booksCollection.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                Object? data = snapshot.data!.docs.first.data();
                return Text(
                  (data! as Map)['author'],
                  style: TextStyle(color: Colors.black),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
