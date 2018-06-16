import 'package:flutter/material.dart';
import 'package:mono_sample/entity/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  PostWidget({@required this.post});

  @override
  Widget build(BuildContext context) {
    {
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 32.0,
                      child: ClipOval(
                        child: Image.asset(post.user.imagePath),
                      ),
                    ),
                    Container(width: 8.0),
                    Text(
                      post.user.name,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
          Image.asset(post.imagePath),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.favorite_border),
                        Container(width: 8.0),
                        Icon(Icons.chat_bubble_outline),
                        Container(width: 8.0),
                        Icon(Icons.mail_outline),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Icon(Icons.bookmark_border),
                        )
                      ],
                    ),
                  ],
                ),
                Container(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      'mono',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Container(width: 8.0),
                    Text(post.comment)
                  ],
                ),
                Container(height: 4.0),
                // TODO: use real data
                Text('7分前',
                    style: TextStyle(color: Colors.black54, fontSize: 12.0))
              ],
            ),
          ),
        ],
      );
    }
  }
}