
class PurchaseRequestDetailsResponse {
  final bool isSucceeded;
  final String message;
  final PurchaseRequestDetailData? obj;

  PurchaseRequestDetailsResponse({
    required this.isSucceeded,
    required this.message,
    required this.obj,
  });

  factory PurchaseRequestDetailsResponse.fromJson(Map<String, dynamic> json) {
    return PurchaseRequestDetailsResponse(
      isSucceeded: json['IsSuccssed'] as bool,
      message: json['Message'] as String,
      obj: json['Obj'] != null
          ? PurchaseRequestDetailData.fromJson(json['Obj'])
          : null,
    );
  }
}

class PurchaseRequestDetailData {
  final int? id;
  final DateTime requestDate;
  final String? requestNumber;
  final String? customerName;
  final int? status;
  final List<PurchaseRequestDetail?> purchaseRequestDetails;

  PurchaseRequestDetailData({
    required this.id,
    required this.requestDate,
    required this.requestNumber,
    required this.customerName,
    required this.status,
    required this.purchaseRequestDetails,
  });

  factory PurchaseRequestDetailData.fromJson(Map<String, dynamic> json) {
    return PurchaseRequestDetailData(
      id: json['Id'] as int?,
      requestDate: DateTime.parse(json['RequestDate']),
      requestNumber: json['RequestNumber'] as String?,
      customerName: json['CustomerName'] as String?,
      status: json['Status'] as int,
      purchaseRequestDetails: (json['PurchaseRequestDetails'] as List)
          .map((e) => PurchaseRequestDetail.fromJson(e))
          .toList(),
    );
  }
}

class PurchaseRequestDetail {
  final String? productName;
  final double? qty;
  final String? unitName;
  final int? productSource;
  final int? productId;
  final num? price;

  PurchaseRequestDetail({
    required this.productName,
    required this.qty,
    required this.unitName,
    required this.productSource,
    required this.productId,
    required this.price
  });

  factory PurchaseRequestDetail.fromJson(Map<String, dynamic> json) {
    return PurchaseRequestDetail(
      productName: json['ProductName'] as String?,
      qty: json['Qty'] as double?,
      unitName: json['UnitName'] as String?,
      productSource: json['ProductSource'] as int?,
      productId: json['ProductId'] as int?,
      price: json['Price']
    );
  }
}




class GetOrderDetailsResponse {
  GetOrderDetailsResponse({
    this.success,
    // this.error,
    this.orderDetails,
  });

  factory GetOrderDetailsResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data =
        json['data'] != null ? OrderDetails.fromJson(json['data']) : null;
    return GetOrderDetailsResponse(success: success, orderDetails: data);
  }
  num? success;
  //List<dynamic>? error;
  OrderDetails? orderDetails;

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

class OrderDetails {
  OrderDetails(
      {this.orderId,
      // this.paymentCustomField,
      // this.shippingCustomField,
      // this.customField,
      this.invoiceNo,
      // this.invoicePrefix,
      // this.storeId,
      // this.storeName,
      // this.storeUrl,
      // this.customerId,
      this.firstname,
      this.lastname,
      this.telephone,
      this.email,
      this.paymentFirstname,
      this.paymentLastname,
      this.paymentCompany,
      this.paymentAddress1,
      this.paymentAddress2,
      this.paymentPostcode,
      this.paymentCity,
      this.paymentZoneId,
      this.paymentZone,
      this.paymentZoneCode,
      this.paymentCountryId,
      this.paymentCountry,
      // this.paymentIsoCode2,
      // this.paymentIsoCode3,
      this.paymentAddressFormat,
      this.paymentMethod,
      this.shippingFirstname,
      this.shippingLastname,
      this.shippingCompany,
      this.shippingAddress1,
      this.shippingAddress2,
      this.shippingPostcode,
      this.shippingCity,
      this.shippingZoneId,
      this.shippingZone,
      this.shippingZoneCode,
      this.shippingCountryId,
      this.shippingCountry,
      // this.shippingIsoCode2,
      // this.shippingIsoCode3,
      this.shippingAddressFormat,
      this.shippingMethod,
      this.comment,
      this.total,
      this.orderStatusId,
      // this.languageId,
      // this.currencyId,
      // this.currencyCode,
      // this.currencyValue,
      // this.dateModified,
      this.dateAdded,
      // this.ip,
      this.paymentAddress,
      this.shippingAddress,
      this.products,
      // this.vouchers,
      // this.totals,
      // this.histories,
      this.timestamp,
      this.totals
      //  this.currency,
      });

  factory OrderDetails.fromJson(dynamic json) {
    var orderId = json['order_id'];
    // var paymentCustomField = json['payment_custom_field'] != null ? PaymentCustomField.fromJson(json['payment_custom_field']) : null;
    // var shippingCustomField = json['shipping_custom_field'] != null ? ShippingCustomField.fromJson(json['shipping_custom_field']) : null;
    // var customField = json['custom_field'] != null ? CustomField.fromJson(json['custom_field']) : null;
    var invoiceNo = json['invoice_no'];
    // var invoicePrefix = json['invoice_prefix'];
    // var storeId = json['store_id'];
    // var storeName = json['store_name'];
    // var storeUrl = json['store_url'];
    // var customerId = json['customer_id'];
    var firstname = json['firstname'];
    var lastname = json['lastname'];
    var telephone = json['telephone'];
    var email = json['email'];
    var paymentFirstname = json['payment_firstname'];
    var paymentLastname = json['payment_lastname'];
    var paymentCompany = json['payment_company'];
    var paymentAddress1 = json['payment_address_1'];
    var paymentAddress2 = json['payment_address_2'];
    var paymentPostcode = json['payment_postcode'];
    var paymentCity = json['payment_city'];
    var paymentZoneId = json['payment_zone_id'];
    var paymentZone = json['payment_zone'];
    var paymentZoneCode = json['payment_zone_code'];
    var paymentCountryId = json['payment_country_id'];
    var paymentCountry = json['payment_country'];
    // var paymentIsoCode2 = json['payment_iso_code_2'];
    // var paymentIsoCode3 = json['payment_iso_code_3'];
    var paymentAddressFormat = json['payment_address_format'];
    var paymentMethod = json['payment_method'];
    var shippingFirstname = json['shipping_firstname'];
    var shippingLastname = json['shipping_lastname'];
    var shippingCompany = json['shipping_company'];
    var shippingAddress1 = json['shipping_address_1'];
    var shippingAddress2 = json['shipping_address_2'];
    var shippingPostcode = json['shipping_postcode'];
    var shippingCity = json['shipping_city'];
    var shippingZoneId = json['shipping_zone_id'];
    var shippingZone = json['shipping_zone'];
    var shippingZoneCode = json['shipping_zone_code'];
    var shippingCountryId = json['shipping_country_id'];
    var shippingCountry = json['shipping_country'];
    // var shippingIsoCode2 = json['shipping_iso_code_2'];
    // var shippingIsoCode3 = json['shipping_iso_code_3'];
    var shippingAddressFormat = json['shipping_address_format'];
    var shippingMethod = json['shipping_method'];
    var comment = json['comment'];
    var total = json['total'];
    var orderStatusId = json['order_status_id'];
    // languageId = json['language_id'];
    // currencyId = json['currency_id'];
    // currencyCode = json['currency_code'];
    // currencyValue = json['currency_value'];
    // vardateModified = json['date_modified'];
    var dateAdded = json['date_added'];
    // var ip = json['ip'];
  //  var paymentAddress = json['payment_address'];
  //  var shippingAddress = json['shipping_address'];
    List<ProductFromOrder>? products;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductFromOrder.fromJson(v));
      });
    }
    // if (json['vouchers'] != null) {
    //   vouchers = [];
    //   json['vouchers'].forEach((v) {
    //     vouchers?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<Total>? totals;
    if (json['totals'] != null) {
      totals = [];
      json['totals'].forEach((v) {
        totals?.add(Total.fromJson(v));
      });
    }
    // if (json['histories'] != null) {
    //   histories = [];
    //   json['histories'].forEach((v) {
    //     histories?.add(Histories.fromJson(v));
    //   });
    // }
    // var timestamp = json['timestamp'];
    // currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;

    return OrderDetails(
        firstname: firstname,
        lastname: lastname,
        telephone: telephone,
        email: email,
        total: total,
        paymentMethod: paymentMethod,
        comment: comment,
        dateAdded: dateAdded,
        invoiceNo: invoiceNo,
        orderId: orderId,
        orderStatusId: orderStatusId,
        paymentAddress1: paymentAddress1,
        paymentAddress2: paymentAddress2,
       // paymentAddress: paymentAddress,
        paymentAddressFormat: paymentAddressFormat,
        paymentCity: paymentCity,
        paymentCompany: paymentCompany,
        paymentCountry: paymentCountry,
        paymentCountryId: paymentCountryId,
        paymentFirstname: paymentFirstname,
        paymentLastname: paymentLastname,
        paymentPostcode: paymentPostcode,
        paymentZone: paymentZone,
        paymentZoneCode: paymentZoneCode,
        paymentZoneId: paymentZoneId,
        shippingAddress1: shippingAddress1,
        shippingAddress2: shippingAddress2,
       // shippingAddress: shippingAddress,
        shippingAddressFormat: shippingAddressFormat,
        shippingCity: shippingCity,
        shippingCompany: shippingCompany,
        shippingCountry: shippingCountry,
        shippingCountryId: shippingCountryId,
        shippingFirstname: shippingFirstname,
        shippingLastname: shippingLastname,
        shippingMethod: shippingMethod,
        shippingPostcode: shippingPostcode,
        shippingZone: shippingZone,
        shippingZoneCode: shippingZoneCode,
        shippingZoneId: shippingZoneId,
        products: products,
        totals: totals

        //timestamp: timestamp
        );
  }

  String? orderId;
  // PaymentCustomField? paymentCustomField;
  //ShippingCustomField? shippingCustomField;
  //CustomField? customField;
  String? invoiceNo;
  //String? invoicePrefix;
  //String? storeId;
  //String? storeName;
  //String? storeUrl;
  //String? customerId;
  String? firstname;
  String? lastname;
  String? telephone;
  String? email;
  String? paymentFirstname;
  String? paymentLastname;
  String? paymentCompany;
  String? paymentAddress1;
  String? paymentAddress2;
  String? paymentPostcode;
  String? paymentCity;
  String? paymentZoneId;
  String? paymentZone;
  String? paymentZoneCode;
  String? paymentCountryId;
  String? paymentCountry;
  // String? paymentIsoCode2;
  // String? paymentIsoCode3;
  String? paymentAddressFormat;
  String? paymentMethod;
  String? shippingFirstname;
  String? shippingLastname;
  String? shippingCompany;
  String? shippingAddress1;
  String? shippingAddress2;
  String? shippingPostcode;
  String? shippingCity;
  String? shippingZoneId;
  String? shippingZone;
  String? shippingZoneCode;
  String? shippingCountryId;
  String? shippingCountry;
  // String? shippingIsoCode2;
  // String? shippingIsoCode3;
  String? shippingAddressFormat;
  String? shippingMethod;
  String? comment;
  String? total;
  String? orderStatusId;
  //String? languageId;
  //String? currencyId;
  //String? currencyCode;
  //String? currencyValue;
  //String? dateModified;
  String? dateAdded;
  // String? ip;
  String? paymentAddress;
  String? shippingAddress;
  List<ProductFromOrder>? products;
  //List<dynamic>? vouchers;
  List<Total>? totals;
  // List<Histories>? histories;
  num? timestamp;
  //Currency? currency;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['order_id'] = orderId;
  //   if (paymentCustomField != null) {
  //     map['payment_custom_field'] = paymentCustomField?.toJson();
  //   }
  //   if (shippingCustomField != null) {
  //     map['shipping_custom_field'] = shippingCustomField?.toJson();
  //   }
  //   if (customField != null) {
  //     map['custom_field'] = customField?.toJson();
  //   }
  //   map['invoice_no'] = invoiceNo;
  //   map['invoice_prefix'] = invoicePrefix;
  //   map['store_id'] = storeId;
  //   map['store_name'] = storeName;
  //   map['store_url'] = storeUrl;
  //   map['customer_id'] = customerId;
  //   map['firstname'] = firstname;
  //   map['lastname'] = lastname;
  //   map['telephone'] = telephone;
  //   map['email'] = email;
  //   map['payment_firstname'] = paymentFirstname;
  //   map['payment_lastname'] = paymentLastname;
  //   map['payment_company'] = paymentCompany;
  //   map['payment_address_1'] = paymentAddress1;
  //   map['payment_address_2'] = paymentAddress2;
  //   map['payment_postcode'] = paymentPostcode;
  //   map['payment_city'] = paymentCity;
  //   map['payment_zone_id'] = paymentZoneId;
  //   map['payment_zone'] = paymentZone;
  //   map['payment_zone_code'] = paymentZoneCode;
  //   map['payment_country_id'] = paymentCountryId;
  //   map['payment_country'] = paymentCountry;
  //   map['payment_iso_code_2'] = paymentIsoCode2;
  //   map['payment_iso_code_3'] = paymentIsoCode3;
  //   map['payment_address_format'] = paymentAddressFormat;
  //   map['payment_method'] = paymentMethod;
  //   map['shipping_firstname'] = shippingFirstname;
  //   map['shipping_lastname'] = shippingLastname;
  //   map['shipping_company'] = shippingCompany;
  //   map['shipping_address_1'] = shippingAddress1;
  //   map['shipping_address_2'] = shippingAddress2;
  //   map['shipping_postcode'] = shippingPostcode;
  //   map['shipping_city'] = shippingCity;
  //   map['shipping_zone_id'] = shippingZoneId;
  //   map['shipping_zone'] = shippingZone;
  //   map['shipping_zone_code'] = shippingZoneCode;
  //   map['shipping_country_id'] = shippingCountryId;
  //   map['shipping_country'] = shippingCountry;
  //   map['shipping_iso_code_2'] = shippingIsoCode2;
  //   map['shipping_iso_code_3'] = shippingIsoCode3;
  //   map['shipping_address_format'] = shippingAddressFormat;
  //   map['shipping_method'] = shippingMethod;
  //   map['comment'] = comment;
  //   map['total'] = total;
  //   map['order_status_id'] = orderStatusId;
  //   map['language_id'] = languageId;
  //   map['currency_id'] = currencyId;
  //   map['currency_code'] = currencyCode;
  //   map['currency_value'] = currencyValue;
  //   map['date_modified'] = dateModified;
  //   map['date_added'] = dateAdded;
  //   map['ip'] = ip;
  //   map['payment_address'] = paymentAddress;
  //   map['shipping_address'] = shippingAddress;
  //   if (products != null) {
  //     map['products'] = products?.map((v) => v.toJson()).toList();
  //   }
  //   if (vouchers != null) {
  //     map['vouchers'] = vouchers?.map((v) => v.toJson()).toList();
  //   }
  //   if (totals != null) {
  //     map['totals'] = totals?.map((v) => v.toJson()).toList();
  //   }
  //   if (histories != null) {
  //     map['histories'] = histories?.map((v) => v.toJson()).toList();
  //   }
  //   map['timestamp'] = timestamp;
  //   if (currency != null) {
  //     map['currency'] = currency?.toJson();
  //   }
  //   return map;
  // }
}

// class Currency {
//   Currency({
//       this.currencyId,
//       this.symbolLeft,
//       this.symbolRight,
//       this.decimalPlace,
//       this.value,});
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
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['currency_id'] = currencyId;
//     map['symbol_left'] = symbolLeft;
//     map['symbol_right'] = symbolRight;
//     map['decimal_place'] = decimalPlace;
//     map['value'] = value;
//     return map;
//   }
//
// }

// class Histories {
//   Histories({
//       this.dateAdded,
//       this.status,
//       this.comment,});
//
//   Histories.fromJson(dynamic json) {
//     dateAdded = json['date_added'];
//     status = json['status'];
//     comment = json['comment'];
//   }
//   String? dateAdded;
//   String? status;
//   String? comment;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['date_added'] = dateAdded;
//     map['status'] = status;
//     map['comment'] = comment;
//     return map;
//   }
//
// }

class Total {
  Total({
    this.orderTotalId,
    this.orderId,
    this.code,
    this.title,
    this.value,
    this.sortOrder,
  });

  factory Total.fromJson(dynamic json) {
    var orderTotalId = json['order_total_id'];
    var orderId = json['order_id'];
    var code = json['code'];
    var title = json['title'];
    var value = json['value'];
    var sortOrder = json['sort_order'];

    return Total(
        orderId: orderId,
        orderTotalId: orderTotalId,
        code: code,
        title: title,
        value: value,
        sortOrder: sortOrder);
  }

  String? orderTotalId;
  String? orderId;
  String? code;
  String? title;
  String? value;
  String? sortOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_total_id'] = orderTotalId;
    map['order_id'] = orderId;
    map['code'] = code;
    map['title'] = title;
    map['value'] = value;
    map['sort_order'] = sortOrder;
    return map;
  }
}

class ProductFromOrder {
  ProductFromOrder({
    this.productId,
    this.orderProductId,
    this.name,
    this.model,
    this.option,
    this.quantity,
    this.price,
    this.total,
    this.priceRaw,
    this.totalRaw,
    this.currency
  });

  factory ProductFromOrder.fromJson(dynamic json) {
    var productId = json['product_id'];
    var orderProductId = json['order_product_id'];
    var name = json['name'];
    var model = json['model'];

    // if (json['option'] != null) {
    //   option = [];
    //   json['option'].forEach((v) {
    //     option?.add(Dynamic.fromJson(v));
    //   });
    // }
    var quantity = json['quantity'];
    var price = json['price'];
    var total = json['total'];
    var priceRaw = json['price_raw'];
    var currency = json['0'];
    var totalRaw = json['total_raw'];

    return ProductFromOrder(
      productId: productId,
      orderProductId: orderProductId,
      name: name,
      model: model,
      quantity: quantity,
      price: price,
      total: total,
      totalRaw: totalRaw,
      priceRaw: priceRaw,
      currency: currency
    );
  }
  String? productId;
  String? orderProductId;
  String? name;
  String? model;
  List<dynamic>? option;
  String? quantity;
  String? price;
  String? total;
  num? priceRaw;
  num? totalRaw;
  String? currency;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['product_id'] = productId;
  //   map['order_product_id'] = orderProductId;
  //   map['name'] = name;
  //   map['model'] = model;
  //   if (option != null) {
  //     map['option'] = option?.map((v) => v.toJson()).toList();
  //   }
  //   map['quantity'] = quantity;
  //   map['price'] = price;
  //   map['total'] = total;
  //   map['price_raw'] = priceRaw;
  //   map['0'] = ;
  //   map['total_raw'] = totalRaw;
  //   map['return'] = return;
  //   return map;
  // }
}
//
// class CustomField {
//   CustomField({
//       this.,});
//
//   CustomField.fromJson(dynamic json) {
//      = json['1'];
//   }
//   String? ;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['1'] = ;
//     return map;
//   }
//
// }
//
// class ShippingCustomField {
//   ShippingCustomField({
//       this.,});
//
//   ShippingCustomField.fromJson(dynamic json) {
//      = json['3'];
//   }
//   String? ;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['3'] = ;
//     return map;
//   }
//
// }
//
// class PaymentCustomField {
//   PaymentCustomField({
//       this.,});
//
//   PaymentCustomField.fromJson(dynamic json) {
//      = json['3'];
//   }
//   String? ;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['3'] = ;
//     return map;
//   }
//
// }
