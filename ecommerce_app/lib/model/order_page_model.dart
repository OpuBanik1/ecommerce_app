class OrderModel {
  int? id;
  int? quantity;
  int? price;
  Null? discount;
  Null? vAT;
  String? orderDateAndTime;
  User? user;
  Payment? payment;
  OrderStatus? orderStatus;

  OrderModel(
      {this.id,
      this.quantity,
      this.price,
      this.discount,
      this.vAT,
      this.orderDateAndTime,
      this.user,
      this.payment,
      this.orderStatus});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    vAT = json['VAT'];
    orderDateAndTime = json['order_date_and_time'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    payment =
        json['payment'] != null ? new Payment.fromJson(json['payment']) : null;
    orderStatus = json['order_status'] != null
        ? new OrderStatus.fromJson(json['order_status'])
        : null;
  }
}

class User {
  int? id;
  String? name;

  User({this.id, this.name});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

class Payment {
  int? paymentStatus;

  Payment({this.paymentStatus});

  Payment.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['payment_status'];
  }
}

class OrderStatus {
  User? orderStatusCategory;

  OrderStatus({this.orderStatusCategory});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    orderStatusCategory = json['order_status_category'] != null
        ? new User.fromJson(json['order_status_category'])
        : null;
  }
}
