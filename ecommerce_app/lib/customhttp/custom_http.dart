import 'dart:convert';
import 'package:http/http.dart ' as http;
import 'package:ecommerce_app/widget/common_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/order_page_model.dart';

class CustomHttp {
  static Future<Map<String, String>> getHeadersWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
    };

    return header;
  }

  static Future<List<OrderModel>> fetchOrderData() async {
    List<OrderModel> orderList = [];
    OrderModel orderModel;
    var link = '${baseUrl}all/orders';
    var response = await http.get(Uri.parse(link),
        headers: await CustomHttp.getHeadersWithToken());
    var data = jsonDecode(response.body);
    for (var i in data) {
      orderModel = OrderModel.fromJson(i);
      orderList.add(orderModel);
    }
    return orderList;
  }
   static Future<List<OrderModel>> fetchCategoryData() async {
    List<OrderModel> orderList = [];
    OrderModel orderModel;
    var link = '${baseUrl}category';
    var response = await http.get(Uri.parse(link),
        headers: await CustomHttp.getHeadersWithToken());
    var data = jsonDecode(response.body);
    for (var i in data) {
      orderModel = OrderModel.fromJson(i);
      orderList.add(orderModel);
    }
    return orderList;
  }
}
