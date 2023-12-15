import 'dart:convert';
import 'dart:ui';

import 'package:ecommerce_app/customhttp/custom_http.dart';
import 'package:ecommerce_app/model/order_page_model.dart';
import 'package:ecommerce_app/provider/order_provider.dart';
import 'package:ecommerce_app/widget/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:provider/provider.dart';

class Order_page extends StatefulWidget {
  static Order_page? fromJson;

  const Order_page({super.key});

  @override
  State<Order_page> createState() => _Order_pageState();
}

class _Order_pageState extends State<Order_page> {
  @override
  void initState() {
    Provider.of<Order_provider>(context, listen: false).getOrderList();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final orderList= Provider.of<Order_provider>(context).orderList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            'Order item',
            style: TextStyle(color: Colors.white, fontSize: 26),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: orderList.isEmpty
            ? spinkit
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: orderList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var clr = orderList[index]
                              .orderStatus!
                              .orderStatusCategory!
                              .id;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 10, top: 10, bottom: 5),
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        offset: const Offset(
                                          5.0,
                                          5.0,
                                        ),
                                        blurRadius: 10.0,
                                        spreadRadius: 2.0,
                                      ), //BoxShadow
                                      BoxShadow(
                                        color: Colors.white,
                                        offset: const Offset(0.0, 0.0),
                                        blurRadius: 0.0,
                                        spreadRadius: 0.0,
                                      ), //BoxShadow
                                    ]),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  clr == 1
                                                      ? Icons.snowmobile_sharp
                                                      : clr == 2
                                                          ? Icons.abc
                                                          : Icons
                                                              .zoom_in_map_sharp,
                                                  color: clr == 1
                                                      ? Colors.red
                                                      : clr == 2
                                                          ? Colors.green
                                                          : Colors.blue,
                                                ),
                                                Text(
                                                  'Order id:' +
                                                      orderList[index]
                                                          .id
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.cyanAccent,
                                                      fontSize: 20),
                                                )
                                              ],
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${orderList[index].user!.name}',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.teal),
                                                ),
                                                SizedBox(
                                                  height: 24,
                                                ),
                                                Text(
                                                  "${orderList[index].price}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors
                                                          .deepPurpleAccent),
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
      ),
    );
  }
}
