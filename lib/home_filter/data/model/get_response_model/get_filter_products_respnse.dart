class FilterProductResponse {
  final bool isSuccssed;
  final String message;
  final ProductData obj;

  FilterProductResponse({
    required this.isSuccssed,
    required this.message,
    required this.obj,
  });

  factory FilterProductResponse.fromJson(Map<String, dynamic> json) {
    return FilterProductResponse(
      isSuccssed: json['IsSuccssed'],
      message: json['Message'],
      obj: ProductData.fromJson(json['Obj']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IsSuccssed': isSuccssed,
      'Message': message,
      'Obj': obj.toJson(),
    };
  }
}

class ProductData {
  final List<Product> products;
  final int totalProducts;
  final int totalPages;
  final int pageNumber;
  final int pageSize;

  ProductData({
    required this.products,
    required this.totalProducts,
    required this.totalPages,
    required this.pageNumber,
    required this.pageSize,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: List<Product>.from(json['Products'].map((x) => Product.fromJson(x))),
      totalProducts: json['TotalProducts'],
      totalPages: json['TotalPages'],
      pageNumber: json['PageNumber'],
      pageSize: json['PageSize'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Products': products.map((x) => x.toJson()).toList(),
      'TotalProducts': totalProducts,
      'TotalPages': totalPages,
      'PageNumber': pageNumber,
      'PageSize': pageSize,
    };
  }
}

class Product {
  final int id;
  final String productName;
  final String? notes;
  final int source;
  final int groupId;
  final String groupName;
  final int minorUnitId;
  final String? minorUnitName;
  final int minorUnitPrice;
  final int middleUnitId;
  final String? middleUnitName;
  final int middleUnitPrice;
  final int grandUnitId;
  final String? grandUnitName;
  final int grandUnitPrice;
  final int categoryId;
  final String? categoryName;
  final List<BrandSupplier> brandSuppliers;
  final dynamic colors;
  final int manufactureCompanyId;

  Product({
    required this.id,
    required this.productName,
    this.notes,
    required this.source,
    required this.groupId,
    required this.groupName,
    required this.minorUnitId,
    this.minorUnitName,
    required this.minorUnitPrice,
    required this.middleUnitId,
    this.middleUnitName,
    required this.middleUnitPrice,
    required this.grandUnitId,
    this.grandUnitName,
    required this.grandUnitPrice,
    required this.categoryId,
    this.categoryName,
    required this.brandSuppliers,
    this.colors,
    required this.manufactureCompanyId,
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
      brandSuppliers: List<BrandSupplier>.from(
          json['BrandSuppliers'].map((x) => BrandSupplier.fromJson(x))),
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
      'BrandSuppliers': brandSuppliers.map((x) => x.toJson()).toList(),
      'Colors': colors,
      'ManufactureCompanyId': manufactureCompanyId,
    };
  }
}

class BrandSupplier {
  final int id;
  final String idGuid;
  final int supplierId;
  final String? supplierName;

  BrandSupplier({
    required this.id,
    required this.idGuid,
    required this.supplierId,
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
