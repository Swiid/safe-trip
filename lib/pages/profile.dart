import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class ProfilePage extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String dob;
  final String cellNumber;
  final String imageUrl;

  ProfilePage(
      this.firstName, this.lastName, this.dob, this.cellNumber, this.imageUrl);

  Widget _buildAddressRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Benoni, Johannesburg',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button pressed!');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(firstName),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(firstName +''+ lastName),
            ),
            _buildAddressRow()
          ],
        ),
      ),
    );
  }
}
