class FilterProductResponse {
  final bool? isSuccssed;
  final String? message;
  final ProductData? obj;

  FilterProductResponse({this.isSuccssed, this.message, this.obj});

  factory FilterProductResponse.fromJson(Map<String, dynamic> json) {
    return FilterProductResponse(
      isSuccssed: json['IsSuccssed'],
      message: json['Message'],
      obj: json['Obj'] != null ? ProductData.fromJson(json['Obj']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IsSuccssed': isSuccssed,
      'Message': message,
      'Obj': obj?.toJson(),
    };
  }
}

class ProductData {
  final List<Product>? products;
  final int? totalProducts;
  final int? totalPages;
  final int? pageNumber;
  final int? pageSize;

  ProductData({
    this.products,
    this.totalProducts,
    this.totalPages,
    this.pageNumber,
    this.pageSize,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: json['Products'] != null
          ? List<Product>.from(json['Products'].map((x) => Product.fromJson(x)))
          : null,
      totalProducts: json['TotalProducts'],
      totalPages: json['TotalPages'],
      pageNumber: json['PageNumber'],
      pageSize: json['PageSize'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Products': products?.map((x) => x.toJson()).toList(),
      'TotalProducts': totalProducts,
      'TotalPages': totalPages,
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
  }
}

class Product {
  final int? id;
  final String? productName;
  final String? notes;
  final int? source;
  final int? groupId;
  final String? groupName;
  final int? minorUnitId;
  final String? minorUnitName;
  final int? minorUnitPrice;
  final int? middleUnitId;
  final String? middleUnitName;
  final int? middleUnitPrice;
  final int? grandUnitId;
  final String? grandUnitName;
  final int? grandUnitPrice;
  final int? categoryId;
  final String? categoryName;
  final List<BrandSupplier>? brandSuppliers;
  final dynamic colors;
  final int? manufactureCompanyId;

  Product({
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
    this.categoryId,
    this.categoryName,
    this.brandSuppliers,
    this.colors,
    this.manufactureCompanyId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['Id'],
      productName: json['ProductName'],
      notes: json['Notes'],
      source: json['Source'],
      groupId: json['GroupId'],
      groupName: json['GroupName'],
      minorUnitId: json['MinorUnitId'],
      minorUnitName: json['MinorUnitName'],
      minorUnitPrice: json['MinorUnitPrice'],
      middleUnitId: json['MiddleUnitId'],
      middleUnitName: json['MiddleUnitName'],
      middleUnitPrice: json['MiddleUnitPrice'],
      grandUnitId: json['GrandUnitId'],
      grandUnitName: json['GrandUnitName'],
      grandUnitPrice: json['GrandUnitPrice'],
      categoryId: json['CategoryId'],
      categoryName: json['CategoryName'],
      brandSuppliers: json['BrandSuppliers'] != null
          ? List<BrandSupplier>.from(json['BrandSuppliers'].map((x) => BrandSupplier.fromJson(x)))
          : null,
      colors: json['Colors'],
      manufactureCompanyId: json['ManufactureCompanyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'ProductName': productName,
      'Notes': notes,
      'Source': source,
      'GroupId': groupId,
      'GroupName': groupName,
      'MinorUnitId': minorUnitId,
      'MinorUnitName': minorUnitName,
      'MinorUnitPrice': minorUnitPrice,
      'MiddleUnitId': middleUnitId,
      'MiddleUnitName': middleUnitName,
      'MiddleUnitPrice': middleUnitPrice,
      'GrandUnitId': grandUnitId,
      'GrandUnitName': grandUnitName,
      'GrandUnitPrice': grandUnitPrice,
      'CategoryId': categoryId,
      'CategoryName': categoryName,
      'BrandSuppliers': brandSuppliers?.map((x) => x.toJson()).toList(),
      'Colors': colors,
      'ManufactureCompanyId': manufactureCompanyId,
    };
  }
}

class BrandSupplier {
  final int? id;
  final String? idGuid;
  final int? supplierId;
  final String? supplierName;

  BrandSupplier({
    this.id,
    this.idGuid,
    this.supplierId,
    this.supplierName,
  });

  factory BrandSupplier.fromJson(Map<String, dynamic> json) {
    return BrandSupplier(
      id: json['Id'],
      idGuid: json['IdGuid'],
      supplierId: json['SupplierId'],
      supplierName: json['SupplierName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'IdGuid': idGuid,
      'SupplierId': supplierId,
      'SupplierName': supplierName,
    };
  }
}
