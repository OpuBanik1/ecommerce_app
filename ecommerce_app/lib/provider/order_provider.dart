import 'package:ecommerce_app/customhttp/custom_http.dart';
import 'package:ecommerce_app/model/order_page_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order_provider with ChangeNotifier {
  List<OrderModel> orderList = [];

  getOrderList() async {
    orderList = await CustomHttp.fetchOrderData();
    notifyListeners();
  }
}
