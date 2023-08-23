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
