class Product {
  Product(
      {this.productId,
        this.name,
        this.quantity,
        this.price,
        this.description,
        this.productImagePath,
        this.priceFormatted,
        this.rating});

  factory Product.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var priceFormatted = json['price_formated'];
    var rating = json['rating'];
    var productImagePath = json['thumb'];
    var description = json['description'];

    return Product(
        price: price,
        quantity: quantity,
        description: description,
        name: name,
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

// Map<String, dynamic> toJson() {
//   final map = <String, dynamic>{};
//   map['product_id'] = productId;
//   map['seo_url'] = seoUrl;
//   map['thumb'] = thumb;
//   map['name'] = name;
//   map['quantity'] = quantity;
//   map['status'] = status;
//   map['stock_status'] = stockStatus;
//   map['price_excluding_tax'] = priceExcludingTax;
//   map['price_excluding_tax_formated'] = priceExcludingTaxFormated;
//   map['price'] = price;
//   map['price_formated'] = priceFormated;
//   map['special'] = special;
//   map['special_formated'] = specialFormated;
//   map['special_excluding_tax'] = specialExcludingTax;
//   map['special_excluding_tax_formated'] = specialExcludingTaxFormated;
//   if (discounts != null) {
//     map['discounts'] = discounts?.map((v) => v.toJson()).toList();
//   }
//   map['rating'] = rating;
//   map['description'] = description;
//   return map;
// }
}