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
  Uri uri = URLs.getAllCharitiesUrl(from, to);
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
  Uri uri = URLs.getAllCharitieWorksUrl(from, to);
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
