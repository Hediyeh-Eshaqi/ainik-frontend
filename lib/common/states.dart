import 'package:flutter/foundation.dart';

class States {
  static String UserToken = "";
  static int ClickedCharityID = 0;
  static int SelectedCharityWorkID = 0;
  static ValueNotifier<bool> reload = ValueNotifier(false);
  static List userQuestionAns = [];
}
