class GetShippingMethodsResponse {
  GetShippingMethodsResponse({
    this.success,
    this.data,
  });

  factory GetShippingMethodsResponse.fromJson(dynamic json) {
    var success = json['success'];

    var data = json['data'] != null ? Data.fromJson(json['data']) : null;

    return GetShippingMethodsResponse(success: success, data: data);
  }
  num? success;
  Data? data;
}

class Data {
  Data({
    this.shippingMethods,
    this.code,
    this.comment,
  });

  factory Data.fromJson(dynamic json) {
    List<ShippingMethod>? shippingMethods;
    if (json['shipping_methods'] != null) {
      shippingMethods = [];
      json['shipping_methods'].forEach((v) {
        shippingMethods?.add(ShippingMethod.fromJson(v));
      });
    }
    var code = json['code'];
    var comment = json['comment'];

    return Data(code: code, comment: comment, shippingMethods: shippingMethods);
  }
  List<ShippingMethod>? shippingMethods;
  String? code;
  String? comment;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   if (shippingMethods != null) {
  //     map['shipping_methods'] =
  //         shippingMethods?.map((v) => v.toJson()).toList();
  //   }
  //   map['code'] = code;
  //   map['comment'] = comment;
  //   return map;
  // }
}

class ShippingMethod {
  ShippingMethod({
    this.title,
    this.quote,
    this.sortOrder,
    this.error,
  });

  factory ShippingMethod.fromJson(dynamic json) {
    var title = json['title'];
    List<Quote>? quote;
    if (json['quote'] != null) {
      quote = [];
      json['quote'].forEach((v) {
        quote?.add(Quote.fromJson(v));
      });
    }
    var sortOrder = json['sort_order'];
    var error = json['error'];

    return ShippingMethod(
        title: title, error: error, quote: quote, sortOrder: sortOrder);
  }
  String? title;
  List<Quote>? quote;
  String? sortOrder;
  bool? error;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['title'] = title;
  //   if (quote != null) {
  //     map['quote'] = quote?.map((v) => v.toJson()).toList();
  //   }
  //   map['sort_order'] = sortOrder;
  //   map['error'] = error;
  //   return map;
  // }
}

class Quote {
  Quote({
    this.code,
    this.title,
    this.cost,
    this.taxClassId,
    this.text,
  });

  factory Quote.fromJson(dynamic json) {
    var code = json['code'];
    var title = json['title'];
    var cost = json['cost'];
    var taxClassId = json['tax_class_id'];
    var text = json['text'];
    return Quote(
        title: title,
        code: code,
        text: text,
        cost: cost,
        taxClassId: taxClassId);
  }
  String? code;
  String? title;
  String? cost;
  String? taxClassId;
  String? text;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['code'] = code;
  //   map['title'] = title;
  //   map['cost'] = cost;
  //   map['tax_class_id'] = taxClassId;
  //   map['text'] = text;
  //   return map;
  // }
}
