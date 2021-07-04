import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'login_page.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CircleAvatar(
        backgroundColor: HexColor('#F5F6F8'),
        child: Column(
          children: [
            Spacer(),
            Text(
              ' K i t a p ç ı ',
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '"Okuyun. Kendinizi değiştirin."',
              style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
                fontSize: 29,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: HexColor('#69639F'),
                textStyle: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              icon: Icon(Icons.login_rounded),
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Başlamak için giriş yapın.'),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
