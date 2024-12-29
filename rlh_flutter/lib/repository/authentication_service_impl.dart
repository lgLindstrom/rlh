import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:rlh_client/rlh_client.dart';
import 'package:rlh_flutter/business/error_codes.dart';
import 'package:rlh_flutter/business/services/baas_access.dart';
import 'package:rlh_flutter/business/services/authentication_service.dart';
import 'package:rlh_flutter/src/serverpod_client.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
 

class AuthenticationServiceImpl implements AuthenticationService {
  AuthenticationServiceImpl() {}

  @override
  Future<BaasAccess> createAccountWithEmail(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var client = GetIt.instance.get<Client>();

      var auth = EmailAuthController(client.modules.auth);
      var result = await auth.createAccountRequest(name, email, password);
      if (result) {
        return BaasAccessSuccess<String>('sucess');
      }

      return BaasAccessFailure<String>('Unknown error');
    } catch (e) {
      return BaasAccessFailure<String>(ErrorCodes.mapAuthenticationErrors(0));
    }
  }

  @override
  Future<BaasAccess> signInWithEmailPassword(
      String email, String password) async {

    var client = GetIt.instance.get<Client>();
    var auth = EmailAuthController(client.modules.auth);

    try {
      
      var result = await auth.signIn(email,password);

      if (result != null) return BaasAccessSuccess<UserInfo>(result);

      return BaasAccessFailure<String>("Unable to log in");
    } catch (e) {
 
      return const BaasAccessFailure<String>('Unknown Failusre');
 
    }
    
  }

  @override
  Future<BaasAccess> signOut() {
    return Future.value(const BaasAccessFailure('Not mplemented'));
  }

  @override
   BaasAccess getCurrentUser()  {
    var session = GetIt.instance.get<SessionManager>();

    UserInfo? user =  session.signedInUser;

    if (user != null) {
      return   BaasAccessSuccess<UserInfo>(user);
    }

    return  const BaasAccessFailure<String>('');
  }

  /*  @override
  Stream<AuthenticationState> athenticateStateChanged() {
    return _authState.stream;
  } */

/*   final _client = Client().setEndpoint(endpoint).setProject(project);

  final StreamController<AuthenticationState> _authState =
      StreamController<AuthenticationState>.broadcast();

  late Realtime realtime = Realtime(_client);
  late RealtimeSubscription accountSubscription =
      realtime.subscribe(['account']);
  late Account account = Account(_client); */

  @override
  Future<BaasAccess> verifyEmail(String email, String verificationCode) async {
    var client = GetIt.instance.get<Client>();
    var auth = EmailAuthController(client.modules.auth);

    

    var result = await auth.validateAccount(email, verificationCode);

    return result != null
        ? BaasAccessSuccess<String>('sucess')
        : const BaasAccessFailure<String>('Not iplemented');
  }
}
