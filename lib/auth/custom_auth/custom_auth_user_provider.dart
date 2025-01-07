import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class RentovaAuthUser {
  RentovaAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<RentovaAuthUser> rentovaAuthUserSubject =
    BehaviorSubject.seeded(RentovaAuthUser(loggedIn: false));
Stream<RentovaAuthUser> rentovaAuthUserStream() => rentovaAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
