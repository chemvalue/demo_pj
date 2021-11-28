import 'dart:convert';
import 'dart:core';
import 'package:demo_pj/models/store.model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

bool phoneCheck(String phone) {
  print(RegExp(cPHONE_VALIDATE).hasMatch(phone));
  return RegExp(cPHONE_VALIDATE).hasMatch(phone);
}

bool emailCheck(String email) {
  return RegExp(cEMAIL_VALIDATE).hasMatch(email);
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

Future<StoreModel?> getStoreList() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? storeStr = prefs.getString('store');
  if (storeStr != null) {
    StoreModel storeModel = StoreModel.fromJson(jsonDecode(storeStr));

    return storeModel;
  }
  return null;
}

Future registerNewAccount(StoreModel store) async {

  final SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.setString('store', jsonEncode(store.toJson()));

}

Future<StoreModel?> storeRegistered(String input) async {
  StoreModel? storeModel = await getStoreList();
  if (storeModel != null) {
    if (input == storeModel.phone) {
      return storeModel;
    }
  }
  return null;
}
