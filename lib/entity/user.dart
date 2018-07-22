import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:mono_sample/model/authenticator.dart';
import 'package:mono_sample/model/database.dart';
import 'package:scoped_model/scoped_model.dart';

class User extends Entity {
  final String id;
  final String username;
  final String name;
  final String imageUrl; // TODO: Use GCS
  final String about;
  User(
      {@required this.id,
      @required this.username,
      @required this.name,
      @required this.imageUrl,
      @required this.about});

  static final me = new User(
      id: 'hoge',
      username: 'mono0926',
      name: 'mono🐶イヌスタグラマー',
      imageUrl: 'images/love.png',
      about:
          '#iOS #Apple #Swift #スケボー #ランニング #野球 #テニス #手料理 #犬 #イッヌ @ighost_jp');
}

class AccountModel extends Model {
  Authenticator authenticator = FirebaseAuthenticator();
  AuthUser authUser;
  User user;
  final Database<User> database = AppDatabase<User>(
      collectionName: 'users',
      decoder: UserSnapshotDecoder(),
      encoder: UserSnapshotEncoder());

  AccountModel() {
    (() async {
      authUser = await authenticator.getOrCreateUser();
      database.entity(authUser.id).listen((user) async {
        if (user == null) {
          await database.set(User(
              id: authUser.id,
              username: null,
              name: null,
              imageUrl: null,
              about: null));
          return;
        }
        this.user = user;
        notifyListeners();
      });
    })();
  }
}

class UserSnapshotDecoder extends SnapshotDecoder<User> {
  @override
  User decode(DocumentSnapshot snap) {
    if (!snap.exists) {
      print('user(${snap.documentID}) does not exist');
      return null;
    }
    final data = snap.data;
    return User(
      id: snap.documentID,
      username: data['username'],
      name: data['name'],
      imageUrl: data['imageUrl'],
      about: data['about'],
    );
  }
}

class UserSnapshotEncoder extends SnapshotEncoder<User> {
  @override
  Map<String, dynamic> encode(User entity) {
    return {
      'username': entity.username,
      'name': entity.name,
      'imageUrl': entity.imageUrl,
      'about': entity.about
    };
  }
}
