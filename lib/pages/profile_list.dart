import 'package:flutter/material.dart';

import './profile_edit.dart';

class ProfileListPage extends StatelessWidget {
  final Function updateProfile;
  final Function deleteProfile;
  final List<Map<String, dynamic>> profiles;

  ProfileListPage(this.updateProfile, this.deleteProfile, this.profiles);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProfileEditPage(
                profile: profiles[index],
                updateProfile: updateProfile,
                profileIndex: index,
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(profiles[index]['firstName']),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProfile(index);
            } else if (direction == DismissDirection.startToEnd) {
              print('Swiped start to end');
            } else {
              print('Other swiping');
            }
          },
          background: Container(color: Colors.red),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(profiles[index]['image']),
                ),
                title: Text(profiles[index]['firstName']),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: profiles.length,
    );
  }
}
