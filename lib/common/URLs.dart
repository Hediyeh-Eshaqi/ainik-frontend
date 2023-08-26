class URLs {
  static String baseUrl = "http://127.0.0.1:8000";
  static String registerUrl = "/auth/users/";
  static String loginUrl = "/auth/token/login/";
  static String allCharitiesUrl = "/charity/list?";
  static String allCharitiesWorkUrl = "/charity/charity_work/list?";
  static getRegisterUrl() {
    return Uri.parse(baseUrl + registerUrl);
  }

  static getLoginUrl() {
    return Uri.parse(baseUrl + loginUrl);
  }

  static getAllCharitiesUrl(String from, String to) {
    return Uri.parse(baseUrl + allCharitiesUrl + "from=" + from + "&to=" + to);
  }

  static getAllCharitieWorksUrl(String from, String to) {
    return Uri.parse(
        baseUrl + allCharitiesWorkUrl + "from=" + from + "&to=" + to);
  }
}
