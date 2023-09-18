class GetCategoriesResponse {
  GetCategoriesResponse({
    this.success,
    //this.error,
    this.categories,
  });

  factory GetCategoriesResponse.fromJson(dynamic json) {
    var success = json['success'];
    // List? error;
    // if (json['error'] != null) {
    //  // error = [];
    //   json['error'].forEach((v) {
    //     error?.add("error");
    //   });
    // }
    List<Category>? data;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Category.fromJson(v));
      });
    }

    return GetCategoriesResponse(
      success: success,
      categories: data,
    );
  }

  num? success;
  //List<dynamic>? error;
  List<Category>? categories;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (categories != null) {
  //     map['data'] = categories?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class Category {
  Category({
    this.categoryId,
    this.parentId,
    this.name,
    this.seoUrl,
    this.image,
    this.originalImage,
    // this.filters,
    //  this.categories,
  });

  factory Category.fromJson(dynamic json) {
    var categoryId = json['id'];
    var parentId = json['parent_id'];
    var name = json['name'];
    var seoUrl = json['seo_url'];
    var image = json['image'];
    var originalImage = json['original_image'];
    // var filters =
    //     json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    // if (json['categories'] != null) {
    //   categories = [];
    //   json['categories'].forEach((v) {
    //     categories?.add("");
    //   });
    // }
    return Category(
        name: name,
        image: image,
        categoryId: categoryId,
        //  filters: filters,
        originalImage: originalImage,
        parentId: parentId,
        seoUrl: seoUrl);
  }
  num? categoryId;
  num? parentId;
  String? name;
  String? seoUrl;
  dynamic image;
  String? originalImage;
  //Filters? filters;
  //List<dynamic>? categories;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['category_id'] = categoryId;
  //   map['parent_id'] = parentId;
  //   map['name'] = name;
  //   map['seo_url'] = seoUrl;
  //   map['image'] = image;
  //   map['original_image'] = originalImage;
  //   if (filters != null) {
  //     map['filters'] = filters?.toJson();
  //   }
  //   if (categories != null) {
  //     map['categories'] = categories?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

// class Filters {
//   Filters({
//     this.filterGroups,
//   });
//
//   Filters.fromJson(dynamic json) {
//     if (json['filter_groups'] != null) {
//       filterGroups = [];
//       json['filter_groups'].forEach((v) {
//         filterGroups?.add("");
//       });
//     }
//   }
//   List<dynamic>? filterGroups;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (filterGroups != null) {
//       map['filter_groups'] = filterGroups?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }
