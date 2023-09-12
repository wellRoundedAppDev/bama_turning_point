class GetSlideShowsResponse {
  GetSlideShowsResponse({
    this.success,
    // this.error,
    this.slideShows,
  });

  factory GetSlideShowsResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<SlideShow>? slideShows;
    if (json['data'] != null) {
      slideShows = [];
      json['data'].forEach((v) {
        slideShows?.add(SlideShow.fromJson(v));
      });
    }

    return GetSlideShowsResponse(success: success, slideShows: slideShows);
  }
  num? success;
  // List<dynamic>? error;
  List<SlideShow>? slideShows;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class SlideShow {
  SlideShow({
    this.moduleId,
    this.name,
    this.bannerId,
    this.width,
    this.height,
    this.status,
    this.bannerAds,
  });

  factory SlideShow.fromJson(dynamic json) {
    var moduleId = json['module_id'];
    var name = json['name'];
    var bannerId = json['banner_id'];
    var width = json['width'];
    var height = json['height'];
    var status = json['status'];
    List<BannerAd>? banners;
    if (json['banners'] != null) {
      banners = [];
      json['banners'].forEach((v) {
        banners?.add(BannerAd.fromJson(v));
      });
    }

    return SlideShow(
      name: name,
      status: status,
      moduleId: moduleId,
      bannerId: bannerId,
      bannerAds: banners,
      height: height,
      width: width,
    );
  }
  num? moduleId;
  String? name;
  num? bannerId;
  String? width;
  String? height;
  String? status;
  List<BannerAd>? bannerAds;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['module_id'] = moduleId;
  //   map['name'] = name;
  //   map['banner_id'] = bannerId;
  //   map['width'] = width;
  //   map['height'] = height;
  //   map['status'] = status;
  //   if (banners != null) {
  //     map['banners'] = banners?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class BannerAd {
  BannerAd({
    this.title,
    this.link,
    this.image,
    this.imageOriginal,
  });

  factory BannerAd.fromJson(dynamic json) {
    var title = json['title'];
    var link = json['link'];
    var image = json['image'];
    var imageOriginal = json['image_original'];
    return BannerAd(
        title: title, link: link, image: image, imageOriginal: imageOriginal);
  }
  String? title;
  String? link;
  dynamic image;
  String? imageOriginal;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['title'] = title;
  //   map['link'] = link;
  //   map['image'] = image;
  //   map['image_original'] = imageOriginal;
  //   return map;
  // }
}