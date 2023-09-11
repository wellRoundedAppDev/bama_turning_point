class GetBannersResponse {
  GetBannersResponse({
    this.success,
    // this.error,
    this.banners,
  });

  factory GetBannersResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   var error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<BannerAd>? banners;
    if (json['data'] != null) {
      banners = [];
      json['data'].forEach((v) {
        banners?.add(BannerAd.fromJson(v));
      });
    }
    return GetBannersResponse(success: success, banners: banners);
  }

  num? success;
  // List<dynamic>? error;
  List<BannerAd>? banners;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (banners != null) {
  //     map['data'] = banners?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class BannerAd {
  BannerAd({
    this.bannerId,
    this.name,
    this.status,
    this.checksum,
  });

  factory BannerAd.fromJson(dynamic json) {
    String bannerId = json['banner_id'];
    String name = json['name'];
    String status = json['status'];
    String checksum = json['checksum'];
    return BannerAd(
        name: name, status: status, checksum: checksum, bannerId: bannerId);
  }
  String? bannerId;
  String? name;
  String? status;
  String? checksum;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['banner_id'] = bannerId;
  //   map['name'] = name;
  //   map['status'] = status;
  //   map['checksum'] = checksum;
  //   return map;
  // }
}