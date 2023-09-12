import 'dart:convert';

import 'package:ainik_frontend/common/URLs.dart';
import 'package:ainik_frontend/common/states.dart';
import 'package:http/http.dart';

Future<String> register(
    {required email, required password, required rePassword}) async {
  Uri uri = URLs.getRegisterUrl();
  Response response = await post(
    uri,
    body: {"email": email, "password": password, "re_password": rePassword},
  );
  String message;
  if (response.statusCode == 201) {
    message = "ok";
  } else {
    message = response.body.toString();
  }
  await login(email: email, password: password);
  print(message);
  return message;
}

Future<String> login({required email, required password}) async {
  Uri uri = URLs.getLoginUrl();
  Response response = await post(
    uri,
    body: {"email": email, "password": password},
  );
  String message;
  if (response.statusCode == 200) {
    message = "ok";
    Map<String, dynamic> responseJson =
        json.decode(utf8.decode(response.bodyBytes));
    States.UserToken = responseJson["auth_token"];
  } else {
    message = response.body.toString();
  }

  print(States.UserToken);
  return message;
}

Future<List<dynamic>> allCharities({required from, required to}) async {
  Uri uri = URLs.getAllCharitiesUrl(from, "100");
  Response response = await get(
    uri,
    headers: {"Authorization": "token " + States.UserToken},
  );
  String message;
  List<dynamic> responseJson = [];
  if (response.statusCode == 200) {
    message = "ok";
    responseJson = json.decode(utf8.decode(response.bodyBytes));
  } else {
    message = "not ok";
  }

  return responseJson;
}

Future<List<dynamic>> allCharitiesWork({required from, required to}) async {
  Uri uri = URLs.getAllCharitieWorksUrl(from, "100");
  Response response = await get(
    uri,
    headers: {"Authorization": "token " + States.UserToken},
  );
  String message;
  List<dynamic> responseJson = [];
  if (response.statusCode == 200) {
    message = "ok";
    responseJson = json.decode(utf8.decode(response.bodyBytes));
  } else {
    message = "not ok";
  }

  return responseJson;
}

Future<String> createCharity(
    {required name, required address, required description}) async {
  Uri uri = URLs.getCreateCharityUrl();
  Response response = await post(
    uri,
    body: {
      "name": name,
      "address": address,
      "description": description,
    },
    headers: {"Authorization": "token " + States.UserToken},
  );
  String message;

  if (response.statusCode == 201) {
    message = "ok";
  } else {
    message = "not ok";
  }
  States.reload.value = !States.reload.value;
  return message;
}

Future<List<dynamic>> myCharities() async {
  Uri uri = URLs.getMyCharitesUrl();
  Response response = await get(
    uri,
    headers: {"Authorization": "token " + States.UserToken},
  );
  List<dynamic> responseJson = [];
  if (response.statusCode == 200) {
    responseJson = json.decode(utf8.decode(response.bodyBytes));
  }

  return responseJson;
}

Future<Map<String, dynamic>> getCharityData() async {
  Uri uri = URLs.getCharityDataUrl(States.ClickedCharityID.toString());
  Response response = await get(
    uri,
    headers: {"Authorization": "token " + States.UserToken},
  );

  return json.decode(utf8.decode(response.bodyBytes));
}

Future<String> addCharityWork({
  required tittle,
  required type,
}) async {
  Uri uri = URLs.getAddCharityWorkUrl(States.ClickedCharityID.toString());
  Response response = await post(
    uri,
    body: jsonEncode({"title": tittle, "type": type}),
    headers: {
      "Authorization": "token " + States.UserToken,
      'Content-Type': 'application/json'
    },
  );
  String message;

  if (response.statusCode == 201) {
    message = "ok";
  } else {
    message = "not ok";
  }
  States.reload.value = !States.reload.value;
  return message;
}

Future<String> DeleteCharityWork() async {
  Uri uri = URLs.getDeletCharityWorkUrl(States.ClickedCharityID.toString(),
      States.SelectedCharityWorkID.toString());
  Response response = await delete(
    uri,
    headers: {
      "Authorization": "token " + States.UserToken,
      'Content-Type': 'application/json'
    },
  );
  String message;

  if (response.statusCode == 200) {
    message = "ok";
  } else {
    message = "not ok";
  }
  print(message);
  States.reload.value = !States.reload.value;
  return message;
}

Future<String> DeleteCharity() async {
  Uri uri = URLs.getDeletCharity(States.ClickedCharityID.toString());

  Response response = await delete(
    uri,
    headers: {
      "Authorization": "token " + States.UserToken,
      'Content-Type': 'application/json'
    },
  );
  String message;

  if (response.statusCode == 200) {
    message = "ok";
  } else {
    message = "not ok";
  }
  States.reload.value = !States.reload.value;
  print(message);
  return message;
}

Future<String> SetUserPersonalityComponents(var gender, var age) async {
  Uri uri = URLs.getPersonalityCompsUrl();

  Response response = await post(
    uri,
    body: jsonEncode({
      "age": age,
      "gender": gender,
      "q1": States.userQuestionAns[0],
      "q2": States.userQuestionAns[1],
      "q3": States.userQuestionAns[2],
      "q4": States.userQuestionAns[3],
      "q5": States.userQuestionAns[4],
      "q6": States.userQuestionAns[5],
      "q7": States.userQuestionAns[6],
      "q8": States.userQuestionAns[7]
    }),
    headers: {
      "Authorization": "token " + States.UserToken,
      'Content-Type': 'application/json'
    },
  );
  String message;

  if (response.statusCode == 201) {
    message = "ok";
  } else {
    message = "not ok";
  }
  print(message);
  return message;
}

Future<Map<String, dynamic>> GetUserInfo() async {
  Uri uri = URLs.getUserInfoUrl();
  Response response = await get(
    uri,
    headers: {"Authorization": "token " + States.UserToken},
  );
  String message;
  Map<String, dynamic> responseJson = {};
  if (response.statusCode == 200) {
    message = "ok";
    responseJson = json.decode(utf8.decode(response.bodyBytes));
  } else {
    message = "not ok";
  }

  return responseJson;
}

Future<String> EditUserInfo({required name, required lastname}) async {
  Uri uri = URLs.getUserInfoUrl();
  Response response = await post(
    uri,
    body: {
      "name": name,
      "lastName": lastname,
    },
    headers: {"Authorization": "token " + States.UserToken},
  );
  String message;

  if (response.statusCode == 200) {
    message = "ok";
  } else {
    message = "not ok";
  }
  States.reload.value = !States.reload.value;
  return message;
}

Future<List<dynamic>> RecommendedCharitiesWork() async {
  Uri uri = URLs.getRecommedationsUrl();
  Response response = await get(
    uri,
    headers: {"Authorization": "token " + States.UserToken},
  );
  String message;
  List<dynamic> responseJson = [];
  if (response.statusCode == 200) {
    message = "ok";
    responseJson = json.decode(utf8.decode(response.bodyBytes));
  } else {
    message = "not ok";
  }

  return responseJson;
}
