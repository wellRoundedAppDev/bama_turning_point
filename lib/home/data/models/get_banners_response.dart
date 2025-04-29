class GetBannersResponse {
  GetBannersResponse({
    this.isSuccssed,
    this.message,
    this.banners,
  });

  factory GetBannersResponse.fromJson(dynamic json) {
    var isSuccssed = json['IsSuccssed'];
    var message = json['Message'];
    List<BannerAd>? obj;
    if (json['Obj'] != null) {
      obj = [];
      json['Obj'].forEach((v) {
        obj?.add(BannerAd.fromJson(v));
      });
    }

    return GetBannersResponse(
        message: message, isSuccssed: isSuccssed, banners: obj);
  }
  bool? isSuccssed;
  String? message;
  List<BannerAd>? banners;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['IsSuccssed'] = isSuccssed;
    map['Message'] = message;
    if (banners != null) {
      map['Obj'] = banners?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class BannerAd {
  BannerAd({
    this.id,
    this.fileUrl,
  });

  factory BannerAd.fromJson(dynamic json) {
    var id = json['Id'];
    var fileUrl = json['FileUrl']?.replaceAll("\\","/")?.toString()?.replaceFirst("\\","");

    return BannerAd(id: id, fileUrl: fileUrl);
  }
  num? id;
  String? fileUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['FileUrl'] = fileUrl;
    return map;
  }
}
