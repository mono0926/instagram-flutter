import 'package:meta/meta.dart';

class User {
  final String account;
  final String name;
  final String imagePath; // TODO: Use GCS
  final String about;
  User(
      {@required this.account,
      @required this.name,
      @required this.imagePath,
      @required this.about});

  static final me = new User(
      account: 'mono0926',
      name: 'mono🐶イヌスタグラマー',
      imagePath: 'images/love.png',
      about:
          '#iOS #Apple #Swift #スケボー #ランニング #野球 #テニス #手料理 #犬 #イッヌ @ighost_jp');
}
