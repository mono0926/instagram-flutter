import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfileEditPageState();
}

class ProfileEditPageState extends State<ProfileEditPage> {
  final formKey = new GlobalKey<FormState>();
  File _image;
  String _name;
  String _username;
  String _website;
  String _bio;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: TextStyle(fontSize: 17.0, color: Colors.black),
        child: Scaffold(
            appBar: CupertinoNavigationBar(
              middle: Text('Edit Profile'),
              leading: CupertinoButton(
                child: Text('Cancel',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              trailing: CupertinoButton(
                child: Text('Done',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                padding: EdgeInsets.zero,
                onPressed: _onDonePressed,
              ),
            ),
            body: Form(
              key: formKey,
              child: ListView(children: <Widget>[
                Container(
                    color: Color(0xFFFAFAFA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 18.0,
                        ),
                        Container(
                          height: 96.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: 1.0)),
                          child: CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: _buildImage()),
                        ),
                        CupertinoButton(
                          child: Text(
                            'Change Profile Photo',
                            style: TextStyle(fontSize: 13.0),
                          ),
                          onPressed: _onChangeProfilePhotoTapped,
                        )
                      ],
                    )),
                _buildCell(FieldType.name),
                _buildCell(FieldType.username),
                _buildCell(FieldType.website),
                _buildCell(FieldType.bio)
              ]),
            )));
  }

  Widget _buildImage() {
    if (_image == null) {
      return Icon(
        Icons.person,
        size: 80.0,
        color: Colors.white,
      );
    } else {
      return ClipOval(
        child: Container(
          width: 96.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: Image.file(_image).image)),
        ),
      );
    }
  }

  Widget _buildCell(FieldType type) {
    return Container(
      height: 44.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              _fieldTitle(type),
              style: TextStyle(fontSize: 14.0),
            ),
            flex: 3,
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration.collapsed(
                  border: UnderlineInputBorder(), hintText: _fieldTitle(type)),
              onSaved: (value) => _fieldOnSaved(type, value),
              validator: (value) => _fieldOnValidate(type, value),
            ),
            flex: 8,
          ),
        ],
      ),
    );
  }

  String _fieldTitle(FieldType type) {
    switch (type) {
      case FieldType.name:
        return 'Name';
      case FieldType.username:
        return 'Username';
      case FieldType.website:
        return 'Website';
      case FieldType.bio:
        return 'Bio';
      default:
        return '';
    }
  }

  void _fieldOnSaved(FieldType type, String value) {
    switch (type) {
      case FieldType.name:
        _name = value;
        break;
      case FieldType.username:
        _username = value;
        break;
      case FieldType.website:
        _website = value;
        break;
      case FieldType.bio:
        _bio = value;
        break;
      default:
        break;
    }
  }

  String _fieldOnValidate(FieldType type, String value) {
    return value.isEmpty ? '${_fieldTitle(type)} cannot be empty' : null;
  }

  void _onDonePressed() {
    final form = formKey.currentState;
    if (!form.validate()) {
      return;
    }
    form.save();
  }

  void _onChangeProfilePhotoTapped() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    print(image);
    setState(() {
      _image = image;
    });
  }
}

enum FieldType { name, username, website, bio }
