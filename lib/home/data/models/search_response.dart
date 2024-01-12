import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../main.dart';

class SearchResponse {
  SearchResponse({
    this.success,
    this.error,
    this.searchItems,
  });

  factory SearchResponse.fromJson(dynamic json) {
    var success = json['success'];
    List<String>? error;
    if (json['error'] != null) {
      error = [];
      json['error'].forEach((v) {
        error?.add(v.toString());
      });
    }
    List<SearchItem>? searchItems;
    if (json['data'] != null) {
      searchItems = [];
      json['data'].forEach((v) {
        searchItems?.add(SearchItem.fromJson(v));
      });
    }

    return SearchResponse(
        success: success, error: error, searchItems: searchItems);
  }
  num? success;
  List<String>? error;
  List<SearchItem>? searchItems;

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

class SearchItem {
  SearchItem({
    this.id,
    this.productId,
    this.name,
    // this.manufacturer,
    // this.sku,
    // this.model,
    this.image,
    this.images,
    this.originalImage,
    this.originalImages,
    this.priceExcludingTax,
    this.priceExcludingTaxFormated,
    this.price,
    this.priceFormated,
    this.rating,
    this.description,
    // this.attributeGroups,
    // this.special,
    // this.specialExcludingTax,
    // this.specialExcludingTaxFormated,
    // this.specialFormated,
    // this.specialStartDate,
    // this.specialEndDate,
    // this.discounts,
    // this.options,
    // this.minimum,
    // this.metaTitle,
    // this.metaDescription,
    // this.metaKeyword,
    // this.seoUrl,
    // this.tag,
    // this.upc,
    // this.ean,
    // this.jan,
    // this.isbn,
    // this.mpn,
    // this.location,
    this.stockStatus,
    this.stockStatusId,
    // this.manufacturerId,
    // this.taxClassId,
    // this.dateAvailable,
    // this.weight,
    // this.weightClassId,
    // this.length,
    // this.width,
    // this.height,
    // this.lengthClassId,
    // this.subtract,
    // this.sortOrder,
    // this.status,
    // this.dateAdded,
    // this.dateModified,
    // this.viewed,
    // this.weightClass,
    // this.lengthClass,
    // this.shipping,
    // this.reward,
    // this.points,
    this.category,
    this.quantity,
    this.reviews,

    //this.recurrings,
  });

  factory SearchItem.fromJson(dynamic json) {
    var id = json['id'];
    var productId = json['product_id'];
    var name = json['name'];
    var manufacturer = json['manufacturer'];
    var sku = json['sku'];
    var model = json['model'];
    var image = json['image'];
    var images = json['images'] != null ? json['images'].cast<String>() : [];
    var originalImage = json['original_image'];
    var originalImages = json['original_images'] != null
        ? json['original_images'].cast<String>()
        : [];
    var priceExcludingTax = json['price_excluding_tax'];
    var priceExcludingTaxFormated = json['price_excluding_tax_formated'];
    var price = json['price'];
    var priceFormatted = (json['price']?.toString()??"" )+( MyApp.navKey.currentState?.context.read<AppSettingsCubit>().currencyCode??"");
    var rating = json['rating'];
    var description = json['description'];
    // if (json['attribute_groups'] != null) {
    //   attributeGroups = [];
    //   json['attribute_groups'].forEach((v) {
    //     attributeGroups?.add(Dynamic.fromJson(v));
    //   });
    // }
    // special = json['special'];
    // specialExcludingTax = json['special_excluding_tax'];
    // specialExcludingTaxFormated = json['special_excluding_tax_formated'];
    // specialFormated = json['special_formated'];
    // specialStartDate = json['special_start_date'];
    // specialEndDate = json['special_end_date'];
    // if (json['discounts'] != null) {
    //   discounts = [];
    //   json['discounts'].forEach((v) {
    //     discounts?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['options'] != null) {
    //   options = [];
    //   json['options'].forEach((v) {
    //     options?.add(Dynamic.fromJson(v));
    //   });
    // }
    // minimum = json['minimum'];
    // metaTitle = json['meta_title'];
    // metaDescription = json['meta_description'];
    // metaKeyword = json['meta_keyword'];
    // seoUrl = json['seo_url'];
    // tag = json['tag'];
    // upc = json['upc'];
    // ean = json['ean'];
    // jan = json['jan'];
    // isbn = json['isbn'];
    // mpn = json['mpn'];
    // location = json['location'];
    var stockStatus = json['stock_status'];
    var stockStatusId = json['stock_status_id'];
    // manufacturerId = json['manufacturer_id'];
    // taxClassId = json['tax_class_id'];
    // dateAvailable = json['date_available'];
    // weight = json['weight'];
    // weightClassId = json['weight_class_id'];
    // length = json['length'];
    // width = json['width'];
    // height = json['height'];
    // lengthClassId = json['length_class_id'];
    // subtract = json['subtract'];
    // sortOrder = json['sort_order'];
    // status = json['status'];
    // dateAdded = json['date_added'];
    // dateModified = json['date_modified'];
    // viewed = json['viewed'];
    // weightClass = json['weight_class'];
    // lengthClass = json['length_class'];
    // shipping = json['shipping'];
    // reward = json['reward'];
    // points = json['points'];
    List<Category>? category;
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category?.add(Category.fromJson(v));
      });
    }
    var quantity = json['quantity'];
    var reviews =
        json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
    // if (json['recurrings'] != null) {
    //   recurrings = [];
    //   json['recurrings'].forEach((v) {
    //     recurrings?.add(Dynamic.fromJson(v));
    //   });
    // }
    return SearchItem(
      name: name,
      quantity: quantity,
      price: price,
      productId: productId,
      id: id,
      stockStatusId: stockStatusId,
      originalImages: originalImages,
      originalImage: originalImage,
      priceExcludingTax: priceExcludingTax,
      priceExcludingTaxFormated: priceExcludingTaxFormated,
      priceFormated: priceFormatted,
      stockStatus: stockStatus,
      reviews: reviews,
      rating: rating,
      description: description,
      image: image,
      images: images,
      category: category,
    );
  }
  num? id;
  num? productId;
  String? name;
  // dynamic manufacturer;
  // String? sku;
  // String? model;
  String? image;
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
  // num? special;
  // num? specialExcludingTax;
  // String? specialExcludingTaxFormated;
  // String? specialFormated;
  // String? specialStartDate;
  // String? specialEndDate;
  // List<dynamic>? discounts;
  // List<dynamic>? options;
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
  // String? weight;
  // num? weightClassId;
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
  // String? weightClass;
  // String? lengthClass;
  // String? shipping;
  // dynamic reward;
  // String? points;
  List<Category>? category;
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
  //   map['images'] = images;
  //   map['original_image'] = originalImage;
  //   map['original_images'] = originalImages;
  //   map['price_excluding_tax'] = priceExcludingTax;
  //   map['price_excluding_tax_formated'] = priceExcludingTaxFormated;
  //   map['price'] = price;
  //   map['price_formated'] = priceFormated;
  //   map['rating'] = rating;
  //   map['description'] = description;
  //   if (attributeGroups != null) {
  //     map['attribute_groups'] = attributeGroups?.map((v) => v.toJson()).toList();
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

class Category {
  Category({
    this.name,
    this.id,
  });

  factory Category.fromJson(dynamic json) {
    var name = json['name'];
    var id = json['id'];
    return Category(name: name, id: id);
  }
  String? name;
  num? id;

  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['name'] = name;
  //   map['id'] = id;
  //   return map;
  // }
}