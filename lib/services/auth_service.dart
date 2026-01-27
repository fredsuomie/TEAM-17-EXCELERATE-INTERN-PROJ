class AuthService {
  static const String demoEmail = "test@gmail.com";
  static const String demoPassword = "123456";

  static bool login(String email, String password) {
    return email == demoEmail && password == demoPassword;
  }
}
