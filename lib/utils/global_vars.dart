// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String newToken;
late String clientId;
Map currentUser = {};
var globalContext;
List<dynamic> bannersOnline = [];
String loadImage = "https://tmpfiles.org/dl/16081450/capturedecran2024-11-20a11.20.45.png";

checkConsecutif(value) {
  int tmp = int.parse(value[0]);
  return tmp + 1 == int.parse(value[1]) &&
      tmp + 2 == int.parse(value[2]) &&
      tmp + 3 == int.parse(value[3]);
}

checkRepetitif(value) {
  int tmp = int.parse(value[0]);
  return tmp == int.parse(value[1]) &&
      tmp == int.parse(value[2]) &&
      tmp == int.parse(value[3]);
}