class URLs {
  static String baseUrl = "http://127.0.0.1:8000";
  static String registerUrl = "/auth/users/";
  static String loginUrl = "/auth/token/login/";
  static String allCharitiesUrl = "/charity/list?";
  static String allCharitiesWorkUrl = "/charity/charity_work/list?";
  static String createCharityUrl = "/charity/create";
  static String myCharitiesUrl = "/user/charites/";
  static String charityData = "/charity/";
  static String personalityComps = "/user/personalityComponents/";
  static String userInfo = "/user/edit/";
  static String recommendations = "/user/recommendations/";
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

  static getCreateCharityUrl() {
    return Uri.parse(baseUrl + createCharityUrl);
  }

  static getMyCharitesUrl() {
    return Uri.parse(baseUrl + myCharitiesUrl);
  }

  static getCharityDataUrl(String id) {
    return Uri.parse(baseUrl + charityData + "${id}/");
  }

  static getAddCharityWorkUrl(String id) {
    return Uri.parse(baseUrl + charityData + id + "/addwork");
  }

  static getDeletCharityWorkUrl(String charityId, String CharityWorkID) {
    return Uri.parse(
        baseUrl + charityData + charityId + "/delete/" + CharityWorkID);
  }

  static getDeletCharity(String charityId) {
    return Uri.parse(baseUrl + charityData + charityId + "/delete");
  }

  static getPersonalityCompsUrl() {
    return Uri.parse(baseUrl + personalityComps);
  }

  static getUserInfoUrl() {
    return Uri.parse(baseUrl + userInfo);
  }

  static getRecommedationsUrl() {
    return Uri.parse(baseUrl + recommendations);
  }
}
