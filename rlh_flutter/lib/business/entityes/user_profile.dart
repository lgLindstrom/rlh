class UserProfile {
  final String? id;
  final String? fullname;
  final String email;
  final bool activeProfile;
  final bool emailVerification;

  UserProfile({
    this.id,
    this.fullname,
    required this.email,
    required this.activeProfile,
    required this.emailVerification,
  });

  factory UserProfile.fromMap(Map<String, dynamic> postMap) {
    return UserProfile(
      id: postMap['id'] as String,
      fullname: postMap['content'] as String,
      email: postMap['email'] as String,
      activeProfile: postMap['active'] as bool,
      emailVerification: postMap['emailVerification'] as bool,
    );
  }

  // post -> map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'Fullname': fullname,
      'email': email,
    };
  }
}
