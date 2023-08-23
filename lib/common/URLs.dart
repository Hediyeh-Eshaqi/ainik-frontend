class URLs {
  static String baseUrl = "http://127.0.0.1:8000";
  static String registerUrl = "/auth/users/";
  static String loginUrl = "/auth/token/login/";
  static getRegisterUrl() {
    return Uri.parse(baseUrl + registerUrl);
  }

  static getLoginUrl() {
    return Uri.parse(baseUrl + loginUrl);
  }
}
