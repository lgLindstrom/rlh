import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/business/entityes/authentication_state.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthenticationGateController {
  AuthenticationGateController() {
    session.addListener(listener);
    state.add(AuthenticationState.notAuthenticated);
  }
  get authenticationState => state.stream;
  void listener() {
    if (session.isSignedIn) {
      state.add(AuthenticationState.authenticated);
    } else {
      state.add(AuthenticationState.notAuthenticated);
    }
  }

  final SessionManager session = GetIt.instance.get<SessionManager>();

  final StreamController<AuthenticationState> state =
      StreamController.broadcast();
}
