class AuthenticationException implements Exception {
  String message;
  AuthenticationException(this.message);
}

class SignUpException implements Exception {
  String message;
  SignUpException(this.message);
}