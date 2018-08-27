import 'package:flutter/material.dart';

import './profile_cards.dart';

class Profiles extends StatelessWidget {
  final List<Map<String, dynamic>> profiles;

  Profiles(this.profiles);

  Widget _buildProfileList() {
    Widget profileCards;
    if (profiles.length > 0) {
      profileCards = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProfileCards(profiles[index], index),
            itemCount: profiles.length,
      );
    } else {
      profileCards = Container();
    }
    return profileCards;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildProfileList();
  }
}
