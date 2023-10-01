class GetPaymentMethodsResponse {
  GetPaymentMethodsResponse({
    this.success,
    this.data,
  });

  factory GetPaymentMethodsResponse.fromJson(dynamic json) {
    var success = json['success'];
    var data = json['data'] != null ? Data.fromJson(json['data']) : null;
    return GetPaymentMethodsResponse(data: data, success: success);
  }
  num? success;
  Data? data;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.toJson();
  //   }
  //   return map;
  // }
}

class Data {
  Data({
    this.paymentMethods,
  });

  factory Data.fromJson(dynamic json) {
    List<PaymentMethod>? paymentMethods;
    if (json['payment_methods'] != null) {
      paymentMethods = [];
      json['payment_methods'].forEach((v) {
        paymentMethods?.add(PaymentMethod.fromJson(v));
      });
    }
    return Data(paymentMethods: paymentMethods);
  }
  List<PaymentMethod>? paymentMethods;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (paymentMethods != null) {
  //     map['payment_methods'] = paymentMethods?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class PaymentMethod {
  PaymentMethod({
    this.code,
    this.title,
    this.terms,
    this.sortOrder,
  });

  factory PaymentMethod.fromJson(dynamic json) {
    var code = json['code'];
    var title = json['title'];
    var terms = json['terms'];
    var sortOrder = json['sort_order'];
    return PaymentMethod(code: code,title: title,sortOrder: sortOrder,terms: terms);
  }
  String? code;
  String? title;
  String? terms;
  String? sortOrder;
  //
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['code'] = code;
  //   map['title'] = title;
  //   map['terms'] = terms;
  //   map['sort_order'] = sortOrder;
  //   return map;
  // }
}
