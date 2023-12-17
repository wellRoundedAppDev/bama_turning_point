class CartItem {
  String productId;
  String name;
  int quantity;
  double price;
  String imagePath;
  int? cartId;
  String? priceFormatted;

  CartItem(
      {required this.productId,
      required this.name,
      required this.price,
      this.cartId,
      this.quantity = 0,
        this.priceFormatted,
      this.imagePath = ""});

  Map<String, dynamic> toJson() => {
        "id": productId,
        "cartId": cartId,
        "name": name,
        "quantity": quantity,
        "price": price,
        "imagePath": imagePath,
    "priceFormatted":priceFormatted
      };
}
