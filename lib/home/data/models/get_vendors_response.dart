class GetVendorsResponse {
  GetVendorsResponse({
    this.isSuccssed,
    this.message,
    this.vendors,
  });

  factory GetVendorsResponse.fromJson(dynamic json) {
    var isSuccssed = json['IsSuccssed'];
    var message = json['Message'];
    List<Vendor>? vendors;
    if (json['Obj'] != null) {
      vendors = [];
      json['Obj'].forEach((v) {
        vendors?.add(Vendor.fromJson(v));
      });
    }

    return GetVendorsResponse(
        isSuccssed: isSuccssed, message: message, vendors: vendors);
  }
  bool? isSuccssed;
  String? message;
  List<Vendor>? vendors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSuccssed'] = isSuccssed;
    map['Message'] = message;
    if (vendors != null) {
      map['Obj'] = vendors?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Vendor {
  Vendor({
    this.id,
    this.supplierName,
  });

  factory Vendor.fromJson(dynamic json) {
   var id = json['Id'];
   var supplierName = json['SupplierName'];

   return Vendor(id: id,supplierName: supplierName);
  }
  num? id;
  String? supplierName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['SupplierName'] = supplierName;
    return map;
  }
}
