class GetSupplierResponse {
  bool? isSuccssed;
  String? message;
  List<SupplierAD>? obj;

  GetSupplierResponse({this.isSuccssed, this.message, this.obj});

  GetSupplierResponse.fromJson(Map<String, dynamic> json) {
    isSuccssed = json['IsSuccssed'];
    message = json['Message'];
    if (json['Obj'] != null) {
      obj = <SupplierAD>[];
      json['Obj'].forEach((v) {
        obj!.add(new SupplierAD.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsSuccssed'] = this.isSuccssed;
    data['Message'] = this.message;
    if (this.obj != null) {
      data['Obj'] = this.obj!.map((v) => v.toJson()).toList();
    }
    return data;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SupplierName'] = this.supplierName;
    return data;
  }
}