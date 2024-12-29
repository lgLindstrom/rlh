class Validation {
  static String? email(String email) {
    if (email.isEmpty || email.length <= 6) return "password_to_short";
    return null;
  }

  static String? name(String name) {
    if (name.isEmpty || name.length < 4) {
      return 'name_to_sort';
    }

    return null;
  }

  static String? password(String password) {
    return null;
  }
}
