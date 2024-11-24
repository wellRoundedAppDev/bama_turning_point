
class AddUsedProductByClientFormInput {
  String? name;
  String? price;
  String? imagePath;

  List<String>? imageUrls;
  //List<WooCategory>? categories;
  String? phoneNumber;

  bool isUsed;
  String? odometer;
  String? address;
  String? description;

  AddUsedProductByClientFormInput(
      {this.name,
        this.price,
       // this.categories,
        this.imageUrls,
        this.imagePath,
        this.isUsed = true});

}