import 'package:meta/meta.dart';
import 'package:mono_sample/entity/user.dart';

class Post {
  final User user;
  final String imagePath; // TODO: Use GCS
  final String comment;
  Post({@required this.imagePath, @required this.user, @required this.comment});

  static final List<Post> posts =
      (new List<int>.generate(10, (i) => i + 1)).map((i) {
    return new Post(
        imagePath: 'images/love.png', user: User.me, comment: '(　´･‿･｀)');
  }).toList();
}
