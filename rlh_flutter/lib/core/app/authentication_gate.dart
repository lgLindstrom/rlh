import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/business/entityes/authentication_state.dart';
import 'package:rlh_flutter/core/app/authentication_gate_controller.dart';
import 'package:rlh_flutter/features/authorization/login/login_page.dart';
import 'package:rlh_flutter/features/authorization/register/register_page.dart';
import 'package:rlh_flutter/features/profile/user_profile_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class AuthenticationGate extends StatelessWidget {
  AuthenticationGate({super.key});
  final controller = GetIt.instance.get<AuthenticationGateController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AuthenticationState>(
      initialData: AuthenticationState.notAuthenticated,
      stream: controller.authenticationState,
      builder: (context, snapshot) {
        // loading..
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == AuthenticationState.authenticated) {
          return ProfilePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
