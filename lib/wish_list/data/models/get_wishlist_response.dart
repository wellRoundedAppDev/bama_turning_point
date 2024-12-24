import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/custom_alert2.dart';

class GetWishlistResponse {
  GetWishlistResponse({
    this.success,
    this.wishListItems,
  });

  factory GetWishlistResponse.fromJson(dynamic json) {
    var success = json['success'];
    List<WishlistItem>? wishlistItems;
    if (json['data'] != null) {
      wishlistItems = [];
      json['data'].forEach((v) {
        wishlistItems?.add(WishlistItem.fromJson(v));
      });
    }
    return GetWishlistResponse(wishListItems: wishlistItems, success: success);
  }
  num? success;
  List<WishlistItem>? wishListItems;

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

class WishlistItem {
  WishlistItem({
    this.productId,
    this.productSeoUrl,
    this.thumb,
    this.name,
    this.model,
    this.stock,
    this.price,
    this.special,
  });

  factory WishlistItem.fromJson(dynamic json) {
    var productId = json['product_id'];
    var productSeoUrl = json['product_seo_url'];
    var thumb = json['thumb'];
    var name = json['name'];
    var model = json['model'];
    var stock = json['stock'];
    var price = (json['price']?.toString().split(".").first ?? "") +
        ((MyApp.navKey.currentState?.context
                        .read<AppSettingsCubit>()
                        .currencyCode ??
                    "") ==
                "USD"
            ? "${AppLocalizations.of(context)!.dollar}"
            : "${AppLocalizations.of(context)!.dinar}");
    var special = json['special'];
    return WishlistItem(
      name: name,
      price: price,
      special: special,
      productId: productId,
      thumb: thumb,
      model: model,
      productSeoUrl: productSeoUrl,
      stock: stock,
    );
  }
  String? productId;
  String? productSeoUrl;
  dynamic thumb;
  String? name;
  String? model;
  String? stock;
  String? price;
  dynamic special;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['product_id'] = productId;
  //   map['product_seo_url'] = productSeoUrl;
  //   map['thumb'] = thumb;
  //   map['name'] = name;
  //   map['model'] = model;
  //   map['stock'] = stock;
  //   map['price'] = price;
  //   map['special'] = special;
  //   return map;
  // }
}
