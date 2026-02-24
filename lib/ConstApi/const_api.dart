
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ConstApi{
  Future<dynamic> getHitAPI( Map map, String funcName) async {

    var response = await http
        .post(Uri.parse(funcName), body: jsonEncode(map), headers: {'Content-Type': 'application/json'});
    print('''
        \n Url : ${funcName} \n
        \n RequestMap : ${jsonEncode(map)} \n
        \n Response Body : ${response.body} \n
        ''');

    if (response.statusCode == 200) {

      Map responseMap = jsonDecode(response.body);
      if (responseMap["Status"].toString().toUpperCase() == "SUCCESS".toUpperCase()) {
        return Future.value(responseMap);
      } else {
        return Future.error(responseMap["Message"]);
      }
    } else {
      return Future.error("Not found");
    }
  }

}