import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../main.dart';

class GetCartResponse {
  GetCartResponse({
    this.success,
    this.error,
    this.data,
  });

  factory GetCartResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data = json['data'].isEmpty == true
        ? null
        : json['data'] != null
            ? Data.fromJson(json['data'])
            : null;

    return GetCartResponse(data: data, success: success);
  }
  num? success;
  List<dynamic>? error;
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
    this.weight,
    this.cartItemsFromApi,
    //this.vouchers,
    this.couponStatus,
    this.coupon,
    this.voucherStatus,
    this.voucher,
    this.rewardStatus,
    this.reward,
    this.totals,
    this.total,
    this.totalRaw,
    this.totalProductCount,
    this.hasShipping,
    this.hasDownload,
    this.hasRecurringProducts,
    // this.currency,
  });

  factory Data.fromJson(dynamic json) {
    var weight = json['weight'];
    List<CartItemFromApi>? cartItemsFromApi;
    if (json['products'] != null) {
      cartItemsFromApi = [];
      json['products'].forEach((v) {
        cartItemsFromApi?.add(CartItemFromApi.fromJson(v));
      });
    }
    // if (json['vouchers'] != null) {
    //   vouchers = [];
    //   json['vouchers'].forEach((v) {
    //     vouchers?.add(Dynamic.fromJson(v));
    //   });
    // }
    var couponStatus = json['coupon_status'];
    var coupon = json['coupon'];
    var voucherStatus = json['voucher_status'];
    var voucher = json['voucher'];
    var rewardStatus = json['reward_status'];
    var reward = json['reward'];
    List<Total>? totals;
    if (json['totals'] != null) {
      totals = [];
      json['totals'].forEach((v) {
        totals?.add(Total.fromJson(v));
      });
    }
    var total = json['total'];
    var totalRaw = json['total_raw'];
    var totalProductCount = json['total_product_count'];
    var hasShipping = json['has_shipping'];
    var hasDownload = json['has_download'];
    var hasRecurringProducts = json['has_recurring_products'];
    // var currency = json['currency'] != null ? Currency.fromJson(json['currency']) : null;

    return Data(
        couponStatus: couponStatus,
        cartItemsFromApi: cartItemsFromApi,
        weight: weight,
        coupon: coupon,
        hasDownload: hasDownload,
        hasRecurringProducts: hasRecurringProducts,
        hasShipping: hasShipping,
        reward: reward,
        rewardStatus: rewardStatus,
        total: total,
        totalProductCount: totalProductCount,
        totalRaw: totalRaw,
        totals: totals,
        voucher: voucher,
        voucherStatus: voucherStatus);
  }
  String? weight;
  List<CartItemFromApi>? cartItemsFromApi;
  List<dynamic>? vouchers;
  String? couponStatus;
  String? coupon;
  String? voucherStatus;
  String? voucher;
  bool? rewardStatus;
  String? reward;
  List<Total>? totals;
  String? total;
  num? totalRaw;
  num? totalProductCount;
  num? hasShipping;
  num? hasDownload;
  num? hasRecurringProducts;
  //Currency? currency;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['weight'] = weight;
  //   if (products != null) {
  //     map['products'] = products?.map((v) => v.toJson()).toList();
  //   }
  //   if (vouchers != null) {
  //     map['vouchers'] = vouchers?.map((v) => v.toJson()).toList();
  //   }
  //   map['coupon_status'] = couponStatus;
  //   map['coupon'] = coupon;
  //   map['voucher_status'] = voucherStatus;
  //   map['voucher'] = voucher;
  //   map['reward_status'] = rewardStatus;
  //   map['reward'] = reward;
  //   if (totals != null) {
  //     map['totals'] = totals?.map((v) => v.toJson()).toList();
  //   }
  //   map['total'] = total;
  //   map['total_raw'] = totalRaw;
  //   map['total_product_count'] = totalProductCount;
  //   map['has_shipping'] = hasShipping;
  //   map['has_download'] = hasDownload;
  //   map['has_recurring_products'] = hasRecurringProducts;
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

class Total {
  Total({
    this.title,
    this.text,
    this.value,
  });

  Total.fromJson(dynamic json) {
    title = json['title'];
    text = json['text'];
    value = json['value'];
  }
  String? title;
  String? text;
  num? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['text'] = text;
    map['value'] = value;
    return map;
  }
}

class CartItemFromApi {
  CartItemFromApi({
    this.key,
    this.thumb,
    this.name,
    this.points,
    this.productId,
    this.model,
    // this.option,
    this.quantity,
    this.recurring,
    this.stock,
    this.reward,
    this.priceFormatted,
    this.total,
    this.priceRaw,
    this.totalRaw,
  });

  factory CartItemFromApi.fromJson(dynamic json) {
    var key = json['key'];
    var thumb = json['thumb'];
    var name = json['name'];
    var points = json['points'];
    var productId = json['product_id'];
    var model = json['model'];
    // if (json['option'] != null) {
    //   option = [];
    //   json['option'].forEach((v) {
    //     option?.add(Dynamic.fromJson(v));
    //   });
    // }
    var quantity = json['quantity'];
    var recurring = json['recurring'];
    var stock = json['stock'];
    var reward = json['reward'];

    var total = json['total'];
    var priceRaw = json['price_raw'];
    var priceFormatted = (json['price']?.toString() ?? "") +
        ((MyApp.navKey.currentState?.context
            .read<AppSettingsCubit>()
            .currencyCode ??
            "") == "USD"?"\$":"IQD");
    var totalRaw = json['total_raw'];
    return CartItemFromApi(
      totalRaw: totalRaw,
      total: total,
      reward: reward,
      productId: productId,
      thumb: thumb,
      model: model,

      stock: stock,
      name: name,
      priceFormatted: priceFormatted,
      quantity: quantity,
      // option: option,
      key: key,
      points: points,
      priceRaw: priceRaw,

      recurring: recurring,
    );
  }
  String? key;
  String? thumb;
  String? name;
  num? points;
  String? productId;
  String? model;
  // List<dynamic>? option;
  String? quantity;
  String? recurring;
  bool? stock;
  String? reward;
  String? priceFormatted;
  String? total;
  num? priceRaw;
  num? totalRaw;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['key'] = key;
  //   map['thumb'] = thumb;
  //   map['name'] = name;
  //   map['points'] = points;
  //   map['product_id'] = productId;
  //   map['model'] = model;
  //   if (option != null) {
  //     map['option'] = option?.map((v) => v.toJson()).toList();
  //   }
  //   map['quantity'] = quantity;
  //   map['recurring'] = recurring;
  //   map['stock'] = stock;
  //   map['reward'] = reward;
  //   map['price'] = price;
  //   map['total'] = total;
  //   map['price_raw'] = priceRaw;
  //   map['total_raw'] = totalRaw;
  //   return map;
  // }
}
