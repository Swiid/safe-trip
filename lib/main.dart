import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/auth.dart';
import './pages/profiles_admin.dart';
import './pages/profiles.dart';
import './pages/profile.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _profiles = [];

  void _addProfile(Map<String, dynamic> profile) {
    setState(() {
      _profiles.add(profile);
    });
    print(_profiles);
  }

  void _updateProfile(int index, Map<String, dynamic> profile) {
    setState(() {
      _profiles[index] = profile;
    });
  }

  void _deleteProfile(int index) {
    setState(() {
      _profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange,
          buttonColor: Colors.green),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/profiles': (BuildContext context) => ProfilesPage(_profiles),
        '/admin': (BuildContext context) =>
            ProfilesAdminPage(_addProfile, _updateProfile, _deleteProfile),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'profile') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProfilePage(
                _profiles[index]['firstName'],
                _profiles[index]['lastName'],
                _profiles[index]['dob'],
                _profiles[index]['cellNumber'],
                _profiles[index]['image']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => ProfilesPage(_profiles));
      },
    );
  }
}
