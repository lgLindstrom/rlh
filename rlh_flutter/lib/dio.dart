import 'package:get_it/get_it.dart';
import 'package:rlh_flutter/business/use_cases/verify_email_login.dart';
import 'package:rlh_flutter/core/app/authentication_gate_controller.dart';
import 'package:rlh_flutter/repository/authentication_service_impl.dart';
import 'package:rlh_flutter/business/services/authentication_service.dart';
import 'package:rlh_flutter/business/use_cases/signup_uc.dart';
import 'package:rlh_flutter/features/authorization/register/register_page_controller.dart';
import 'package:rlh_flutter/packages/logger/logger.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:rlh_client/rlh_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

class Dio {
  final sl = GetIt.instance;
  final ipAddress = 'localhost';

  Future<void> init() async {
    List<Publisher> publishers = [];
    publishers.add(ConsolePublisher());

    GetIt.instance.registerFactoryParam<Logger, String, dynamic>(
        (logger, _) => Logger(logger));

    //GetIt.instance.registerSingleton<UserProfileState>(UserProfileState());
    GetIt.instance
        .registerSingleton<AuthenticationService>(AuthenticationServiceImpl());



    // Use cases
    GetIt.instance.registerLazySingleton<SignOnUseCase>(() => SignOnUseCase());
    GetIt.instance
        .registerLazySingleton<VerifyEmailLogin>(() => VerifyEmailLogin());

    GetIt.instance.registerSingleton<Client>(Client('http://$ipAddress:8080/',
        authenticationKeyManager: FlutterAuthenticationKeyManager())
      ..connectivityMonitor = FlutterConnectivityMonitor());
    GetIt.instance.registerSingleton<SessionManager>(
        SessionManager(caller: GetIt.instance.get<Client>().modules.auth));

    GetIt.instance.registerFactory<RegisterPageController>(
        () => RegisterPageController());


    GetIt.instance.registerSingleton<AuthenticationGateController>(
        AuthenticationGateController());
    //GetIt.instance.registerFactoryParam<RegisterPageController,P1,void>(FactoryFuncParam<T,P1,P2> factoryfunc, {String instanceName});
  }
}
