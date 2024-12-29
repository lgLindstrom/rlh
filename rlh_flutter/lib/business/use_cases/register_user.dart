import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/business/services/baas_access.dart';
import 'package:rlh_flutter/business/services/authentication_service.dart';

class Register {
  //final userProfileState = GetIt.instance.get<UserProfileState>();
  final baas = GetIt.instance.get<AuthenticationService>();

  Future<BaasAccess> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    var result = await baas.createAccountWithEmail(
        name: name, email: email, password: password);

    //if sucess,, set state,,
    if (result is BaasAccessSuccess) {
      return result;
    }

    // Return Error code
    return BaasAccessFailure<String>(result.data as String);
  }
}
