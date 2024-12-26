import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_settings/app_settings_cubit/app_settings_cubit.dart';
import '../../../home/data/models/product.dart';
import '../../../main.dart';

class GetProductsInCategoryResponse {
  GetProductsInCategoryResponse({
    this.success,
    // this.error,
    this.products,
  });

  factory GetProductsInCategoryResponse.fromJson(dynamic json) {
    var success = json['success'];
    // if (json['error'] != null) {
    //   error = [];
    //   json['error'].forEach((v) {
    //     error?.add(Dynamic.fromJson(v));
    //   });
    // }

    List<ProductInCategory>? products;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(ProductInCategory.fromJson(v));
      });
    }
    return GetProductsInCategoryResponse(success: success, products: products);
  }
  num? success;
  // List<dynamic>? error;
  List<ProductInCategory>? products;

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

class ProductInCategory extends Product {
  ProductInCategory(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.description,
      this.productImagePath,
      this.priceFormatted,
        this.stockStatusId,
      this.stockStatus,
      this.rating});

  factory ProductInCategory.fromJson(dynamic json) {
    var productId = json['product_id'];
    var name = json['name'];
    var quantity = json['quantity'];
    var price = json['price'];
    var rating = json['rating'];
    var productImagePath = json['image'];
   // var description = json['description'];
    var priceFormatted = (json['price']?.toString() ?? "").replaceAllMapped(new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]},") +
        ((MyApp.navKey.currentState?.context
                        .read<AppSettingsCubit>()
                        .currencyCode ??
                    "") ==
                "USD"
            ? "\$"
            : "IQD");
    var stockStatus = json['stock_status'];
    var stockStatusId = json['stock_status_id'];
    return ProductInCategory(
        price: price,
        stockStatusId: stockStatusId,
        quantity: quantity,
      //  description: description,
        name: name,
        productImagePath: productImagePath,
        stockStatus: stockStatus,

        productId: productId,
        priceFormatted: priceFormatted,
        rating: rating);
  }
  num? productId;
  String? name;
  num? quantity;
  num? price;
  dynamic rating;
  String? description;
  String? productImagePath;
  String? priceFormatted;
  String? stockStatus;
  num? stockStatusId;
}
// class Product {
//   Product({
//       this.id,
//       this.productId,
//       this.name,
//       this.manufacturer,
//       this.sku,
//       this.model,
//       this.image,
//       this.images,
//       this.originalImage,
//       this.originalImages,
//       this.priceExcludingTax,
//       this.priceExcludingTaxFormated,
//       this.price,
//       this.priceFormated,
//       this.rating,
//       this.description,
//       this.attributeGroups,
//       this.special,
//       this.specialExcludingTax,
//       this.specialExcludingTaxFormated,
//       this.specialFormated,
//       this.specialStartDate,
//       this.specialEndDate,
//       this.discounts,
//       this.options,
//       this.minimum,
//       this.metaTitle,
//       this.metaDescription,
//       this.metaKeyword,
//       this.seoUrl,
//       this.tag,
//       this.upc,
//       this.ean,
//       this.jan,
//       this.isbn,
//       this.mpn,
//       this.location,
//       this.stockStatus,
//       this.stockStatusId,
//       this.manufacturerId,
//       this.taxClassId,
//       this.dateAvailable,
//       this.weight,
//       this.weightClassId,
//       this.length,
//       this.width,
//       this.height,
//       this.lengthClassId,
//       this.subtract,
//       this.sortOrder,
//       this.status,
//       this.dateAdded,
//       this.dateModified,
//       this.viewed,
//       this.weightClass,
//       this.lengthClass,
//       this.shipping,
//       this.reward,
//       this.points,
//       this.category,
//       this.quantity,
//       this.reviews,
//       this.recurrings,});
//
//   Product.fromJson(dynamic json) {
//     id = json['id'];
//     productId = json['product_id'];
//     name = json['name'];
//     manufacturer = json['manufacturer'];
//     sku = json['sku'];
//     model = json['model'];
//     image = json['image'];
//     if (json['images'] != null) {
//       images = [];
//       json['images'].forEach((v) {
//         images?.add(Dynamic.fromJson(v));
//       });
//     }
//     originalImage = json['original_image'];
//     originalImages = json['original_images'] != null ? json['original_images'].cast<String>() : [];
//     priceExcludingTax = json['price_excluding_tax'];
//     priceExcludingTaxFormated = json['price_excluding_tax_formated'];
//     price = json['price'];
//     priceFormated = json['price_formated'];
//     rating = json['rating'];
//     description = json['description'];
//     if (json['attribute_groups'] != null) {
//       attributeGroups = [];
//       json['attribute_groups'].forEach((v) {
//         attributeGroups?.add(Dynamic.fromJson(v));
//       });
//     }
//     special = json['special'];
//     specialExcludingTax = json['special_excluding_tax'];
//     specialExcludingTaxFormated = json['special_excluding_tax_formated'];
//     specialFormated = json['special_formated'];
//     specialStartDate = json['special_start_date'];
//     specialEndDate = json['special_end_date'];
//     if (json['discounts'] != null) {
//       discounts = [];
//       json['discounts'].forEach((v) {
//         discounts?.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['options'] != null) {
//       options = [];
//       json['options'].forEach((v) {
//         options?.add(Dynamic.fromJson(v));
//       });
//     }
//     minimum = json['minimum'];
//     metaTitle = json['meta_title'];
//     metaDescription = json['meta_description'];
//     metaKeyword = json['meta_keyword'];
//     seoUrl = json['seo_url'];
//     tag = json['tag'];
//     upc = json['upc'];
//     ean = json['ean'];
//     jan = json['jan'];
//     isbn = json['isbn'];
//     mpn = json['mpn'];
//     location = json['location'];
//     stockStatus = json['stock_status'];
//     stockStatusId = json['stock_status_id'];
//     manufacturerId = json['manufacturer_id'];
//     taxClassId = json['tax_class_id'];
//     dateAvailable = json['date_available'];
//     weight = json['weight'];
//     weightClassId = json['weight_class_id'];
//     length = json['length'];
//     width = json['width'];
//     height = json['height'];
//     lengthClassId = json['length_class_id'];
//     subtract = json['subtract'];
//     sortOrder = json['sort_order'];
//     status = json['status'];
//     dateAdded = json['date_added'];
//     dateModified = json['date_modified'];
//     viewed = json['viewed'];
//     weightClass = json['weight_class'];
//     lengthClass = json['length_class'];
//     shipping = json['shipping'];
//     reward = json['reward'];
//     points = json['points'];
//     if (json['category'] != null) {
//       category = [];
//       json['category'].forEach((v) {
//         category?.add(Category.fromJson(v));
//       });
//     }
//     quantity = json['quantity'];
//     reviews = json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null;
//     if (json['recurrings'] != null) {
//       recurrings = [];
//       json['recurrings'].forEach((v) {
//         recurrings?.add(Dynamic.fromJson(v));
//       });
//     }
//   }
//   num? id;
//   num? productId;
//   String? name;
//   String? manufacturer;
//   String? sku;
//   String? model;
//   dynamic image;
//   List<dynamic>? images;
//   String? originalImage;
//   List<String>? originalImages;
//   num? priceExcludingTax;
//   String? priceExcludingTaxFormated;
//   num? price;
//   String? priceFormated;
//   num? rating;
//   String? description;
//   List<dynamic>? attributeGroups;
//   num? special;
//   num? specialExcludingTax;
//   String? specialExcludingTaxFormated;
//   String? specialFormated;
//   String? specialStartDate;
//   String? specialEndDate;
//   List<dynamic>? discounts;
//   List<dynamic>? options;
//   String? minimum;
//   String? metaTitle;
//   String? metaDescription;
//   String? metaKeyword;
//   String? seoUrl;
//   String? tag;
//   String? upc;
//   String? ean;
//   String? jan;
//   String? isbn;
//   String? mpn;
//   String? location;
//   String? stockStatus;
//   num? stockStatusId;
//   num? manufacturerId;
//   num? taxClassId;
//   String? dateAvailable;
//   String? weight;
//   num? weightClassId;
//   String? length;
//   String? width;
//   String? height;
//   num? lengthClassId;
//   String? subtract;
//   String? sortOrder;
//   String? status;
//   String? dateAdded;
//   String? dateModified;
//   String? viewed;
//   String? weightClass;
//   String? lengthClass;
//   String? shipping;
//   dynamic reward;
//   String? points;
//   List<Category>? category;
//   num? quantity;
//   Reviews? reviews;
//   List<dynamic>? recurrings;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['product_id'] = productId;
//     map['name'] = name;
//     map['manufacturer'] = manufacturer;
//     map['sku'] = sku;
//     map['model'] = model;
//     map['image'] = image;
//     if (images != null) {
//       map['images'] = images?.map((v) => v.toJson()).toList();
//     }
//     map['original_image'] = originalImage;
//     map['original_images'] = originalImages;
//     map['price_excluding_tax'] = priceExcludingTax;
//     map['price_excluding_tax_formated'] = priceExcludingTaxFormated;
//     map['price'] = price;
//     map['price_formated'] = priceFormated;
//     map['rating'] = rating;
//     map['description'] = description;
//     if (attributeGroups != null) {
//       map['attribute_groups'] = attributeGroups?.map((v) => v.toJson()).toList();
//     }
//     map['special'] = special;
//     map['special_excluding_tax'] = specialExcludingTax;
//     map['special_excluding_tax_formated'] = specialExcludingTaxFormated;
//     map['special_formated'] = specialFormated;
//     map['special_start_date'] = specialStartDate;
//     map['special_end_date'] = specialEndDate;
//     if (discounts != null) {
//       map['discounts'] = discounts?.map((v) => v.toJson()).toList();
//     }
//     if (options != null) {
//       map['options'] = options?.map((v) => v.toJson()).toList();
//     }
//     map['minimum'] = minimum;
//     map['meta_title'] = metaTitle;
//     map['meta_description'] = metaDescription;
//     map['meta_keyword'] = metaKeyword;
//     map['seo_url'] = seoUrl;
//     map['tag'] = tag;
//     map['upc'] = upc;
//     map['ean'] = ean;
//     map['jan'] = jan;
//     map['isbn'] = isbn;
//     map['mpn'] = mpn;
//     map['location'] = location;
//     map['stock_status'] = stockStatus;
//     map['stock_status_id'] = stockStatusId;
//     map['manufacturer_id'] = manufacturerId;
//     map['tax_class_id'] = taxClassId;
//     map['date_available'] = dateAvailable;
//     map['weight'] = weight;
//     map['weight_class_id'] = weightClassId;
//     map['length'] = length;
//     map['width'] = width;
//     map['height'] = height;
//     map['length_class_id'] = lengthClassId;
//     map['subtract'] = subtract;
//     map['sort_order'] = sortOrder;
//     map['status'] = status;
//     map['date_added'] = dateAdded;
//     map['date_modified'] = dateModified;
//     map['viewed'] = viewed;
//     map['weight_class'] = weightClass;
//     map['length_class'] = lengthClass;
//     map['shipping'] = shipping;
//     map['reward'] = reward;
//     map['points'] = points;
//     if (category != null) {
//       map['category'] = category?.map((v) => v.toJson()).toList();
//     }
//     map['quantity'] = quantity;
//     if (reviews != null) {
//       map['reviews'] = reviews?.toJson();
//     }
//     if (recurrings != null) {
//       map['recurrings'] = recurrings?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
//
// }

// class Reviews {
//   Reviews({
//       this.reviewTotal,});
//
//   Reviews.fromJson(dynamic json) {
//     reviewTotal = json['review_total'];
//   }
//   String? reviewTotal;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['review_total'] = reviewTotal;
//     return map;
//   }
//
// }
//
// class Category {
//   Category({
//       this.name,
//       this.id,});
//
//   Category.fromJson(dynamic json) {
//     name = json['name'];
//     id = json['id'];
//   }
//   String? name;
//   num? id;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['name'] = name;
//     map['id'] = id;
//     return map;
//   }
//
// }
