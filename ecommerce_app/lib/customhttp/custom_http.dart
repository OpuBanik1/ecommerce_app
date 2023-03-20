import 'dart:convert';

import 'package:ecommerce_app/navbar/order_page.dart';
import 'package:ecommerce_app/widget/common_widget.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomHttp {
  static Future<Map<String, String>> getHeadersWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
    };
    return header;
  }
}
