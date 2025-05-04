class GetSupplierResponse {
  bool? isSuccssed;
  String? message;
  List<SupplierAD>? obj;

  GetSupplierResponse({this.isSuccssed, this.message, this.obj});

  GetSupplierResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['IsSuccssed'];
    message = json['Message'];
    if (json['Obj'] != null) {
      obj = List<SupplierAD>.from(json['Obj'].map((v) => SupplierAD.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'IsSuccssed': isSuccssed,
      'Message': message,
      'Obj': obj?.map((v) => v.toJson()).toList(),
    };
  }
}

class SupplierAD {
  int? id;
  String? supplierName;

  SupplierAD({this.id, this.supplierName});

  SupplierAD.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    supplierName = json['SupplierName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SupplierName': supplierName,
    };
  }
}
