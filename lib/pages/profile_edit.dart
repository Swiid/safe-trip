import 'package:flutter/material.dart';

import '../widgets/helpers/ensure_visible.dart';

class ProfileEditPage extends StatefulWidget {
  final Function addProfile;
  final Function updateProfile;
  final Map<String, dynamic> profile;
  final int profileIndex;

  ProfileEditPage(
      {this.addProfile, this.updateProfile, this.profile, this.profileIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProfileEditePageState();
  }
}

class _ProfileEditePageState extends State<ProfileEditPage> {
  final Map<String, dynamic> _formData = {
    'firstName': null,
    'lastName': null,
    'dob': null,
    'cellNumber': null,
    'image': 'assets/psc.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _firstNameFocusNode = FocusNode();
  final _lastNameFocusNode = FocusNode();
  final _dobFocusNode = FocusNode();
  final _cellNumberFocusNode = FocusNode();

  Widget _buildFirstNameTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _firstNameFocusNode,
      child: TextFormField(
        focusNode: _firstNameFocusNode,
        decoration: InputDecoration(labelText: 'First Name'),
        initialValue: widget.profile == null ? '' : widget.profile['firstName'],
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['firstName'] = value;
        },
      ),
    );
  }

  Widget _buildLastNameTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _lastNameFocusNode,
      child: TextFormField(
        focusNode: _lastNameFocusNode,
        decoration: InputDecoration(labelText: 'Last Name'),
        initialValue: widget.profile == null ? '' : widget.profile['lastName'],
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty || value.length < 0) {
            return 'Last Name is required.';
          }
        },
        onSaved: (String value) {
          _formData['lastName'] = value;
        },
      ),
    );
  }

  Widget _buildDOBTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _dobFocusNode,
      child: TextFormField(
        focusNode: _dobFocusNode,
        decoration: InputDecoration(labelText: 'Date Of Birth'),
        initialValue: widget.profile == null ? '' : widget.profile['dob'],
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['dob'] = value;
        },
      ),
    );
  }

  Widget _buildCellNumberTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _cellNumberFocusNode,
      child: TextFormField(
        focusNode: _cellNumberFocusNode,
        decoration: InputDecoration(labelText: 'Cell Number'),
        initialValue:
            widget.profile == null ? '' : widget.profile['cellNumber'],
        validator: (String value) {
          // if (value.trim().length <= 0) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be 5+ characters long.';
          }
        },
        onSaved: (String value) {
          _formData['cellNumber'] = value;
        },
      ),
    );
  }

  Widget _buildPageContent(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildFirstNameTextField(),
              _buildLastNameTextField(),
              _buildDOBTextField(),
              _buildCellNumberTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                textColor: Colors.white,
                onPressed: _submitForm,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.profile == null) {
      widget.addProfile(_formData);
    } else {
      widget.updateProfile(widget.profileIndex, _formData);
    }

    Navigator.pushReplacementNamed(context, '/profiles');
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.profile == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Profile'),
            ),
          );
  }
}
