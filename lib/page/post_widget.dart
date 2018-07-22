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
            padding: EdgeInsets.all(11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: 32.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey, width: 0.5)),
                      child: ClipOval(
                        child: Image.asset(post.user.imageUrl),
                      ),
                    ),
                    Container(width: 8.0),
                    Text(
                      post.user.username,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13.0),
                    )
                  ],
                ),
                Icon(Icons.more_horiz)
              ],
            ),
          ),
          Image.asset(post.imagePath),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        _buildIcon(Icons.favorite_border),
                        Container(width: 13.0),
                        _buildIcon(Icons.chat_bubble_outline),
                        Container(width: 13.0),
                        _buildIcon(Icons.mail_outline),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: _buildIcon(Icons.bookmark_border),
                        )
                      ],
                    ),
                  ],
                ),
                Container(height: 9.0),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            post.user.username,
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 13.0),
                          ),
                          Container(width: 3.0),
                          Text(post.comment, style: TextStyle(fontSize: 12.0))
                        ],
                      ),
                      Container(height: 4.0),
                      // TODO: use real data
                      Text('7分前',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 9.0)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
    }
  }

  Icon _buildIcon(IconData icon) => Icon(
        icon,
        size: 28.0,
      );
}
