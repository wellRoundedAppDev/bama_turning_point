class Product {
  Product(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.description,
      this.productImagePath,
      this.stockStatus,
      this.priceFormatted,
        this.stockStatusId,
      this.rating});

  factory Product.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var priceFormatted = json['price'].replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},");
    var rating = json['rating'];
    var productImagePath = json['thumb'];
    var description = json['description'];
    var stockStatus = json['stock_status'];
    var stockStatusId = json['stock_status_id'];

    return Product(
        price: price,
        quantity: quantity,
        stockStatusId: stockStatusId,
        description: description,
        name: name,
        stockStatus: stockStatus,

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
}
