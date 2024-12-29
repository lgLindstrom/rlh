import 'package:rlh_flutter/business/services/baas_access.dart';


abstract class AuthenticationService {
  Future<BaasAccess> signInWithEmailPassword(String email, String password);

  ///
  /// ## Sign upp to baas with email and password.
  /// The procedure should be as follow.
  /// 1. Create account at baas
  /// 2. Sign in to baas
  /// 3. Initiate email verification mail
  /// 4. Return user profile or error message.
  ///
  /// Error messages.
  /// 1a.  email/password not correct
  /// 1b.  account alredy exists
  /// 1c.  error, try later
  ///
  /// 2a. error, try later
  ///
  /// 3a. error, try later
  ///
  /// 4a. return userProfile or error message according to above
  Future<BaasAccess> createAccountWithEmail(
      {required String name, required String email, required String password});

  Future<BaasAccess> verifyEmail(String email, String code);

  Future<BaasAccess> signOut();

   BaasAccess  getCurrentUser();

  //Stream<AuthenticationState> athenticateStateChanged();
}
