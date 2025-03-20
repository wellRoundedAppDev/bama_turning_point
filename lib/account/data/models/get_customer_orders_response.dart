/// success : 1
/// error : []
/// data : [{"order_id":"35","name":"Demo User","status":"Pending","date_added":"05pm31UTC_f2023Thu, 05 Oct 2023 12:38:28 +000010pm31_28122023Thu, 05 Oct 2023 12:38:28 +000031","products":3,"total":"$2,605.00","currency_code":"USD","currency_value":"1.00000000","total_raw":"2605.0000","timestamp":1696509508,"currency":{"currency_id":"2","symbol_left":"$","symbol_right":"","decimal_place":"2","value":"1.00000000"}},{"order_id":"34","name":"Demo User","status":"Pending","date_added":"05am31UTC_f2023Thu, 05 Oct 2023 10:33:15 +000010am31_15102023Thu, 05 Oct 2023 10:33:15 +000031","products":6,"total":"$8,645.97","currency_code":"USD","currency_value":"1.00000000","total_raw":"8645.9700","timestamp":1696501995,"currency":{"currency_id":"2","symbol_left":"$","symbol_right":"","decimal_place":"2","value":"1.00000000"}}]

class GetCustomerOrdersResponse {
  GetCustomerOrdersResponse({
    this.success,
    this.customerOrders,
  });

  factory GetCustomerOrdersResponse.fromJson(dynamic json) {
    var success = json['success'];
    List<CustomerOrder>? data;

    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        print(v);
        data?.add(CustomerOrder.fromJson(v));
      });
    }
    return GetCustomerOrdersResponse(success: success, customerOrders: data);
  }
  dynamic? success;
  // List<dynamic>? error;
  List<CustomerOrder>? customerOrders;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

/// order_id : "35"
/// name : "Demo User"
/// status : "Pending"
/// date_added : "05pm31UTC_f2023Thu, 05 Oct 2023 12:38:28 +000010pm31_28122023Thu, 05 Oct 2023 12:38:28 +000031"
/// products : 3
/// total : "$2,605.00"
/// currency_code : "USD"
/// currency_value : "1.00000000"
/// total_raw : "2605.0000"
/// timestamp : 1696509508
/// currency : {"currency_id":"2","symbol_left":"$","symbol_right":"","decimal_place":"2","value":"1.00000000"}

class CustomerOrder {
  CustomerOrder({
    this.orderId,
    this.name,
    this.status,
    this.dateAdded,
    this.numOfProducts,
    this.total,
    this.currencyCode,
    this.currencyValue,
    this.totalRaw,
    this.timestamp,
   // this.currency,
  });

  factory CustomerOrder.fromJson(dynamic json) {
    var orderId = json['order_id'];
    var name = json['name'];
    var status = json['status'];
    var dateAdded = json['date_added'];
    var products = json['products'];
    var total = json['total'];
    var currencyCode = json['currency_code'];
    var currencyValue = null;
    var totalRaw = json['total_raw'];
    var timestamp = json['timestamp'];
    // var currency =
    //     json['currency'] != null ? Currency.fromJson(json['currency']) : null;

    return CustomerOrder(
     // currency: currency,
      currencyCode: currencyCode,
    //  currencyValue: currencyValue,
      dateAdded: dateAdded,
      name: name,
      orderId: orderId,
      numOfProducts: products,
      status: status,
      timestamp: timestamp,
      total: total,
      totalRaw: totalRaw,
    );
  }
  dynamic? orderId;
  dynamic? name;
  dynamic? status;
  dynamic? dateAdded;
  dynamic? numOfProducts;
  dynamic? total;
  dynamic? currencyCode;
  dynamic? currencyValue;
  dynamic? totalRaw;
  dynamic? timestamp;
  //Currency? currency;
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['order_id'] = orderId;
  //   map['name'] = name;
  //   map['status'] = status;
  //   map['date_added'] = dateAdded;
  //   map['products'] = products;
  //   map['total'] = total;
  //   map['currency_code'] = currencyCode;
  //   map['currency_value'] = currencyValue;
  //   map['total_raw'] = totalRaw;
  //   map['timestamp'] = timestamp;
  //   if (currency != null) {
  //     map['currency'] = currency?.toJson();
  //   }
  //   return map;
  // }
}

/// currency_id : "2"
/// symbol_left : "$"
/// symbol_right : ""
/// decimal_place : "2"
/// value : "1.00000000"

// class Currency {
//   Currency({
//     this.currencyId,
//     this.symbolLeft,
//     this.symbolRight,
//     this.decimalPlace,
//     this.value,
//   });
//
//   Currency.fromJson(dynamic json) {
//     currencyId = json['currency_id'];
//     symbolLeft = json['symbol_left'];
//     symbolRight = json['symbol_right'];
//     decimalPlace = json['decimal_place'];
//     value = json['value'];
//   }
//   String? currencyId;
//   String? symbolLeft;
//   String? symbolRight;
//   String? decimalPlace;
//   String? value;
//
//   // Map<String, dynamic> toJson() {
//   //   final map = <String, dynamic>{};
//   //   map['currency_id'] = currencyId;
//   //   map['symbol_left'] = symbolLeft;
//   //   map['symbol_right'] = symbolRight;
//   //   map['decimal_place'] = decimalPlace;
//   //   map['value'] = value;
//   //   return map;
//   // }
// }
