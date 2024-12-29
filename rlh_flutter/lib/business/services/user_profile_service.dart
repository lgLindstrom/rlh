import 'package:rlh_flutter/business/entityes/user_profile.dart';

abstract class UserProfileService {
  Future add(UserProfile user);

  Future<UserProfile> get(String id);

  Future update(UserProfile user);

  Future remove(UserProfile user);
}
