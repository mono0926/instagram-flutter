import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mono_sample/entity/post.dart';
import 'package:mono_sample/entity/user.dart';
import 'package:mono_sample/page/post_widget.dart';

class ProfilePage extends StatelessWidget {
  final me = User.me;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          me.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView(
          children: _buildChildren(),
        ),
      ),
    );
  }

  List<Widget> _buildChildren() {
    final List<Widget> widgets = [];
    widgets.add(Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 88.0,
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 1.5)),
                child: ClipOval(
                  child: Container(
                    width: 88.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: ClipOval(
                      child: Image.asset(me.imagePath),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildScore(2745, 'posts'),
                        _buildScore(241, 'followers'),
                        _buildScore(123, 'following'),
                      ],
                    ),
                    Container(
                      height: 12.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      height: 28.0,
                      child: OutlineButton(
                        child: Text('Edit Profile', style: TextStyle(fontSize: 13.0)),
                        onPressed: _editProfileTapped,
                        borderSide: BorderSide(color: Colors.black54),
//                  color: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(3.0)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(height: 8.0,),
          Text(me.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.0)),
          Container(height: 4.0,),
          Text(me.about, style: TextStyle(fontSize: 12.0)),
        ],
      ),
    ));
    // TODO: lazy infinite list
    widgets.addAll(Post.posts.map((post) {
      return PostWidget(post: post);
    }));
    return widgets;
  }

  Column _buildScore(int value, String kind) {
    return Column(
      children: <Widget>[
        Text(
          value.toString(),
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
        ),
        Text(kind, style: TextStyle(fontSize: 12.0, color: Colors.black54)),
      ],
    );
  }

  void _editProfileTapped() {}
}
