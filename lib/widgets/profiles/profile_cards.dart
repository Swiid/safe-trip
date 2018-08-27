import 'package:flutter/material.dart';

import './address_tag.dart';
import '../ui_elements/title_default.dart';

class ProfileCards extends StatelessWidget {
  final Map<String, dynamic> profile;
  final int profileIndex;

  ProfileCards(this.profile, this.profileIndex);

  Widget _buildProfileDetailRow() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(profile['firstName']),
          SizedBox(
            width: 8.0,
          ),
          TitleDefault(profile['lastName'])
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).accentColor,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/profile' + profileIndex.toString()),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(profile['image']),
          _buildProfileDetailRow(),
          _buildActionButtons(context)
        ],
      ),
    );
  }
}
