import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class AuthUser {
  final String id;
  AuthUser({@required this.id});
}

abstract class Authenticator {
  Future<AuthUser> getOrCreateUser();
}

class FirebaseAuthenticator implements Authenticator {
  final _auth = FirebaseAuth.instance;
  Future<AuthUser> getOrCreateUser() async {
    final currentUser = await _auth.currentUser();
    if (currentUser != null) {
      print('currentUser: $currentUser');
      return AuthUser(id: currentUser.uid);
    }
    final result = await _auth.signInAnonymously();
    final user = result.user;
    print('user created: $user');
    return AuthUser(id: user.uid);
  }
}
