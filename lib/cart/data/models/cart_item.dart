class CartItem {
  String productId;
  String name;
  int quantity;
  double price;
  String imagePath;
  int? cartId;
  String? priceFormatted;
  Map<String, dynamic>? option;

  int? unitId;
  String? unitName;
  int? productSource;

  CartItem(
      {required this.productId,
      required this.name,
      required this.price,
      this.cartId,
      this.quantity = 0,
      this.option = const {},
      this.priceFormatted,
      this.imagePath = "",
      this.productSource,
      this.unitId,
      this.unitName});

  Map<String, dynamic> toJson() => {
        "id": productId,
        "cartId": cartId,
        "name": name,
        "quantity": quantity,
        "price": price,
        "imagePath": imagePath,
        "priceFormatted": priceFormatted,
        "option": option?['option'],
        "productSource": productSource,
        "unitId": unitId,
        "unitName": unitName
      };
}
