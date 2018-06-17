import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mono_sample/entity/post.dart';
import 'package:mono_sample/page/post_widget.dart';

//class IOSAppBar extends AppBar {
//  @override
//  // TODO: implement preferredSize
//  Size get preferredSize => new Size.fromHeight(44 + (bottom?.preferredSize?.height ?? 0.0));
//  @override
//  IOSAppBar({
//    Key key,
//    super.leading,
//    this.automaticallyImplyLeading = true,
//    this.title,
//    this.actions,
//    this.flexibleSpace,
//    this.bottom,
//    this.elevation = 4.0,
//    this.backgroundColor,
//    this.brightness,
//    this.iconTheme,
//    this.textTheme,
//    this.primary = true,
//    this.centerTitle,
//    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
//    this.toolbarOpacity = 1.0,
//    this.bottomOpacity = 1.0,
//  })
//}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          "イッヌスタグラム",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: ListView(
          // TODO: lazy infinite list
          children: Post.posts.map((post) {
            return PostWidget(post: post);
          }).toList(),
        ),
      ),
    );
  }

}