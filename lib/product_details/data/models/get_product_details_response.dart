import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../main.dart';

class GetProductDetailsResponse {
  GetProductDetailsResponse({
    this.success,
    // this.error,
    this.productDetails,
  });

  factory GetProductDetailsResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }
    var data =
        json['data'] != null ? ProductDetails.fromJson(json['data']) : null;

    return GetProductDetailsResponse(productDetails: data, success: success);
  }
  num? success;
  // List<dynamic>? error;
  ProductDetails? productDetails;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['success'] = success;
  //   if (error != null) {
  //     map['error'] = error?.map((v) => v.toJson()).toList();
  //   }
  //   if (data != null) {
  //     map['data'] = data?.toJson();
  //   }
  //   return map;
  // }
}

class ProductDetails {
  ProductDetails({
    this.id,
    this.productId,
    this.name,
    // this.manufacturer,
    //this.sku,
    // this.model,
    this.image,
    //  this.images,
    this.originalImage,
    this.originalImages,
    this.priceExcludingTax,
    this.priceExcludingTaxFormated,
    this.price,
    this.priceFormated,
    this.rating,
    this.description,
    //  this.attributeGroups,
    this.special,
    this.specialExcludingTax,
    this.specialExcludingTaxFormated,
    this.specialFormated,
    this.specialStartDate,
    this.specialEndDate,
    //this.discounts,
    this.options,
    //this.minimum,
    // this.metaTitle,
    //this.metaDescription,
    // this.metaKeyword,
    //  this.seoUrl,
    // this.tag,
    // this.upc,
    // this.ean,
    //  this.jan,
    //this.isbn,
    // this.mpn,
    // this.location,
    this.stockStatus,
    this.stockStatusId,
    // this.manufacturerId,
    //  this.taxClassId,
    //   this.dateAvailable,
    this.weight,
    this.weightClassId,
    //   this.length,
    //   this.width,
    //  this.height,
    //   this.lengthClassId,
    //   this.subtract,
    //   this.sortOrder,
    // this.status,
    //   this.dateAdded,
    //   this.dateModified,
    //   this.viewed,
    this.weightClass,
    // this.lengthClass,
    // this.shipping,
    // this.reward,
    // this.points,
    this.quantity,
    this.reviews,
    //  this.recurrings,
  });

  factory ProductDetails.fromJson(dynamic json) {
    var id = json['id'];
    var productId = json['product_id'];
    var name = json['name'];
    var manufacturer = json['manufacturer'];
    var sku = json['sku'];
    var model = json['model'];
    var image = json['image'];
    // if (json['images'] != null) {
    //   images = [];
    //   json['images'].forEach((v) {
    //     images?.add(Dynamic.fromJson(v));
    //   });
    // }
    var images = json['images'] != null ? json['images'].cast<String>() : [];
    var originalImage = json['original_image'];
    var originalImages = json['original_images'] != null
        ? json['original_images'].cast<String>()
        : [];
    var priceExcludingTax = json['price_excluding_tax'];
    var priceExcludingTaxFormated =
        (json['price_excluding_tax']?.toString() ?? "") +
            ((MyApp.navKey.currentState?.context
                            .read<AppSettingsCubit>()
                            .currencyCode ??
                        "") ==
                    "USD"
                ? "\$"
                : "IQD");

    var price = json['price'];
    var priceFormatted = (json['price']?.toString() ?? "") +
        ((MyApp.navKey.currentState?.context
                        .read<AppSettingsCubit>()
                        .currencyCode ??
                    "") ==
                "USD"
            ? "\$"
            : "IQD");
    var rating = json['rating'];
    var description = json['description'];
    // if (json['attribute_groups'] != null) {
    //   attributeGroups = [];
    //   json['attribute_groups'].forEach((v) {
    //     attributeGroups?.add(Dynamic.fromJson(v));
    //   });
    // }
    var special = json['special'];
    var specialExcludingTax = json['special_excluding_tax'];
    var specialExcludingTaxFormated = json['special_excluding_tax_formated'];
    var specialFormated = json['special_formated'];
    var specialStartDate = json['special_start_date'];
    var specialEndDate = json['special_end_date'];
    // if (json['discounts'] != null) {
    //   discounts = [];
    //   json['discounts'].forEach((v) {
    //     discounts?.add(Dynamic.fromJson(v));
    //   });
    // }
    List<Option>? options;
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options?.add(Option.fromJson(v));
      });
    }
    // var minimum = json['minimum'];
    // var metaTitle = json['meta_title'];
    // var metaDescription = json['meta_description'];
    //  var metaKeyword = json['meta_keyword'];
    //  var seoUrl = json['seo_url'];
    //  var tag = json['tag'];
    //  var upc = json['upc'];
    //  var ean = json['ean'];
    // var jan = json['jan'];
    // var isbn = json['isbn'];
    //  var mpn = json['mpn'];
    //  var location = json['location'];
    var stockStatus = json['stock_status'];
    var stockStatusId = json['stock_status_id'];
    //  var manufacturerId = json['manufacturer_id'];
    //  var taxClassId = json['tax_class_id'];
    //  var dateAvailable = json['date_available'];
    var weight = json['weight'];
    var weightClassId = json['weight_class_id'];
    // var length = json['length'];
    //var width = json['width'];
    //var height = json['height'];
    //var lengthClassId = json['length_class_id'];
    //var subtract = json['subtract'];
    //var sortOrder = json['sort_order'];
    //var status = json['status'];
    //var dateAdded = json['date_added'];
    //var dateModified = json['date_modified'];
    //var viewed = json['viewed'];
    var weightClass = json['weight_class'];
    // var lengthClass = json['length_class'];
    //var shipping = json['shipping'];
    //var reward = json['reward'];
    //var points = json['points'];
    // if (json['category'] != null) {
    //   category = [];
    //   json['category'].forEach((v) {
    //     category?.add(Category.fromJson(v));
    //   });
    // }
    var quantity = json['quantity'];
    var reviews =
        json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    // if (json['recurrings'] != null) {
    //   recurrings = [];
    //   json['recurrings'].forEach((v) {
    //     recurrings?.add(Dynamic.fromJson(v));
    //   });
    // }
    return ProductDetails(
        id: id,
        quantity: quantity,
        image: image,
        name: name,
        description: description,
        rating: rating,
        reviews: reviews,
        price: price,
        productId: productId,
        specialFormated: specialFormated,
        specialStartDate: specialStartDate,
        specialExcludingTaxFormated: specialExcludingTaxFormated,
        stockStatus: stockStatus,
        specialExcludingTax: specialExcludingTax,
        specialEndDate: specialEndDate,
        special: special,
        priceFormated: priceFormatted,
        priceExcludingTaxFormated: priceExcludingTaxFormated,
        priceExcludingTax: priceExcludingTax,
        originalImage: originalImage,
        originalImages: originalImages,
        stockStatusId: stockStatusId,
        weight: weight,
        weightClass: weightClass,
        weightClassId: weightClassId,
        options: options);
  }
  num? id;
  num? productId;
  String? name;
  // String? manufacturer;
  // String? sku;
  // String? model;
  dynamic image;
  List<String>? images;
  String? originalImage;
  List<String>? originalImages;
  num? priceExcludingTax;
  String? priceExcludingTaxFormated;
  num? price;
  String? priceFormated;
  num? rating;
  String? description;
  // List<dynamic>? attributeGroups;
  num? special;
  num? specialExcludingTax;
  String? specialExcludingTaxFormated;
  String? specialFormated;
  String? specialStartDate;
  String? specialEndDate;
  // List<dynamic>? discounts;
  List<Option>? options;
  // String? minimum;
  // String? metaTitle;
  // String? metaDescription;
  // String? metaKeyword;
  // String? seoUrl;
  // String? tag;
  // String? upc;
  // String? ean;
  // String? jan;
  // String? isbn;
  // String? mpn;
  // String? location;
  String? stockStatus;
  num? stockStatusId;
  // num? manufacturerId;
  // num? taxClassId;
  // String? dateAvailable;
  String? weight;
  num? weightClassId;
  // String? length;
  // String? width;
  // String? height;
  // num? lengthClassId;
  // String? subtract;
  // String? sortOrder;
  // String? status;
  // String? dateAdded;
  // String? dateModified;
  // String? viewed;
  String? weightClass;
  // String? lengthClass;
  // String? shipping;
  // dynamic reward;
  // String? points;
  //List<Category>? category;
  num? quantity;
  Reviews? reviews;
  // List<dynamic>? recurrings;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['id'] = id;
  //   map['product_id'] = productId;
  //   map['name'] = name;
  //   map['manufacturer'] = manufacturer;
  //   map['sku'] = sku;
  //   map['model'] = model;
  //   map['image'] = image;
  //   if (images != null) {
  //     map['images'] = images?.map((v) => v.toJson()).toList();
  //   }
  //   map['original_image'] = originalImage;
  //   map['original_images'] = originalImages;
  //   map['price_excluding_tax'] = priceExcludingTax;
  //   map['price_excluding_tax_formated'] = priceExcludingTaxFormated;
  //   map['price'] = price;
  //   map['price_formated'] = priceFormated;
  //   map['rating'] = rating;
  //   map['description'] = description;
  //   if (attributeGroups != null) {
  //     map['attribute_groups'] =
  //         attributeGroups?.map((v) => v.toJson()).toList();
  //   }
  //   map['special'] = special;
  //   map['special_excluding_tax'] = specialExcludingTax;
  //   map['special_excluding_tax_formated'] = specialExcludingTaxFormated;
  //   map['special_formated'] = specialFormated;
  //   map['special_start_date'] = specialStartDate;
  //   map['special_end_date'] = specialEndDate;
  //   if (discounts != null) {
  //     map['discounts'] = discounts?.map((v) => v.toJson()).toList();
  //   }
  //   if (options != null) {
  //     map['options'] = options?.map((v) => v.toJson()).toList();
  //   }
  //   map['minimum'] = minimum;
  //   map['meta_title'] = metaTitle;
  //   map['meta_description'] = metaDescription;
  //   map['meta_keyword'] = metaKeyword;
  //   map['seo_url'] = seoUrl;
  //   map['tag'] = tag;
  //   map['upc'] = upc;
  //   map['ean'] = ean;
  //   map['jan'] = jan;
  //   map['isbn'] = isbn;
  //   map['mpn'] = mpn;
  //   map['location'] = location;
  //   map['stock_status'] = stockStatus;
  //   map['stock_status_id'] = stockStatusId;
  //   map['manufacturer_id'] = manufacturerId;
  //   map['tax_class_id'] = taxClassId;
  //   map['date_available'] = dateAvailable;
  //   map['weight'] = weight;
  //   map['weight_class_id'] = weightClassId;
  //   map['length'] = length;
  //   map['width'] = width;
  //   map['height'] = height;
  //   map['length_class_id'] = lengthClassId;
  //   map['subtract'] = subtract;
  //   map['sort_order'] = sortOrder;
  //   map['status'] = status;
  //   map['date_added'] = dateAdded;
  //   map['date_modified'] = dateModified;
  //   map['viewed'] = viewed;
  //   map['weight_class'] = weightClass;
  //   map['length_class'] = lengthClass;
  //   map['shipping'] = shipping;
  //   map['reward'] = reward;
  //   map['points'] = points;
  //   if (category != null) {
  //     map['category'] = category?.map((v) => v.toJson()).toList();
  //   }
  //   map['quantity'] = quantity;
  //   if (reviews != null) {
  //     map['reviews'] = reviews?.toJson();
  //   }
  //   if (recurrings != null) {
  //     map['recurrings'] = recurrings?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

class Reviews {
  Reviews({
    this.reviewTotal,
  });

  factory Reviews.fromJson(dynamic json) {
    var reviewTotal = json['review_total'];
    return Reviews(reviewTotal: reviewTotal);
  }
  String? reviewTotal;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['review_total'] = reviewTotal;
  //   return map;
  // }
}

class Option {
  String? optionName;
  int? productOptionId;
  int? optionId;
  String? numberOfRequiredOptions;
  List<OptionValue>? optionValues;

  Option(
      {this.optionName,
      this.optionId,
      this.productOptionId,
      this.numberOfRequiredOptions,
      this.optionValues});

  factory Option.fromJson(dynamic json) {
    int optionId = json['option_id'];
    int productOptionId = json['product_option_id'];
    String numberOfRequiredOptions = json['required'];
    String optionName = json['name'];
    List<OptionValue>? optionValues;
    if (json['option_value'] != null) {
      optionValues = [];
      json['option_value'].forEach((v) {
        optionValues?.add(OptionValue.fromJson(v));
      });
    }

    return Option(
        optionName: optionName,
        productOptionId: productOptionId,
        optionId: optionId,
        optionValues: optionValues,
        numberOfRequiredOptions: numberOfRequiredOptions);
  }
}

class OptionValue {
  String? optionImageUrl;
  int? optionValueId;
  int? productOptionValueId;
  OptionValue(
      {this.optionImageUrl, this.optionValueId, this.productOptionValueId});

  factory OptionValue.fromJson(dynamic json) {
    String imageUrl = json['image'];
    int productOptionValueId = json['product_option_value_id'];
    int optionValueId = json['option_value_id'];
    return OptionValue(
        optionImageUrl: imageUrl,
        productOptionValueId: productOptionValueId,
        optionValueId: optionValueId);
  }
}

// class Category {
//   Category({
//     this.name,
//     this.id,
//   });
//
//   Category.fromJson(dynamic json) {
//     name = json['name'];
//     id = json['id'];
//   }
//   String? name;
//   num? id;
//
//   // Map<String, dynamic> toJson() {
//   //   final map = <String, dynamic>{};
//   //   map['name'] = name;
//   //   map['id'] = id;
//   //   return map;
//   // }
// }
