import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/business/services/baas_access.dart';
import 'package:rlh_flutter/business/services/authentication_service.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

class VerifyEmailLogin {
  //final userProfileState = GetIt.instance.get<UserProfileState>();
  final baas = GetIt.instance.get<AuthenticationService>();

  Future<BaasAccess> verifyEmail({
    required String email,
    required String code,
    required String passwd,
  }) async {
    var verify = await baas.verifyEmail(email, code);

    if (verify is BaasAccessFailure) {
      return BaasAccessFailure<String>('Unable_to_verify_email');
    }

    var login = await baas.signInWithEmailPassword(email, passwd);

    if (login is BaasAccessSuccess) {
      return BaasAccessSuccess<UserInfo>(login.data);
    }

    return BaasAccessFailure<String>('no_logged_in');
  }
}
