import 'package:classic_eccomerce/vendors/data/models/get_products_by_vendor_response.dart';

class GetAllProductsResponse {
  GetAllProductsResponse({
    this.isSuccssed,
    this.message,
    this.obj,
  });

  factory GetAllProductsResponse.fromJson(dynamic json) {
    var isSuccssed = json['IsSuccssed'];
    var message = json['Message'];
    var obj = json['Obj'] != null ? Obj.fromJson(json['Obj']) : null;

    return GetAllProductsResponse(
        isSuccssed: isSuccssed, message: message, obj: obj);
  }

  bool? isSuccssed;
  String? message;
  Obj? obj;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSuccssed'] = isSuccssed;
    map['Message'] = message;
    if (obj != null) {
      map['Obj'] = obj?.toJson();
    }
    return map;
  }
}

class Obj {
  Obj({
    this.products,
    this.totalProducts,
    this.totalPages,
    this.pageNumber,
    this.pageSize,
  });

  factory Obj.fromJson(dynamic json) {
    List<ProductFromApi>? products;
    if (json['Products'] != null) {
      products = [];
      json['Products'].forEach((v) {
        products?.add(ProductFromApi.fromJson(v));
      });
    }
    var totalProducts = json['TotalProducts'];
    var totalPages = json['TotalPages'];
    var pageNumber = json['PageNumber'];
    var pageSize = json['PageSize'];

    return Obj(
        pageSize: pageSize,
        pageNumber: pageNumber,
        products: products,
        totalPages: totalPages,
        totalProducts: totalProducts);
  }
  List<ProductFromApi>? products;
  num? totalProducts;
  num? totalPages;
  num? pageNumber;
  num? pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['Products'] = products?.map((v) => v.toJson()).toList();
    }
    map['TotalProducts'] = totalProducts;
    map['TotalPages'] = totalPages;
    map['PageNumber'] = pageNumber;
    map['PageSize'] = pageSize;
    return map;
  }
}

class ProductFromApi {
  ProductFromApi(
      {this.id,
      this.productName,
      this.notes,
      this.source,
      this.groupId,
      this.groupName,
      this.minorUnitId,
      this.minorUnitName,
      this.minorUnitPrice,
      this.middleUnitId,
      this.middleUnitName,
      this.middleUnitPrice,
      this.grandUnitId,
      this.grandUnitName,
      this.grandUnitPrice,
      this.price,
      this.file});

  factory ProductFromApi.fromJson(dynamic json) {
    var id = json['Id'];
    var productName = json['ProductName'];
    var notes = json['Notes'];
    var source = json['Source'];
    var groupId = json['GroupId'];
    var groupName = json['GroupName'];
    var minorUnitId = json['MinorUnitId'];
    var minorUnitName = json['MinorUnitName'];
    var minorUnitPrice = json['MinorUnitPrice'];
    var middleUnitId = json['MiddleUnitId'];
    var middleUnitName = json['MiddleUnitName'];
    var middleUnitPrice = json['MiddleUnitPrice'];
    var grandUnitId = json['GrandUnitId'];
    var grandUnitName = json['GrandUnitName'];
    var grandUnitPrice = json['GrandUnitPrice'];
    var price = json['Price'];

    var file = json['Files']?.map((e) => File.fromJson(e))?.toList() == null ||
            json['Files']?.map((e) => File.fromJson(e))?.toList()?.isEmpty ==
                true
    ?null:
         json['Files']?.map<File>((e) => File.fromJson(e))?.toList()?.first;

    print("xor${file}");

    return ProductFromApi(
      id: id,
      productName: productName,
      notes: notes,
      file: file,
      price: price,
      source: source,
      groupName: groupName,
      grandUnitId: grandUnitId,
      grandUnitName: grandUnitName,
      grandUnitPrice: grandUnitPrice,
      groupId: groupId,
      middleUnitId: middleUnitId,
      middleUnitName: middleUnitName,
      middleUnitPrice: middleUnitPrice,
      minorUnitId: minorUnitId,
      minorUnitName: middleUnitName,
      minorUnitPrice: minorUnitPrice,
    );
  }
  num? id;
  String? productName;
  num? price;
  dynamic notes;
  num? source;
  num? groupId;
  String? groupName;
  num? minorUnitId;
  String? minorUnitName;
  num? minorUnitPrice;
  num? middleUnitId;
  dynamic middleUnitName;
  num? middleUnitPrice;
  num? grandUnitId;
  dynamic grandUnitName;
  num? grandUnitPrice;

  File? file;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['ProductName'] = productName;
    map['Notes'] = notes;
    map['Source'] = source;
    map['GroupId'] = groupId;
    map['GroupName'] = groupName;
    map['MinorUnitId'] = minorUnitId;
    map['MinorUnitName'] = minorUnitName;
    map['MinorUnitPrice'] = minorUnitPrice;
    map['MiddleUnitId'] = middleUnitId;
    map['MiddleUnitName'] = middleUnitName;
    map['MiddleUnitPrice'] = middleUnitPrice;
    map['GrandUnitId'] = grandUnitId;
    map['GrandUnitName'] = grandUnitName;
    map['GrandUnitPrice'] = grandUnitPrice;
    return map;
  }
}


class File {
  File({
    this.fileUrl,
  });

  factory File.fromJson(dynamic json) {
    var fileUrl = json['FileUrl'];

    return File(fileUrl: fileUrl);
  }
  String? fileUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['FileUrl'] = fileUrl;
    return map;
  }
}

class Size {
  Size({
    this.sizeId,
    this.sizeName,
  });

  factory Size.fromJson(dynamic json) {
    var sizeId = json['SizeId'];
    var sizeName = json['SizeName'];

    return Size(sizeId: sizeId, sizeName: sizeName);
  }
  num? sizeId;
  String? sizeName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SizeId'] = sizeId;
    map['SizeName'] = sizeName;
    return map;
  }
}

class Color {
  Color({
    this.colorId,
    this.colorName,
    this.colorValue,
  });

  factory Color.fromJson(dynamic json) {
    var colorId = json['ColorId'];
    var colorName = json['ColorName'];
    var colorValue = json['ColorValue'];

    return Color(
        colorId: colorId, colorName: colorName, colorValue: colorValue);
  }
  num? colorId;
  String? colorName;
  String? colorValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ColorId'] = colorId;
    map['ColorName'] = colorName;
    map['ColorValue'] = colorValue;
    return map;
  }
}
