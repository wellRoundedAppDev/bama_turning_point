/// Status : true
/// Message : "تمت إضافة المنتج بنجاح."
/// Data : {"Id":3,"Name":"freska2","Price":67.0,"Model":"noor-proucdt","PhoneNumber":"01274322776","Address":"alex","Odometer":"568","Description":"وصف المنتج","Source":0,"Status":1,"CreatedAt":"2024-11-25T06:14:47.4011453-08:00","Username":"01282333934","Images":[{"Id":3,"Url":"/Uploades/a4f1df48-6e09-4d43-af48-da9eec95eca8_appstore.png","ProductId":3}]}

class AddUsedProductResponse {
  AddUsedProductResponse({
    this.status,
    this.message,
    this.data,
  });

  factory AddUsedProductResponse.fromJson(dynamic json) {
    var status = json['Status'];
    var message = json['Message'];
    var data = json['Data'] != null ? Data.fromJson(json['Data']) : null;

    return AddUsedProductResponse(status: status, message: message, data: data);
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    return map;
  }
}

/// Id : 3
/// Name : "freska2"
/// Price : 67.0
/// Model : "noor-proucdt"
/// PhoneNumber : "01274322776"
/// Address : "alex"
/// Odometer : "568"
/// Description : "وصف المنتج"
/// Source : 0
/// Status : 1
/// CreatedAt : "2024-11-25T06:14:47.4011453-08:00"
/// Username : "01282333934"
/// Images : [{"Id":3,"Url":"/Uploades/a4f1df48-6e09-4d43-af48-da9eec95eca8_appstore.png","ProductId":3}]

class Data {
  Data({
    this.id,
    this.name,
    this.price,
    this.model,
    this.phoneNumber,
    this.address,
    this.odometer,
    this.description,
    this.source,
    this.status,
    this.createdAt,
    this.username,
    this.images,
  });

  factory Data.fromJson(dynamic json) {
    var id = json['Id'];
    var name = json['Name'];
    var price = json['Price'];
    var model = json['Model'];
    var phoneNumber = json['PhoneNumber'];
    var address = json['Address'];
    var odometer = json['Odometer'];
    var description = json['Description'];
    var source = json['Source'];
    var status = json['Status'];
    var createdAt = json['CreatedAt'];
    var username = json['Username'];
    List<ProductImage>? images;
    if (json['Images'] != null) {
      images = [];
      json['Images'].forEach((v) {
        images?.add(ProductImage.fromJson(v));
      });
    }

    return Data(
        address: address,
        images: images,
        username: username,
        createdAt: createdAt,
        source: source,
        status: status,
        description: description,
        odometer: odometer,
        id: id,
        name: name,
        phoneNumber: phoneNumber,
        price: price,
        model: model);
  }
  num? id;
  String? name;
  num? price;
  String? model;
  String? phoneNumber;
  String? address;
  String? odometer;
  String? description;
  num? source;
  num? status;
  String? createdAt;
  String? username;
  List<ProductImage>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Name'] = name;
    map['Price'] = price;
    map['Model'] = model;
    map['PhoneNumber'] = phoneNumber;
    map['Address'] = address;
    map['Odometer'] = odometer;
    map['Description'] = description;
    map['Source'] = source;
    map['Status'] = status;
    map['CreatedAt'] = createdAt;
    map['Username'] = username;
    if (images != null) {
      map['Images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// Id : 3
/// Url : "/Uploades/a4f1df48-6e09-4d43-af48-da9eec95eca8_appstore.png"
/// ProductId : 3

class ProductImage {
  ProductImage({
    this.id,
    this.url,
    this.productId,
  });

  factory ProductImage.fromJson(dynamic json) {
    var id = json['Id'];
    var url = json['Url'];
    var productId = json['ProductId'];
    return ProductImage(id: id, url: url, productId: productId);
  }
  num? id;
  String? url;
  num? productId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['Url'] = url;
    map['ProductId'] = productId;
    return map;
  }
}
