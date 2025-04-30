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
  ProductFromApi({
    this.id,
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
  });

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

    return ProductFromApi(
      id: id,
      productName: productName,
      notes: notes,
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
