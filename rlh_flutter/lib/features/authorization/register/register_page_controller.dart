import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/business/services/baas_access.dart';
import 'package:rlh_flutter/business/use_cases/verify_email_login.dart';
import 'package:rlh_flutter/features/authorization/register/register_page_state.dart';
import 'package:rlh_flutter/business/use_cases/signup_uc.dart';
import 'package:rlh_flutter/business/services/ui_update.dart';

class RegisterPageController {
  get state => stateController.stream;
  get snackBar => snackbarController.stream;

  final stateController = StreamController<RegisterPageState>.broadcast();
  final snackbarController = StreamController<String>.broadcast();

  Future<UiUpdate> registerUser(
      {required String name,
      required String email,
      required String password}) async {
    var result = await _onboarding.registerUser(
        name: name, email: email, password: password);

    if (result is BaasAccessSuccess) {
      stateController.add(RegisterPageState.verify);
      return UiUpdateSuccess('');
    } else {
      return UiUpdateMessage(result.data as String);
    }
  }

  Future<UiUpdate> verifyEmail(String email, String code, String passwd) async {
    var verify = GetIt.instance.get<VerifyEmailLogin>();

    var result =
        await verify.verifyEmail(email: email, code: code, passwd: passwd);

    if (result is BaasAccessSuccess) {
      return UiUpdateSuccess('Logged in');
    }

    return UiUpdateMessage('No success');
  }

  final SignOnUseCase _onboarding = GetIt.instance.get<SignOnUseCase>();
}
