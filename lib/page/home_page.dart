import 'package:flutter/material.dart';
import 'package:mono_sample/entity/post.dart';
import 'package:mono_sample/page/post_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "イッヌスタグラム",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          // TODO: lazy infinite list
          children: Post.posts.map((post) {
            return PostWidget(post: post);
          }).toList(),
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey[200]),
          ),
        ),
      ),
    );
  }

}