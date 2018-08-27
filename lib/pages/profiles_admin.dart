import 'package:flutter/material.dart';

import './profile_edit.dart';
import './profile_list.dart';

class ProfilesAdminPage extends StatelessWidget {
  final Function addProfile;
  final Function updateProfile;
  final Function deleteProfile;
  final List<Map<String,dynamic>> profiles;

  ProfilesAdminPage(this.addProfile, this.updateProfile, this.deleteProfile);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Choose'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('All Profiles'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/profiles');
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Manage Profiles'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.create),
                text: 'Create Profile',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'Profile Edit',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProfileEditPage(addProfile: addProfile),
            ProfileListPage(updateProfile, deleteProfile, profiles)
          ],
        ),
      ),
    );
  }
}
