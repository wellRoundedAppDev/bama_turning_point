import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared_components/custom_alert2.dart';


class Product {
  Product(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
        this.productSource,
      this.description,
      this.productImagePath,
        this.isInFavorites,

      this.stockStatus,
      this.priceFormatted,
        this.stockStatusId,
      this.rating});

  factory Product.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var priceFormatted = json['price']
        .replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},")
        ==
        "USD"
        ?
    "${AppLocalizations.of(context)!.dollar}":
    "${AppLocalizations.of(context)!.dinar}";

    ;
    var rating = json['rating'];
    var productImagePath = json['thumb'];
    var description = json['description'];
    var stockStatus = json['stock_status'];
    var stockStatusId = json['stock_status_id'];
    var isInFavorites = json['IsAddedToFavorites'];


    return Product(
        price: price,
        quantity: quantity,
        stockStatusId: stockStatusId,
        description: description,
        name: name,
        stockStatus: stockStatus,
        isInFavorites: isInFavorites,
        productImagePath: productImagePath,
        productId: productId,
        priceFormatted: priceFormatted,
        rating: rating);
  }
  num? productId;
  String? name;
  num? quantity;
  num? price;
  dynamic rating;
  String? description;
  String? productImagePath;
  String? priceFormatted;
  String? stockStatus;
  num? stockStatusId;
  int? productSource;

  bool? isInFavorites;
}
