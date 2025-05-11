
import '../../../home/data/models/get_all_products_response.dart';

class GetFavoritesResponse {
  GetFavoritesResponse({
      this.isSuccssed, 
      this.message, 
      this.obj,});

 factory  GetFavoritesResponse.fromJson(dynamic json) {
   var isSuccssed = json['IsSuccssed'];
   var message = json['Message'];
   var obj = json['Obj'] != null ? Obj.fromJson(json['Obj']) : null;

   return GetFavoritesResponse(isSuccssed: isSuccssed,message:
   message,obj: obj);
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
      this.totalCount, 
      this.totalPages, 
      this.pageNumber, 
      this.pageSize,});

  factory Obj.fromJson(dynamic json) {
    List<FavoriteItem>? favoriteItems;
    if (json['Products'] != null) {
      favoriteItems = [];
      json['Products'].forEach((v) {
        favoriteItems?.add(FavoriteItem.fromJson(v));
      });
    }
    var totalCount = json['TotalCount'];
    var totalPages = json['TotalPages'];

   var pageNumber = json['PageNumber'];
   var     pageSize = json['PageSize'];

   return Obj(products: favoriteItems,totalPages: totalPages,
   totalCount: totalCount,pageSize: pageSize,pageNumber: pageNumber);
  }
  List<FavoriteItem>? products;
  num? totalCount;
  num? totalPages;
  num? pageNumber;
  num? pageSize;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (products != null) {
      map['Products'] = products?.map((v) => v.toJson()).toList();
    }
    map['TotalCount'] = totalCount;
    map['TotalPages'] = totalPages;
    map['PageNumber'] = pageNumber;
    map['PageSize'] = pageSize;
    return map;
  }

}

class FavoriteItem {
  FavoriteItem({
      this.userId, 
      this.brandId, 
      this.brandVendorId,
    this.files,
      this.brandName, 
      this.source,});

  factory FavoriteItem.fromJson(dynamic json) {
    var   userId = json['UserId'];
    var   brandId = json['BrandId'];
    var   brandVendorId = json['BrandVendorId'];
    var   brandName = json['BrandName'];
    var   source = json['Source'];
    List<File>? files;
    if(json['Files'] != null){
      files = json['Files']?.map<File>((e)=>File.fromJson(e))?.toList()??[];
    }

    return FavoriteItem(userId: userId,brandId: brandId, brandName: brandName,
        source: source,
        files: files,
        brandVendorId: brandVendorId);
  }
  String? userId;
  num? brandId;
  dynamic brandVendorId;
  String? brandName;
  num? source;
  List<File>? files;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserId'] = userId;
    map['BrandId'] = brandId;
    map['BrandVendorId'] = brandVendorId;
    map['BrandName'] = brandName;
    map['Source'] = source;
    return map;
  }

}