class ErrorCodes {
  final Map<int, String> codes = {
    0: 'Unknown error',
    409: 'User already exists',
    429: 'Backend error'
  };

  static String mapAuthenticationErrors(int code) {
    if (ErrorCodes().codes.containsKey(code)) {
      return ErrorCodes().codes[code]!;
    }
    return 'Unknown error';
  }
}
