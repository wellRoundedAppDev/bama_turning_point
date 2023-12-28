class GetBrandsResponse {
  GetBrandsResponse({
      this.success, 
      this.errors, 
      this.brands,});

  factory GetBrandsResponse.fromJson(dynamic json) {
    var success = json['success'];
    List<dynamic>? error;
    List<Brand>? brands;
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add(v);
      });
    }
    if (json['data'] != null) {
      brands = [];
      json['data'].forEach((v) {
        brands?.add(Brand.fromJson(v));
      });
    }
    return GetBrandsResponse(success: success,brands: brands,errors: error);
  }
  num? success;
  List<dynamic>? errors;
  List<Brand>? brands;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (errors != null) {
      map['error'] = errors?.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      map['data'] = brands?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Brand {
  Brand({
      this.manufacturerId, 
      this.name, 
      this.image, 
      this.originalImage, 
      this.sortOrder,});

  factory Brand.fromJson(dynamic json) {
    var manufacturerId = json['manufacturer_id'];
    var name = json['name'];
    var image = json['image'];
    var originalImage = json['original_image'];
    var sortOrder = json['sort_order'];
    return Brand(manufacturerId: manufacturerId,name: name,image: image,originalImage: originalImage,sortOrder: sortOrder);

  }
  num? manufacturerId;
  String? name;
  String? image;
  String? originalImage;
  String? sortOrder;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['manufacturer_id'] = manufacturerId;
    map['name'] = name;
    map['image'] = image;
    map['original_image'] = originalImage;
    map['sort_order'] = sortOrder;
    return map;
  }

}