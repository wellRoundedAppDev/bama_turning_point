class CartItem {
  String id;
  String name;
  int quantity;
  double price;
  String imagePath;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      this.quantity = 0,
      this.imagePath = ""});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "price": price,
        "imagePath": imagePath
      };
}
